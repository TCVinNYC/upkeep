//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UserAdminCreateDto {
  /// Returns a new [UserAdminCreateDto] instance.
  UserAdminCreateDto({
    required this.email,
    required this.password,
    required this.name,
    this.shouldChangePassword,
  });

  /// Admin email address
  String email;

  /// Password (minimum 6 characters)
  String password;

  /// Name of the admin
  String name;

  /// Flag indicating if password change is required on next login
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? shouldChangePassword;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UserAdminCreateDto &&
    other.email == email &&
    other.password == password &&
    other.name == name &&
    other.shouldChangePassword == shouldChangePassword;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (email.hashCode) +
    (password.hashCode) +
    (name.hashCode) +
    (shouldChangePassword == null ? 0 : shouldChangePassword!.hashCode);

  @override
  String toString() => 'UserAdminCreateDto[email=$email, password=$password, name=$name, shouldChangePassword=$shouldChangePassword]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'email'] = this.email;
      json[r'password'] = this.password;
      json[r'name'] = this.name;
    if (this.shouldChangePassword != null) {
      json[r'shouldChangePassword'] = this.shouldChangePassword;
    } else {
      json[r'shouldChangePassword'] = null;
    }
    return json;
  }

  /// Returns a new [UserAdminCreateDto] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UserAdminCreateDto? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "UserAdminCreateDto[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "UserAdminCreateDto[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UserAdminCreateDto(
        email: mapValueOfType<String>(json, r'email')!,
        password: mapValueOfType<String>(json, r'password')!,
        name: mapValueOfType<String>(json, r'name')!,
        shouldChangePassword: mapValueOfType<bool>(json, r'shouldChangePassword'),
      );
    }
    return null;
  }

  static List<UserAdminCreateDto> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UserAdminCreateDto>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UserAdminCreateDto.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UserAdminCreateDto> mapFromJson(dynamic json) {
    final map = <String, UserAdminCreateDto>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UserAdminCreateDto.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UserAdminCreateDto-objects as value to a dart map
  static Map<String, List<UserAdminCreateDto>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<UserAdminCreateDto>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UserAdminCreateDto.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'email',
    'password',
    'name',
  };
}

