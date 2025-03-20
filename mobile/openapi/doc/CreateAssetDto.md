# openapi.model.CreateAssetDto

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**name** | **String** | Name of the asset (e.g., Boiler, Elevator) | 
**assetType** | **String** | Type of the asset (e.g., boiler, elevator, window) | 
**description** | **String** | Detailed description of the asset | [optional] 
**manufacturer** | **String** | Manufacturer of the asset | [optional] 
**model** | **String** | Model of the asset | [optional] 
**installationDate** | **String** | Installation date (ISO format) | [optional] 
**warrantyExpiration** | **String** | Warranty expiration date (ISO format) | [optional] 
**ownerType** | **String** | Type of the parent entity (e.g., \"room\", \"floor\", \"property\") | 
**ownerId** | **num** | ID of the parent entity (e.g., room ID, floor ID, or property ID) | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


