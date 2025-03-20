# openapi.api.MaintenanceApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**maintenanceControllerCreate**](MaintenanceApi.md#maintenancecontrollercreate) | **POST** /rooms/{roomId}/maintenance | 
[**maintenanceControllerFindAll**](MaintenanceApi.md#maintenancecontrollerfindall) | **GET** /rooms/{roomId}/maintenance | 
[**maintenanceControllerFindOne**](MaintenanceApi.md#maintenancecontrollerfindone) | **GET** /rooms/{roomId}/maintenance/{id} | 
[**maintenanceControllerRemove**](MaintenanceApi.md#maintenancecontrollerremove) | **DELETE** /rooms/{roomId}/maintenance/{id} | 
[**maintenanceControllerUpdate**](MaintenanceApi.md#maintenancecontrollerupdate) | **PUT** /rooms/{roomId}/maintenance/{id} | 


# **maintenanceControllerCreate**
> maintenanceControllerCreate(roomId, createMaintenanceDto)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = MaintenanceApi();
final roomId = roomId_example; // String | ID of the room
final createMaintenanceDto = CreateMaintenanceDto(); // CreateMaintenanceDto | 

try {
    api_instance.maintenanceControllerCreate(roomId, createMaintenanceDto);
} catch (e) {
    print('Exception when calling MaintenanceApi->maintenanceControllerCreate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **roomId** | **String**| ID of the room | 
 **createMaintenanceDto** | [**CreateMaintenanceDto**](CreateMaintenanceDto.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **maintenanceControllerFindAll**
> maintenanceControllerFindAll(roomId)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = MaintenanceApi();
final roomId = roomId_example; // String | ID of the room

try {
    api_instance.maintenanceControllerFindAll(roomId);
} catch (e) {
    print('Exception when calling MaintenanceApi->maintenanceControllerFindAll: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **roomId** | **String**| ID of the room | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **maintenanceControllerFindOne**
> maintenanceControllerFindOne(id)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = MaintenanceApi();
final id = id_example; // String | ID of the maintenance record

try {
    api_instance.maintenanceControllerFindOne(id);
} catch (e) {
    print('Exception when calling MaintenanceApi->maintenanceControllerFindOne: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| ID of the maintenance record | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **maintenanceControllerRemove**
> maintenanceControllerRemove(id)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = MaintenanceApi();
final id = id_example; // String | ID of the maintenance record

try {
    api_instance.maintenanceControllerRemove(id);
} catch (e) {
    print('Exception when calling MaintenanceApi->maintenanceControllerRemove: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| ID of the maintenance record | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **maintenanceControllerUpdate**
> maintenanceControllerUpdate(id, body)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = MaintenanceApi();
final id = id_example; // String | ID of the maintenance record
final body = Object(); // Object | 

try {
    api_instance.maintenanceControllerUpdate(id, body);
} catch (e) {
    print('Exception when calling MaintenanceApi->maintenanceControllerUpdate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| ID of the maintenance record | 
 **body** | **Object**|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

