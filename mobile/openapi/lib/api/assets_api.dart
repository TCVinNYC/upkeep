//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class AssetsApi {
  AssetsApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'POST /assets' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [CreateAssetDto] createAssetDto (required):
  Future<Response> assetsControllerCreateWithHttpInfo(CreateAssetDto createAssetDto,) async {
    // ignore: prefer_const_declarations
    final path = r'/assets';

    // ignore: prefer_final_locals
    Object? postBody = createAssetDto;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [CreateAssetDto] createAssetDto (required):
  Future<void> assetsControllerCreate(CreateAssetDto createAssetDto,) async {
    final response = await assetsControllerCreateWithHttpInfo(createAssetDto,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'GET /assets' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] ownerType:
  ///   Filter by parent type (e.g., room, floor, property)
  ///
  /// * [num] ownerId:
  ///   Filter by parent entity ID
  Future<Response> assetsControllerFindAllWithHttpInfo({ String? ownerType, num? ownerId, }) async {
    // ignore: prefer_const_declarations
    final path = r'/assets';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (ownerType != null) {
      queryParams.addAll(_queryParams('', 'ownerType', ownerType));
    }
    if (ownerId != null) {
      queryParams.addAll(_queryParams('', 'ownerId', ownerId));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [String] ownerType:
  ///   Filter by parent type (e.g., room, floor, property)
  ///
  /// * [num] ownerId:
  ///   Filter by parent entity ID
  Future<void> assetsControllerFindAll({ String? ownerType, num? ownerId, }) async {
    final response = await assetsControllerFindAllWithHttpInfo( ownerType: ownerType, ownerId: ownerId, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'GET /assets/{id}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   ID of the asset
  Future<Response> assetsControllerFindOneWithHttpInfo(String id,) async {
    // ignore: prefer_const_declarations
    final path = r'/assets/{id}'
      .replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [String] id (required):
  ///   ID of the asset
  Future<void> assetsControllerFindOne(String id,) async {
    final response = await assetsControllerFindOneWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'DELETE /assets/{id}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   ID of the asset
  Future<Response> assetsControllerRemoveWithHttpInfo(String id,) async {
    // ignore: prefer_const_declarations
    final path = r'/assets/{id}'
      .replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [String] id (required):
  ///   ID of the asset
  Future<void> assetsControllerRemove(String id,) async {
    final response = await assetsControllerRemoveWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'PUT /assets/{id}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   ID of the asset
  ///
  /// * [Object] body (required):
  Future<Response> assetsControllerUpdateWithHttpInfo(String id, Object body,) async {
    // ignore: prefer_const_declarations
    final path = r'/assets/{id}'
      .replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody = body;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [String] id (required):
  ///   ID of the asset
  ///
  /// * [Object] body (required):
  Future<void> assetsControllerUpdate(String id, Object body,) async {
    final response = await assetsControllerUpdateWithHttpInfo(id, body,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }
}
