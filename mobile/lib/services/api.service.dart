import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:logging/logging.dart';
import 'package:openapi/api.dart';
import 'package:upkeep_mobile/domain/models/store.model.dart';
import 'package:upkeep_mobile/entities/store.entity.dart';
import 'package:upkeep_mobile/utils/url_helper.dart';

class ApiService implements Authentication {
  late ApiClient _apiClient;

  late UsersApi usersApi;
  late AuthenticationApi authenticationApi;
  late AssetsApi assetsApi;

  ApiService() {
    final endpoint = Store.tryGet(StoreKey.serverEndpoint);
    if (endpoint != null && endpoint.isNotEmpty) {
      setEndpoint(endpoint);
    }
  }
  String? _accessToken;
  final _log = Logger("ApiService");

  setEndpoint(String endpoint) {
    _apiClient = ApiClient(basePath: endpoint, authentication: this);
    if (_accessToken != null) {
      setAccessToken(_accessToken!);
    }
    usersApi = UsersApi(_apiClient);
    authenticationApi = AuthenticationApi(_apiClient);
    assetsApi = AssetsApi(_apiClient);
  }

  Future<String> resolveAndSetEndpoint(String serverUrl) async {
    final endpoint = await resolveEndpoint(serverUrl);
    setEndpoint(endpoint);

    // Save in local database for next startup
    Store.put(StoreKey.serverEndpoint, endpoint);
    return endpoint;
  }

  /// Takes a server URL and attempts to resolve the API endpoint.
  ///
  /// Input: [schema://]host[:port][/path]
  ///  schema - optional (default: https)
  ///  host   - required
  ///  port   - optional (default: based on schema)
  ///  path   - optional
  Future<String> resolveEndpoint(String serverUrl) async {
    String url = sanitizeUrl(serverUrl);

    // Check for /.well-known/immich
    final wellKnownEndpoint = await _getWellKnownEndpoint(url);
    if (wellKnownEndpoint.isNotEmpty) {
      url = sanitizeUrl(wellKnownEndpoint);
    }

    if (!await _isEndpointAvailable(url)) {
      throw ApiException(503, "Server is not reachable");
    }

    // Otherwise, assume the URL provided is the api endpoint
    return url;
  }

  Future<bool> _isEndpointAvailable(String serverUrl) async {
    if (!serverUrl.endsWith('/api')) {
      serverUrl += '/api';
    }

    try {
      await setEndpoint(serverUrl);
      // await serverInfoApi.pingServer().timeout(const Duration(seconds: 5));
    } on TimeoutException catch (_) {
      return false;
    } on SocketException catch (_) {
      return false;
    } catch (error, stackTrace) {
      _log.severe(
        "Error while checking server availability",
        error,
        stackTrace,
      );
      return false;
    }
    return true;
  }

  Future<String> _getWellKnownEndpoint(String baseUrl) async {
    final Client client = Client();

    try {
      var headers = {"Accept": "application/json"};
      headers.addAll(getRequestHeaders());

      final res = await client
          .get(
            Uri.parse("$baseUrl/.well-known/immich"),
            headers: headers,
          )
          .timeout(const Duration(seconds: 5));

      if (res.statusCode == 200) {
        final data = jsonDecode(res.body);
        final endpoint = data['api']['endpoint'].toString();

        if (endpoint.startsWith('/')) {
          // Full URL is relative to base
          return "$baseUrl$endpoint";
        }
        return endpoint;
      }
    } catch (e) {
      debugPrint("Could not locate /.well-known/immich at $baseUrl");
    }

    return "";
  }

  Future<void> setAccessToken(String accessToken) async {
    _accessToken = accessToken;
    await Store.put(StoreKey.accessToken, accessToken);
  }

  Future<void> setDeviceInfoHeader() async {
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

    if (Platform.isIOS) {
      final iosInfo = await deviceInfoPlugin.iosInfo;
      authenticationApi.apiClient
          .addDefaultHeader('deviceModel', iosInfo.utsname.machine);
      authenticationApi.apiClient.addDefaultHeader('deviceType', 'iOS');
    } else {
      final androidInfo = await deviceInfoPlugin.androidInfo;
      authenticationApi.apiClient
          .addDefaultHeader('deviceModel', androidInfo.model);
      authenticationApi.apiClient.addDefaultHeader('deviceType', 'Android');
    }
  }

  static Map<String, String> getRequestHeaders() {
    var accessToken = Store.get(StoreKey.accessToken, "");
    var header = <String, String>{};
    if (accessToken.isNotEmpty) {
      header['x-immich-user-token'] = accessToken;
    }
    return header;
  }

  @override
  Future<void> applyToParams(
    List<QueryParam> queryParams,
    Map<String, String> headerParams,
  ) {
    return Future<void>(() {
      var headers = ApiService.getRequestHeaders();
      headerParams.addAll(headers);
    });
  }

  ApiClient get apiClient => _apiClient;
}
