//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class UsersAdminApi {
  UsersAdminApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'POST /admin/users' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [UserAdminCreateDto] userAdminCreateDto (required):
  Future<Response> userAdminControllerCreateUserAdminWithHttpInfo(UserAdminCreateDto userAdminCreateDto,) async {
    // ignore: prefer_const_declarations
    final path = r'/admin/users';

    // ignore: prefer_final_locals
    Object? postBody = userAdminCreateDto;

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
  /// * [UserAdminCreateDto] userAdminCreateDto (required):
  Future<void> userAdminControllerCreateUserAdmin(UserAdminCreateDto userAdminCreateDto,) async {
    final response = await userAdminControllerCreateUserAdminWithHttpInfo(userAdminCreateDto,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'DELETE /admin/users/{id}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   User ID to delete
  Future<Response> userAdminControllerDeleteUserAdminWithHttpInfo(String id,) async {
    // ignore: prefer_const_declarations
    final path = r'/admin/users/{id}'
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
  ///   User ID to delete
  Future<void> userAdminControllerDeleteUserAdmin(String id,) async {
    final response = await userAdminControllerDeleteUserAdminWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'PUT /admin/users/{id}/disable' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   User ID to disable
  Future<Response> userAdminControllerDisableUserAdminWithHttpInfo(String id,) async {
    // ignore: prefer_const_declarations
    final path = r'/admin/users/{id}/disable'
      .replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


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
  ///   User ID to disable
  Future<void> userAdminControllerDisableUserAdmin(String id,) async {
    final response = await userAdminControllerDisableUserAdminWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'PUT /admin/users/{id}/enable' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   User ID to enable
  Future<Response> userAdminControllerEnableUserAdminWithHttpInfo(String id,) async {
    // ignore: prefer_const_declarations
    final path = r'/admin/users/{id}/enable'
      .replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


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
  ///   User ID to enable
  Future<void> userAdminControllerEnableUserAdmin(String id,) async {
    final response = await userAdminControllerEnableUserAdminWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'GET /admin/users/{id}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   User ID
  Future<Response> userAdminControllerGetUserAdminWithHttpInfo(String id,) async {
    // ignore: prefer_const_declarations
    final path = r'/admin/users/{id}'
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
  ///   User ID
  Future<void> userAdminControllerGetUserAdmin(String id,) async {
    final response = await userAdminControllerGetUserAdminWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'POST /admin/users/{id}/restore' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   User ID to restore
  Future<Response> userAdminControllerRestoreUserAdminWithHttpInfo(String id,) async {
    // ignore: prefer_const_declarations
    final path = r'/admin/users/{id}/restore'
      .replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


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
  /// * [String] id (required):
  ///   User ID to restore
  Future<void> userAdminControllerRestoreUserAdmin(String id,) async {
    final response = await userAdminControllerRestoreUserAdminWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'GET /admin/users' operation and returns the [Response].
  Future<Response> userAdminControllerSearchUsersAdminWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/admin/users';

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

  Future<void> userAdminControllerSearchUsersAdmin() async {
    final response = await userAdminControllerSearchUsersAdminWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'PUT /admin/users/{id}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   User ID to update
  ///
  /// * [UserAdminUpdateDto] userAdminUpdateDto (required):
  Future<Response> userAdminControllerUpdateUserAdminWithHttpInfo(String id, UserAdminUpdateDto userAdminUpdateDto,) async {
    // ignore: prefer_const_declarations
    final path = r'/admin/users/{id}'
      .replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody = userAdminUpdateDto;

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
  ///   User ID to update
  ///
  /// * [UserAdminUpdateDto] userAdminUpdateDto (required):
  Future<void> userAdminControllerUpdateUserAdmin(String id, UserAdminUpdateDto userAdminUpdateDto,) async {
    final response = await userAdminControllerUpdateUserAdminWithHttpInfo(id, userAdminUpdateDto,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }
}
