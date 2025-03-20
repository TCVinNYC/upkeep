# openapi.api.PropertiesApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**propertiesControllerCreate**](PropertiesApi.md#propertiescontrollercreate) | **POST** /properties | 
[**propertiesControllerFindAll**](PropertiesApi.md#propertiescontrollerfindall) | **GET** /properties | 
[**propertiesControllerFindOne**](PropertiesApi.md#propertiescontrollerfindone) | **GET** /properties/{id} | 
[**propertiesControllerRemove**](PropertiesApi.md#propertiescontrollerremove) | **DELETE** /properties/{id} | 
[**propertiesControllerUpdate**](PropertiesApi.md#propertiescontrollerupdate) | **PUT** /properties/{id} | 


# **propertiesControllerCreate**
> propertiesControllerCreate(createPropertyDto)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PropertiesApi();
final createPropertyDto = CreatePropertyDto(); // CreatePropertyDto | 

try {
    api_instance.propertiesControllerCreate(createPropertyDto);
} catch (e) {
    print('Exception when calling PropertiesApi->propertiesControllerCreate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createPropertyDto** | [**CreatePropertyDto**](CreatePropertyDto.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **propertiesControllerFindAll**
> propertiesControllerFindAll()



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PropertiesApi();

try {
    api_instance.propertiesControllerFindAll();
} catch (e) {
    print('Exception when calling PropertiesApi->propertiesControllerFindAll: $e\n');
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

# **propertiesControllerFindOne**
> propertiesControllerFindOne(id)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PropertiesApi();
final id = id_example; // String | ID of the property

try {
    api_instance.propertiesControllerFindOne(id);
} catch (e) {
    print('Exception when calling PropertiesApi->propertiesControllerFindOne: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| ID of the property | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **propertiesControllerRemove**
> propertiesControllerRemove(id)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PropertiesApi();
final id = id_example; // String | ID of the property

try {
    api_instance.propertiesControllerRemove(id);
} catch (e) {
    print('Exception when calling PropertiesApi->propertiesControllerRemove: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| ID of the property | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **propertiesControllerUpdate**
> propertiesControllerUpdate(id, body)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = PropertiesApi();
final id = id_example; // String | ID of the property
final body = Object(); // Object | 

try {
    api_instance.propertiesControllerUpdate(id, body);
} catch (e) {
    print('Exception when calling PropertiesApi->propertiesControllerUpdate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| ID of the property | 
 **body** | **Object**|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

