# openapi.api.RoomsApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**roomsControllerCreate**](RoomsApi.md#roomscontrollercreate) | **POST** /floors/{floorId}/rooms | 
[**roomsControllerFindAll**](RoomsApi.md#roomscontrollerfindall) | **GET** /floors/{floorId}/rooms | 
[**roomsControllerFindOne**](RoomsApi.md#roomscontrollerfindone) | **GET** /floors/{floorId}/rooms/{id} | 
[**roomsControllerRemove**](RoomsApi.md#roomscontrollerremove) | **DELETE** /floors/{floorId}/rooms/{id} | 
[**roomsControllerUpdate**](RoomsApi.md#roomscontrollerupdate) | **PUT** /floors/{floorId}/rooms/{id} | 


# **roomsControllerCreate**
> roomsControllerCreate(floorId, createRoomDto)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = RoomsApi();
final floorId = floorId_example; // String | 
final createRoomDto = CreateRoomDto(); // CreateRoomDto | 

try {
    api_instance.roomsControllerCreate(floorId, createRoomDto);
} catch (e) {
    print('Exception when calling RoomsApi->roomsControllerCreate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **floorId** | **String**|  | 
 **createRoomDto** | [**CreateRoomDto**](CreateRoomDto.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **roomsControllerFindAll**
> roomsControllerFindAll(floorId)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = RoomsApi();
final floorId = floorId_example; // String | ID of the floor to list rooms for

try {
    api_instance.roomsControllerFindAll(floorId);
} catch (e) {
    print('Exception when calling RoomsApi->roomsControllerFindAll: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **floorId** | **String**| ID of the floor to list rooms for | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **roomsControllerFindOne**
> roomsControllerFindOne(id)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = RoomsApi();
final id = id_example; // String | 

try {
    api_instance.roomsControllerFindOne(id);
} catch (e) {
    print('Exception when calling RoomsApi->roomsControllerFindOne: $e\n');
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

# **roomsControllerRemove**
> roomsControllerRemove(id)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = RoomsApi();
final id = id_example; // String | 

try {
    api_instance.roomsControllerRemove(id);
} catch (e) {
    print('Exception when calling RoomsApi->roomsControllerRemove: $e\n');
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

# **roomsControllerUpdate**
> roomsControllerUpdate(id, body)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = RoomsApi();
final id = id_example; // String | 
final body = Object(); // Object | 

try {
    api_instance.roomsControllerUpdate(id, body);
} catch (e) {
    print('Exception when calling RoomsApi->roomsControllerUpdate: $e\n');
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

