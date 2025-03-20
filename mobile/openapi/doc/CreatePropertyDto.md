# openapi.model.CreatePropertyDto

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**name** | **String** | Name of the property/building | 
**address** | **String** | Physical address of the property | 
**description** | **String** | Detailed description of the property | [optional] 
**buildingType** | **String** | Type of building (e.g., residential, commercial) | [optional] [default to 'residential']
**images** | [**List<ImageDto>**](ImageDto.md) | List of images/documents attached to the property | [optional] [default to const []]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


