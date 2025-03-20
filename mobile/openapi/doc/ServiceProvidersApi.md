# openapi.api.ServiceProvidersApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**serviceProvidersControllerCreate**](ServiceProvidersApi.md#serviceproviderscontrollercreate) | **POST** /service-providers | 
[**serviceProvidersControllerFindAll**](ServiceProvidersApi.md#serviceproviderscontrollerfindall) | **GET** /service-providers | 
[**serviceProvidersControllerFindOne**](ServiceProvidersApi.md#serviceproviderscontrollerfindone) | **GET** /service-providers/{id} | 
[**serviceProvidersControllerRemove**](ServiceProvidersApi.md#serviceproviderscontrollerremove) | **DELETE** /service-providers/{id} | 
[**serviceProvidersControllerUpdate**](ServiceProvidersApi.md#serviceproviderscontrollerupdate) | **PUT** /service-providers/{id} | 


# **serviceProvidersControllerCreate**
> serviceProvidersControllerCreate(createServiceProviderDto)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = ServiceProvidersApi();
final createServiceProviderDto = CreateServiceProviderDto(); // CreateServiceProviderDto | 

try {
    api_instance.serviceProvidersControllerCreate(createServiceProviderDto);
} catch (e) {
    print('Exception when calling ServiceProvidersApi->serviceProvidersControllerCreate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createServiceProviderDto** | [**CreateServiceProviderDto**](CreateServiceProviderDto.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **serviceProvidersControllerFindAll**
> serviceProvidersControllerFindAll()



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = ServiceProvidersApi();

try {
    api_instance.serviceProvidersControllerFindAll();
} catch (e) {
    print('Exception when calling ServiceProvidersApi->serviceProvidersControllerFindAll: $e\n');
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

# **serviceProvidersControllerFindOne**
> serviceProvidersControllerFindOne(id)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = ServiceProvidersApi();
final id = id_example; // String | ID of the service provider

try {
    api_instance.serviceProvidersControllerFindOne(id);
} catch (e) {
    print('Exception when calling ServiceProvidersApi->serviceProvidersControllerFindOne: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| ID of the service provider | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **serviceProvidersControllerRemove**
> serviceProvidersControllerRemove(id)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = ServiceProvidersApi();
final id = id_example; // String | ID of the service provider

try {
    api_instance.serviceProvidersControllerRemove(id);
} catch (e) {
    print('Exception when calling ServiceProvidersApi->serviceProvidersControllerRemove: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| ID of the service provider | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **serviceProvidersControllerUpdate**
> serviceProvidersControllerUpdate(id, body)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = ServiceProvidersApi();
final id = id_example; // String | ID of the service provider
final body = Object(); // Object | 

try {
    api_instance.serviceProvidersControllerUpdate(id, body);
} catch (e) {
    print('Exception when calling ServiceProvidersApi->serviceProvidersControllerUpdate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| ID of the service provider | 
 **body** | **Object**|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

