class UserDto {
  final String id;
  final String email;
  final String name;
  final bool isAdmin;
  final DateTime updatedAt;
  final String? profileImagePath;

  const UserDto({
    required this.id,
    required this.email,
    required this.name,
    required this.isAdmin,
    required this.updatedAt,
    this.profileImagePath,
  });

  @override
  String toString() {
    return '''User: {
id: $id,
email: $email,
name: $name,
isAdmin: $isAdmin,
updatedAt: $updatedAt,
profileImagePath: ${profileImagePath ?? '<NA>'},
}''';
  }

  UserDto copyWith({
    String? id,
    String? email,
    String? name,
    bool? isAdmin,
    DateTime? updatedAt,
    String? profileImagePath,
  }) =>
      UserDto(
        id: id ?? this.id,
        email: email ?? this.email,
        name: name ?? this.name,
        isAdmin: isAdmin ?? this.isAdmin,
        updatedAt: updatedAt ?? this.updatedAt,
        profileImagePath: profileImagePath ?? this.profileImagePath,
      );

  @override
  bool operator ==(covariant UserDto other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.updatedAt.isAtSameMomentAs(updatedAt) &&
        other.email == email &&
        other.name == name &&
        other.profileImagePath == profileImagePath &&
        other.isAdmin == isAdmin;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      email.hashCode ^
      updatedAt.hashCode ^
      isAdmin.hashCode ^
      profileImagePath.hashCode;
}
