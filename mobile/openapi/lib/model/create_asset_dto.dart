//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateAssetDto {
  /// Returns a new [CreateAssetDto] instance.
  CreateAssetDto({
    required this.name,
    required this.assetType,
    this.description,
    this.manufacturer,
    this.model,
    this.installationDate,
    this.warrantyExpiration,
    required this.ownerType,
    required this.ownerId,
  });

  /// Name of the asset (e.g., Boiler, Elevator)
  String name;

  /// Type of the asset (e.g., boiler, elevator, window)
  String assetType;

  /// Detailed description of the asset
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// Manufacturer of the asset
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? manufacturer;

  /// Model of the asset
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? model;

  /// Installation date (ISO format)
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? installationDate;

  /// Warranty expiration date (ISO format)
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? warrantyExpiration;

  /// Type of the parent entity (e.g., \"room\", \"floor\", \"property\")
  String ownerType;

  /// ID of the parent entity (e.g., room ID, floor ID, or property ID)
  num ownerId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreateAssetDto &&
    other.name == name &&
    other.assetType == assetType &&
    other.description == description &&
    other.manufacturer == manufacturer &&
    other.model == model &&
    other.installationDate == installationDate &&
    other.warrantyExpiration == warrantyExpiration &&
    other.ownerType == ownerType &&
    other.ownerId == ownerId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (name.hashCode) +
    (assetType.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (manufacturer == null ? 0 : manufacturer!.hashCode) +
    (model == null ? 0 : model!.hashCode) +
    (installationDate == null ? 0 : installationDate!.hashCode) +
    (warrantyExpiration == null ? 0 : warrantyExpiration!.hashCode) +
    (ownerType.hashCode) +
    (ownerId.hashCode);

  @override
  String toString() => 'CreateAssetDto[name=$name, assetType=$assetType, description=$description, manufacturer=$manufacturer, model=$model, installationDate=$installationDate, warrantyExpiration=$warrantyExpiration, ownerType=$ownerType, ownerId=$ownerId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'name'] = this.name;
      json[r'assetType'] = this.assetType;
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.manufacturer != null) {
      json[r'manufacturer'] = this.manufacturer;
    } else {
      json[r'manufacturer'] = null;
    }
    if (this.model != null) {
      json[r'model'] = this.model;
    } else {
      json[r'model'] = null;
    }
    if (this.installationDate != null) {
      json[r'installationDate'] = this.installationDate;
    } else {
      json[r'installationDate'] = null;
    }
    if (this.warrantyExpiration != null) {
      json[r'warrantyExpiration'] = this.warrantyExpiration;
    } else {
      json[r'warrantyExpiration'] = null;
    }
      json[r'ownerType'] = this.ownerType;
      json[r'ownerId'] = this.ownerId;
    return json;
  }

  /// Returns a new [CreateAssetDto] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateAssetDto? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "CreateAssetDto[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "CreateAssetDto[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CreateAssetDto(
        name: mapValueOfType<String>(json, r'name')!,
        assetType: mapValueOfType<String>(json, r'assetType')!,
        description: mapValueOfType<String>(json, r'description'),
        manufacturer: mapValueOfType<String>(json, r'manufacturer'),
        model: mapValueOfType<String>(json, r'model'),
        installationDate: mapValueOfType<String>(json, r'installationDate'),
        warrantyExpiration: mapValueOfType<String>(json, r'warrantyExpiration'),
        ownerType: mapValueOfType<String>(json, r'ownerType')!,
        ownerId: num.parse('${json[r'ownerId']}'),
      );
    }
    return null;
  }

  static List<CreateAssetDto> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreateAssetDto>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateAssetDto.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateAssetDto> mapFromJson(dynamic json) {
    final map = <String, CreateAssetDto>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateAssetDto.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateAssetDto-objects as value to a dart map
  static Map<String, List<CreateAssetDto>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CreateAssetDto>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreateAssetDto.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'name',
    'assetType',
    'ownerType',
    'ownerId',
  };
}

