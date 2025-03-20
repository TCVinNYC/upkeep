# openapi.api.AssetsApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**assetsControllerCreate**](AssetsApi.md#assetscontrollercreate) | **POST** /assets | 
[**assetsControllerFindAll**](AssetsApi.md#assetscontrollerfindall) | **GET** /assets | 
[**assetsControllerFindOne**](AssetsApi.md#assetscontrollerfindone) | **GET** /assets/{id} | 
[**assetsControllerRemove**](AssetsApi.md#assetscontrollerremove) | **DELETE** /assets/{id} | 
[**assetsControllerUpdate**](AssetsApi.md#assetscontrollerupdate) | **PUT** /assets/{id} | 


# **assetsControllerCreate**
> assetsControllerCreate(createAssetDto)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = AssetsApi();
final createAssetDto = CreateAssetDto(); // CreateAssetDto | 

try {
    api_instance.assetsControllerCreate(createAssetDto);
} catch (e) {
    print('Exception when calling AssetsApi->assetsControllerCreate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createAssetDto** | [**CreateAssetDto**](CreateAssetDto.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **assetsControllerFindAll**
> assetsControllerFindAll(ownerType, ownerId)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = AssetsApi();
final ownerType = ownerType_example; // String | Filter by parent type (e.g., room, floor, property)
final ownerId = 8.14; // num | Filter by parent entity ID

try {
    api_instance.assetsControllerFindAll(ownerType, ownerId);
} catch (e) {
    print('Exception when calling AssetsApi->assetsControllerFindAll: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **ownerType** | **String**| Filter by parent type (e.g., room, floor, property) | [optional] 
 **ownerId** | **num**| Filter by parent entity ID | [optional] 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **assetsControllerFindOne**
> assetsControllerFindOne(id)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = AssetsApi();
final id = id_example; // String | ID of the asset

try {
    api_instance.assetsControllerFindOne(id);
} catch (e) {
    print('Exception when calling AssetsApi->assetsControllerFindOne: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| ID of the asset | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **assetsControllerRemove**
> assetsControllerRemove(id)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = AssetsApi();
final id = id_example; // String | ID of the asset

try {
    api_instance.assetsControllerRemove(id);
} catch (e) {
    print('Exception when calling AssetsApi->assetsControllerRemove: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| ID of the asset | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **assetsControllerUpdate**
> assetsControllerUpdate(id, body)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = AssetsApi();
final id = id_example; // String | ID of the asset
final body = Object(); // Object | 

try {
    api_instance.assetsControllerUpdate(id, body);
} catch (e) {
    print('Exception when calling AssetsApi->assetsControllerUpdate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| ID of the asset | 
 **body** | **Object**|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

