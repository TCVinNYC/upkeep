# openapi.api.UsersApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**usersControllerCreate**](UsersApi.md#userscontrollercreate) | **POST** /users | 
[**usersControllerCreateProfileImage**](UsersApi.md#userscontrollercreateprofileimage) | **POST** /users/profile-image | 
[**usersControllerDeleteMyUser**](UsersApi.md#userscontrollerdeletemyuser) | **DELETE** /users/me | 
[**usersControllerDeleteProfileImage**](UsersApi.md#userscontrollerdeleteprofileimage) | **DELETE** /users/profile-image | 
[**usersControllerGetMyUser**](UsersApi.md#userscontrollergetmyuser) | **GET** /users/me | 
[**usersControllerGetProfileImage**](UsersApi.md#userscontrollergetprofileimage) | **GET** /users/{id}/profile-image | 
[**usersControllerGetUser**](UsersApi.md#userscontrollergetuser) | **GET** /users/{id} | 
[**usersControllerUpdateMyUser**](UsersApi.md#userscontrollerupdatemyuser) | **PUT** /users/me | 


# **usersControllerCreate**
> usersControllerCreate(createUserDto)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = UsersApi();
final createUserDto = CreateUserDto(); // CreateUserDto | 

try {
    api_instance.usersControllerCreate(createUserDto);
} catch (e) {
    print('Exception when calling UsersApi->usersControllerCreate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createUserDto** | [**CreateUserDto**](CreateUserDto.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **usersControllerCreateProfileImage**
> usersControllerCreateProfileImage(body)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = UsersApi();
final body = Object(); // Object | Upload a profile image

try {
    api_instance.usersControllerCreateProfileImage(body);
} catch (e) {
    print('Exception when calling UsersApi->usersControllerCreateProfileImage: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | **Object**| Upload a profile image | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **usersControllerDeleteMyUser**
> usersControllerDeleteMyUser()



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = UsersApi();

try {
    api_instance.usersControllerDeleteMyUser();
} catch (e) {
    print('Exception when calling UsersApi->usersControllerDeleteMyUser: $e\n');
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

# **usersControllerDeleteProfileImage**
> usersControllerDeleteProfileImage()



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = UsersApi();

try {
    api_instance.usersControllerDeleteProfileImage();
} catch (e) {
    print('Exception when calling UsersApi->usersControllerDeleteProfileImage: $e\n');
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

# **usersControllerGetMyUser**
> usersControllerGetMyUser()



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = UsersApi();

try {
    api_instance.usersControllerGetMyUser();
} catch (e) {
    print('Exception when calling UsersApi->usersControllerGetMyUser: $e\n');
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

# **usersControllerGetProfileImage**
> usersControllerGetProfileImage(id)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = UsersApi();
final id = id_example; // String | User ID

try {
    api_instance.usersControllerGetProfileImage(id);
} catch (e) {
    print('Exception when calling UsersApi->usersControllerGetProfileImage: $e\n');
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

# **usersControllerGetUser**
> usersControllerGetUser(id)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = UsersApi();
final id = id_example; // String | User ID

try {
    api_instance.usersControllerGetUser(id);
} catch (e) {
    print('Exception when calling UsersApi->usersControllerGetUser: $e\n');
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

# **usersControllerUpdateMyUser**
> usersControllerUpdateMyUser(body)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = UsersApi();
final body = Object(); // Object | 

try {
    api_instance.usersControllerUpdateMyUser(body);
} catch (e) {
    print('Exception when calling UsersApi->usersControllerUpdateMyUser: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | **Object**|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

