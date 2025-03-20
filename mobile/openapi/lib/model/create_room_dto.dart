//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateRoomDto {
  /// Returns a new [CreateRoomDto] instance.
  CreateRoomDto({
    required this.roomName,
    this.area,
    this.paintColor,
    this.flooring,
  });

  /// Name or number of the room
  String roomName;

  /// Area or dimensions of the room (e.g., \"200 sqft\")
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? area;

  /// Paint color used in the room
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? paintColor;

  /// Type of flooring in the room (e.g., hardwood, tile)
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? flooring;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreateRoomDto &&
    other.roomName == roomName &&
    other.area == area &&
    other.paintColor == paintColor &&
    other.flooring == flooring;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (roomName.hashCode) +
    (area == null ? 0 : area!.hashCode) +
    (paintColor == null ? 0 : paintColor!.hashCode) +
    (flooring == null ? 0 : flooring!.hashCode);

  @override
  String toString() => 'CreateRoomDto[roomName=$roomName, area=$area, paintColor=$paintColor, flooring=$flooring]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'roomName'] = this.roomName;
    if (this.area != null) {
      json[r'area'] = this.area;
    } else {
      json[r'area'] = null;
    }
    if (this.paintColor != null) {
      json[r'paintColor'] = this.paintColor;
    } else {
      json[r'paintColor'] = null;
    }
    if (this.flooring != null) {
      json[r'flooring'] = this.flooring;
    } else {
      json[r'flooring'] = null;
    }
    return json;
  }

  /// Returns a new [CreateRoomDto] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateRoomDto? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "CreateRoomDto[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "CreateRoomDto[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CreateRoomDto(
        roomName: mapValueOfType<String>(json, r'roomName')!,
        area: mapValueOfType<String>(json, r'area'),
        paintColor: mapValueOfType<String>(json, r'paintColor'),
        flooring: mapValueOfType<String>(json, r'flooring'),
      );
    }
    return null;
  }

  static List<CreateRoomDto> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreateRoomDto>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateRoomDto.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateRoomDto> mapFromJson(dynamic json) {
    final map = <String, CreateRoomDto>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateRoomDto.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateRoomDto-objects as value to a dart map
  static Map<String, List<CreateRoomDto>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CreateRoomDto>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreateRoomDto.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'roomName',
  };
}

