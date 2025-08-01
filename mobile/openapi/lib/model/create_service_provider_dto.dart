//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateServiceProviderDto {
  /// Returns a new [CreateServiceProviderDto] instance.
  CreateServiceProviderDto({
    required this.name,
    required this.contactInfo,
    this.description,
    required this.createdAt,
  });

  /// Name of the service provider
  String name;

  /// Contact information (phone, email, etc.) for the provider
  String contactInfo;

  /// Additional details or description of the provider
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// Timestamp when the service provider record was created
  DateTime createdAt;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreateServiceProviderDto &&
    other.name == name &&
    other.contactInfo == contactInfo &&
    other.description == description &&
    other.createdAt == createdAt;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (name.hashCode) +
    (contactInfo.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (createdAt.hashCode);

  @override
  String toString() => 'CreateServiceProviderDto[name=$name, contactInfo=$contactInfo, description=$description, createdAt=$createdAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'name'] = this.name;
      json[r'contactInfo'] = this.contactInfo;
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
      json[r'createdAt'] = this.createdAt.toUtc().toIso8601String();
    return json;
  }

  /// Returns a new [CreateServiceProviderDto] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateServiceProviderDto? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "CreateServiceProviderDto[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "CreateServiceProviderDto[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CreateServiceProviderDto(
        name: mapValueOfType<String>(json, r'name')!,
        contactInfo: mapValueOfType<String>(json, r'contactInfo')!,
        description: mapValueOfType<String>(json, r'description'),
        createdAt: mapDateTime(json, r'createdAt', r'')!,
      );
    }
    return null;
  }

  static List<CreateServiceProviderDto> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreateServiceProviderDto>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateServiceProviderDto.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateServiceProviderDto> mapFromJson(dynamic json) {
    final map = <String, CreateServiceProviderDto>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateServiceProviderDto.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateServiceProviderDto-objects as value to a dart map
  static Map<String, List<CreateServiceProviderDto>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CreateServiceProviderDto>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreateServiceProviderDto.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'name',
    'contactInfo',
    'createdAt',
  };
}

