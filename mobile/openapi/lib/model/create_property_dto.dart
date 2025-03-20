//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreatePropertyDto {
  /// Returns a new [CreatePropertyDto] instance.
  CreatePropertyDto({
    required this.name,
    required this.address,
    this.description,
    this.buildingType = 'residential',
    this.images = const [],
  });

  /// Name of the property/building
  String name;

  /// Physical address of the property
  String address;

  /// Detailed description of the property
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// Type of building (e.g., residential, commercial)
  String buildingType;

  /// List of images/documents attached to the property
  List<ImageDto> images;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreatePropertyDto &&
    other.name == name &&
    other.address == address &&
    other.description == description &&
    other.buildingType == buildingType &&
    _deepEquality.equals(other.images, images);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (name.hashCode) +
    (address.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (buildingType.hashCode) +
    (images.hashCode);

  @override
  String toString() => 'CreatePropertyDto[name=$name, address=$address, description=$description, buildingType=$buildingType, images=$images]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'name'] = this.name;
      json[r'address'] = this.address;
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
      json[r'buildingType'] = this.buildingType;
      json[r'images'] = this.images;
    return json;
  }

  /// Returns a new [CreatePropertyDto] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreatePropertyDto? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "CreatePropertyDto[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "CreatePropertyDto[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CreatePropertyDto(
        name: mapValueOfType<String>(json, r'name')!,
        address: mapValueOfType<String>(json, r'address')!,
        description: mapValueOfType<String>(json, r'description'),
        buildingType: mapValueOfType<String>(json, r'buildingType') ?? 'residential',
        images: ImageDto.listFromJson(json[r'images']),
      );
    }
    return null;
  }

  static List<CreatePropertyDto> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreatePropertyDto>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreatePropertyDto.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreatePropertyDto> mapFromJson(dynamic json) {
    final map = <String, CreatePropertyDto>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreatePropertyDto.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreatePropertyDto-objects as value to a dart map
  static Map<String, List<CreatePropertyDto>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CreatePropertyDto>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreatePropertyDto.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'name',
    'address',
  };
}

