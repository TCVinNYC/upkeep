# openapi.api.UsersAdminApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**userAdminControllerCreateUserAdmin**](UsersAdminApi.md#useradmincontrollercreateuseradmin) | **POST** /admin/users | 
[**userAdminControllerDeleteUserAdmin**](UsersAdminApi.md#useradmincontrollerdeleteuseradmin) | **DELETE** /admin/users/{id} | 
[**userAdminControllerDisableUserAdmin**](UsersAdminApi.md#useradmincontrollerdisableuseradmin) | **PUT** /admin/users/{id}/disable | 
[**userAdminControllerEnableUserAdmin**](UsersAdminApi.md#useradmincontrollerenableuseradmin) | **PUT** /admin/users/{id}/enable | 
[**userAdminControllerGetUserAdmin**](UsersAdminApi.md#useradmincontrollergetuseradmin) | **GET** /admin/users/{id} | 
[**userAdminControllerRestoreUserAdmin**](UsersAdminApi.md#useradmincontrollerrestoreuseradmin) | **POST** /admin/users/{id}/restore | 
[**userAdminControllerSearchUsersAdmin**](UsersAdminApi.md#useradmincontrollersearchusersadmin) | **GET** /admin/users | 
[**userAdminControllerUpdateUserAdmin**](UsersAdminApi.md#useradmincontrollerupdateuseradmin) | **PUT** /admin/users/{id} | 


# **userAdminControllerCreateUserAdmin**
> userAdminControllerCreateUserAdmin(userAdminCreateDto)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = UsersAdminApi();
final userAdminCreateDto = UserAdminCreateDto(); // UserAdminCreateDto | 

try {
    api_instance.userAdminControllerCreateUserAdmin(userAdminCreateDto);
} catch (e) {
    print('Exception when calling UsersAdminApi->userAdminControllerCreateUserAdmin: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userAdminCreateDto** | [**UserAdminCreateDto**](UserAdminCreateDto.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **userAdminControllerDeleteUserAdmin**
> userAdminControllerDeleteUserAdmin(id)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = UsersAdminApi();
final id = id_example; // String | User ID to delete

try {
    api_instance.userAdminControllerDeleteUserAdmin(id);
} catch (e) {
    print('Exception when calling UsersAdminApi->userAdminControllerDeleteUserAdmin: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| User ID to delete | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **userAdminControllerDisableUserAdmin**
> userAdminControllerDisableUserAdmin(id)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = UsersAdminApi();
final id = id_example; // String | User ID to disable

try {
    api_instance.userAdminControllerDisableUserAdmin(id);
} catch (e) {
    print('Exception when calling UsersAdminApi->userAdminControllerDisableUserAdmin: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| User ID to disable | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **userAdminControllerEnableUserAdmin**
> userAdminControllerEnableUserAdmin(id)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = UsersAdminApi();
final id = id_example; // String | User ID to enable

try {
    api_instance.userAdminControllerEnableUserAdmin(id);
} catch (e) {
    print('Exception when calling UsersAdminApi->userAdminControllerEnableUserAdmin: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| User ID to enable | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **userAdminControllerGetUserAdmin**
> userAdminControllerGetUserAdmin(id)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = UsersAdminApi();
final id = id_example; // String | User ID

try {
    api_instance.userAdminControllerGetUserAdmin(id);
} catch (e) {
    print('Exception when calling UsersAdminApi->userAdminControllerGetUserAdmin: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| User ID | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **userAdminControllerRestoreUserAdmin**
> userAdminControllerRestoreUserAdmin(id)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = UsersAdminApi();
final id = id_example; // String | User ID to restore

try {
    api_instance.userAdminControllerRestoreUserAdmin(id);
} catch (e) {
    print('Exception when calling UsersAdminApi->userAdminControllerRestoreUserAdmin: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| User ID to restore | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **userAdminControllerSearchUsersAdmin**
> userAdminControllerSearchUsersAdmin()



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = UsersAdminApi();

try {
    api_instance.userAdminControllerSearchUsersAdmin();
} catch (e) {
    print('Exception when calling UsersAdminApi->userAdminControllerSearchUsersAdmin: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **userAdminControllerUpdateUserAdmin**
> userAdminControllerUpdateUserAdmin(id, userAdminUpdateDto)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = UsersAdminApi();
final id = id_example; // String | User ID to update
final userAdminUpdateDto = UserAdminUpdateDto(); // UserAdminUpdateDto | 

try {
    api_instance.userAdminControllerUpdateUserAdmin(id, userAdminUpdateDto);
} catch (e) {
    print('Exception when calling UsersAdminApi->userAdminControllerUpdateUserAdmin: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| User ID to update | 
 **userAdminUpdateDto** | [**UserAdminUpdateDto**](UserAdminUpdateDto.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

