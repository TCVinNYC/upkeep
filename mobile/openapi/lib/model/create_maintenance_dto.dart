//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateMaintenanceDto {
  /// Returns a new [CreateMaintenanceDto] instance.
  CreateMaintenanceDto({
    required this.date,
    required this.cost,
    required this.performedBy,
    this.notes,
  });

  /// Date when maintenance was performed (ISO format)
  String date;

  /// Cost associated with the maintenance job
  num cost;

  /// Name of the person/company that performed the maintenance
  String performedBy;

  /// Additional notes regarding the maintenance
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? notes;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreateMaintenanceDto &&
    other.date == date &&
    other.cost == cost &&
    other.performedBy == performedBy &&
    other.notes == notes;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (date.hashCode) +
    (cost.hashCode) +
    (performedBy.hashCode) +
    (notes == null ? 0 : notes!.hashCode);

  @override
  String toString() => 'CreateMaintenanceDto[date=$date, cost=$cost, performedBy=$performedBy, notes=$notes]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'date'] = this.date;
      json[r'cost'] = this.cost;
      json[r'performedBy'] = this.performedBy;
    if (this.notes != null) {
      json[r'notes'] = this.notes;
    } else {
      json[r'notes'] = null;
    }
    return json;
  }

  /// Returns a new [CreateMaintenanceDto] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateMaintenanceDto? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "CreateMaintenanceDto[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "CreateMaintenanceDto[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CreateMaintenanceDto(
        date: mapValueOfType<String>(json, r'date')!,
        cost: num.parse('${json[r'cost']}'),
        performedBy: mapValueOfType<String>(json, r'performedBy')!,
        notes: mapValueOfType<String>(json, r'notes'),
      );
    }
    return null;
  }

  static List<CreateMaintenanceDto> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreateMaintenanceDto>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateMaintenanceDto.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateMaintenanceDto> mapFromJson(dynamic json) {
    final map = <String, CreateMaintenanceDto>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateMaintenanceDto.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateMaintenanceDto-objects as value to a dart map
  static Map<String, List<CreateMaintenanceDto>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CreateMaintenanceDto>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreateMaintenanceDto.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'date',
    'cost',
    'performedBy',
  };
}

