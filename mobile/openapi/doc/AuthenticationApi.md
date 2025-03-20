# openapi.api.AuthenticationApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**authenticationControllerAdminSignUp**](AuthenticationApi.md#authenticationcontrolleradminsignup) | **POST** /auth/admin-sign-up | 
[**authenticationControllerChangePassword**](AuthenticationApi.md#authenticationcontrollerchangepassword) | **POST** /auth/change-password | 
[**authenticationControllerGetCurrentUser**](AuthenticationApi.md#authenticationcontrollergetcurrentuser) | **GET** /auth/me | 
[**authenticationControllerLogin**](AuthenticationApi.md#authenticationcontrollerlogin) | **POST** /auth/login | 
[**authenticationControllerLogout**](AuthenticationApi.md#authenticationcontrollerlogout) | **POST** /auth/logout | 
[**authenticationControllerValidateAccessToken**](AuthenticationApi.md#authenticationcontrollervalidateaccesstoken) | **POST** /auth/validateToken | 


# **authenticationControllerAdminSignUp**
> authenticationControllerAdminSignUp(signUpDto)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = AuthenticationApi();
final signUpDto = SignUpDto(); // SignUpDto | 

try {
    api_instance.authenticationControllerAdminSignUp(signUpDto);
} catch (e) {
    print('Exception when calling AuthenticationApi->authenticationControllerAdminSignUp: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **signUpDto** | [**SignUpDto**](SignUpDto.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **authenticationControllerChangePassword**
> authenticationControllerChangePassword(changePasswordDto)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AuthenticationApi();
final changePasswordDto = ChangePasswordDto(); // ChangePasswordDto | 

try {
    api_instance.authenticationControllerChangePassword(changePasswordDto);
} catch (e) {
    print('Exception when calling AuthenticationApi->authenticationControllerChangePassword: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **changePasswordDto** | [**ChangePasswordDto**](ChangePasswordDto.md)|  | 

### Return type

void (empty response body)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **authenticationControllerGetCurrentUser**
> authenticationControllerGetCurrentUser()



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AuthenticationApi();

try {
    api_instance.authenticationControllerGetCurrentUser();
} catch (e) {
    print('Exception when calling AuthenticationApi->authenticationControllerGetCurrentUser: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

void (empty response body)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **authenticationControllerLogin**
> authenticationControllerLogin(loginDto)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = AuthenticationApi();
final loginDto = LoginDto(); // LoginDto | 

try {
    api_instance.authenticationControllerLogin(loginDto);
} catch (e) {
    print('Exception when calling AuthenticationApi->authenticationControllerLogin: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **loginDto** | [**LoginDto**](LoginDto.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **authenticationControllerLogout**
> authenticationControllerLogout()



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AuthenticationApi();

try {
    api_instance.authenticationControllerLogout();
} catch (e) {
    print('Exception when calling AuthenticationApi->authenticationControllerLogout: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

void (empty response body)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **authenticationControllerValidateAccessToken**
> authenticationControllerValidateAccessToken()



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AuthenticationApi();

try {
    api_instance.authenticationControllerValidateAccessToken();
} catch (e) {
    print('Exception when calling AuthenticationApi->authenticationControllerValidateAccessToken: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

void (empty response body)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

