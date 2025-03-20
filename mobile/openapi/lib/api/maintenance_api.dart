//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class MaintenanceApi {
  MaintenanceApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'POST /rooms/{roomId}/maintenance' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] roomId (required):
  ///   ID of the room
  ///
  /// * [CreateMaintenanceDto] createMaintenanceDto (required):
  Future<Response> maintenanceControllerCreateWithHttpInfo(String roomId, CreateMaintenanceDto createMaintenanceDto,) async {
    // ignore: prefer_const_declarations
    final path = r'/rooms/{roomId}/maintenance'
      .replaceAll('{roomId}', roomId);

    // ignore: prefer_final_locals
    Object? postBody = createMaintenanceDto;

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
  /// * [String] roomId (required):
  ///   ID of the room
  ///
  /// * [CreateMaintenanceDto] createMaintenanceDto (required):
  Future<void> maintenanceControllerCreate(String roomId, CreateMaintenanceDto createMaintenanceDto,) async {
    final response = await maintenanceControllerCreateWithHttpInfo(roomId, createMaintenanceDto,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'GET /rooms/{roomId}/maintenance' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] roomId (required):
  ///   ID of the room
  Future<Response> maintenanceControllerFindAllWithHttpInfo(String roomId,) async {
    // ignore: prefer_const_declarations
    final path = r'/rooms/{roomId}/maintenance'
      .replaceAll('{roomId}', roomId);

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
  /// * [String] roomId (required):
  ///   ID of the room
  Future<void> maintenanceControllerFindAll(String roomId,) async {
    final response = await maintenanceControllerFindAllWithHttpInfo(roomId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'GET /rooms/{roomId}/maintenance/{id}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   ID of the maintenance record
  Future<Response> maintenanceControllerFindOneWithHttpInfo(String id,) async {
    // ignore: prefer_const_declarations
    final path = r'/rooms/{roomId}/maintenance/{id}'
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
  ///   ID of the maintenance record
  Future<void> maintenanceControllerFindOne(String id,) async {
    final response = await maintenanceControllerFindOneWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'DELETE /rooms/{roomId}/maintenance/{id}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   ID of the maintenance record
  Future<Response> maintenanceControllerRemoveWithHttpInfo(String id,) async {
    // ignore: prefer_const_declarations
    final path = r'/rooms/{roomId}/maintenance/{id}'
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
  ///   ID of the maintenance record
  Future<void> maintenanceControllerRemove(String id,) async {
    final response = await maintenanceControllerRemoveWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'PUT /rooms/{roomId}/maintenance/{id}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   ID of the maintenance record
  ///
  /// * [Object] body (required):
  Future<Response> maintenanceControllerUpdateWithHttpInfo(String id, Object body,) async {
    // ignore: prefer_const_declarations
    final path = r'/rooms/{roomId}/maintenance/{id}'
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
  ///   ID of the maintenance record
  ///
  /// * [Object] body (required):
  Future<void> maintenanceControllerUpdate(String id, Object body,) async {
    final response = await maintenanceControllerUpdateWithHttpInfo(id, body,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }
}
