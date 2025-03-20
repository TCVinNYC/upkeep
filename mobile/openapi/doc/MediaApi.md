# openapi.api.MediaApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**mediaControllerCreate**](MediaApi.md#mediacontrollercreate) | **POST** /media | 
[**mediaControllerFindAll**](MediaApi.md#mediacontrollerfindall) | **GET** /media | 
[**mediaControllerFindOne**](MediaApi.md#mediacontrollerfindone) | **GET** /media/{id} | 
[**mediaControllerRemove**](MediaApi.md#mediacontrollerremove) | **DELETE** /media/{id} | 
[**mediaControllerUpdate**](MediaApi.md#mediacontrollerupdate) | **PUT** /media/{id} | 


# **mediaControllerCreate**
> mediaControllerCreate(createMediaDto)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = MediaApi();
final createMediaDto = CreateMediaDto(); // CreateMediaDto | 

try {
    api_instance.mediaControllerCreate(createMediaDto);
} catch (e) {
    print('Exception when calling MediaApi->mediaControllerCreate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createMediaDto** | [**CreateMediaDto**](CreateMediaDto.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **mediaControllerFindAll**
> mediaControllerFindAll()



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = MediaApi();

try {
    api_instance.mediaControllerFindAll();
} catch (e) {
    print('Exception when calling MediaApi->mediaControllerFindAll: $e\n');
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

# **mediaControllerFindOne**
> mediaControllerFindOne(id)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = MediaApi();
final id = id_example; // String | 

try {
    api_instance.mediaControllerFindOne(id);
} catch (e) {
    print('Exception when calling MediaApi->mediaControllerFindOne: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **mediaControllerRemove**
> mediaControllerRemove(id)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = MediaApi();
final id = id_example; // String | 

try {
    api_instance.mediaControllerRemove(id);
} catch (e) {
    print('Exception when calling MediaApi->mediaControllerRemove: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **mediaControllerUpdate**
> mediaControllerUpdate(id, body)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = MediaApi();
final id = id_example; // String | 
final body = Object(); // Object | 

try {
    api_instance.mediaControllerUpdate(id, body);
} catch (e) {
    print('Exception when calling MediaApi->mediaControllerUpdate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 
 **body** | **Object**|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

