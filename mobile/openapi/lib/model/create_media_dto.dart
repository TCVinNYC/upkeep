//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateMediaDto {
  /// Returns a new [CreateMediaDto] instance.
  CreateMediaDto({
    required this.url,
    this.caption,
    required this.entityId,
    required this.entityType,
    required this.createdAt,
  });

  /// URL for the media file (image, document, etc.)
  String url;

  /// Optional caption or description for the media file
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? caption;

  /// ID of the entity (e.g., property, room) this media is associated with
  num entityId;

  /// Type of entity this media belongs to (e.g., \"property\", \"room\", \"equipment\")
  String entityType;

  /// Timestamp when the media record was created
  DateTime createdAt;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreateMediaDto &&
    other.url == url &&
    other.caption == caption &&
    other.entityId == entityId &&
    other.entityType == entityType &&
    other.createdAt == createdAt;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (url.hashCode) +
    (caption == null ? 0 : caption!.hashCode) +
    (entityId.hashCode) +
    (entityType.hashCode) +
    (createdAt.hashCode);

  @override
  String toString() => 'CreateMediaDto[url=$url, caption=$caption, entityId=$entityId, entityType=$entityType, createdAt=$createdAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'url'] = this.url;
    if (this.caption != null) {
      json[r'caption'] = this.caption;
    } else {
      json[r'caption'] = null;
    }
      json[r'entityId'] = this.entityId;
      json[r'entityType'] = this.entityType;
      json[r'createdAt'] = this.createdAt.toUtc().toIso8601String();
    return json;
  }

  /// Returns a new [CreateMediaDto] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateMediaDto? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "CreateMediaDto[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "CreateMediaDto[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CreateMediaDto(
        url: mapValueOfType<String>(json, r'url')!,
        caption: mapValueOfType<String>(json, r'caption'),
        entityId: num.parse('${json[r'entityId']}'),
        entityType: mapValueOfType<String>(json, r'entityType')!,
        createdAt: mapDateTime(json, r'createdAt', r'')!,
      );
    }
    return null;
  }

  static List<CreateMediaDto> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreateMediaDto>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateMediaDto.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateMediaDto> mapFromJson(dynamic json) {
    final map = <String, CreateMediaDto>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateMediaDto.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateMediaDto-objects as value to a dart map
  static Map<String, List<CreateMediaDto>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CreateMediaDto>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreateMediaDto.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'url',
    'entityId',
    'entityType',
    'createdAt',
  };
}

