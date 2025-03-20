//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

library openapi.api;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'api_client.dart';
part 'api_helper.dart';
part 'api_exception.dart';
part 'auth/authentication.dart';
part 'auth/api_key_auth.dart';
part 'auth/oauth.dart';
part 'auth/http_basic_auth.dart';
part 'auth/http_bearer_auth.dart';

part 'api/assets_api.dart';
part 'api/authentication_api.dart';
part 'api/maintenance_api.dart';
part 'api/media_api.dart';
part 'api/properties_api.dart';
part 'api/rooms_api.dart';
part 'api/service_providers_api.dart';
part 'api/users_api.dart';
part 'api/users_admin_api.dart';

part 'model/change_password_dto.dart';
part 'model/create_asset_dto.dart';
part 'model/create_maintenance_dto.dart';
part 'model/create_media_dto.dart';
part 'model/create_property_dto.dart';
part 'model/create_room_dto.dart';
part 'model/create_service_provider_dto.dart';
part 'model/create_user_dto.dart';
part 'model/image_dto.dart';
part 'model/login_dto.dart';
part 'model/sign_up_dto.dart';
part 'model/user_admin_create_dto.dart';
part 'model/user_admin_update_dto.dart';


/// An [ApiClient] instance that uses the default values obtained from
/// the OpenAPI specification file.
var defaultApiClient = ApiClient();

const _delimiters = {'csv': ',', 'ssv': ' ', 'tsv': '\t', 'pipes': '|'};
const _dateEpochMarker = 'epoch';
const _deepEquality = DeepCollectionEquality();
final _dateFormatter = DateFormat('yyyy-MM-dd');
final _regList = RegExp(r'^List<(.*)>$');
final _regSet = RegExp(r'^Set<(.*)>$');
final _regMap = RegExp(r'^Map<String,(.*)>$');

bool _isEpochMarker(String? pattern) => pattern == _dateEpochMarker || pattern == '/$_dateEpochMarker/';
