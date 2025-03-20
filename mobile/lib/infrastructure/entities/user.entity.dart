import 'package:isar/isar.dart';
import 'package:upkeep_mobile/domain/models/user.model.dart';
import 'package:upkeep_mobile/utils/hash.dart';

part 'user.entity.g.dart';

@Collection(inheritance: false)
class User {
  Id get isarId => fastHash(id);
  @Index(unique: true, replace: false, type: IndexType.hash)
  final String id;
  final DateTime updatedAt;
  final String email;
  final String name;
  final bool isAdmin;
  final String profileImagePath;

  const User({
    required this.id,
    required this.updatedAt,
    required this.email,
    required this.name,
    required this.isAdmin,
    this.profileImagePath = '',
  });

  static User fromDto(UserDto dto) => User(
        id: dto.id,
        updatedAt: dto.updatedAt,
        email: dto.email,
        name: dto.name,
        isAdmin: dto.isAdmin,
        profileImagePath: dto.profileImagePath ?? "",
      );

  UserDto toDto() => UserDto(
        id: id,
        email: email,
        name: name,
        isAdmin: isAdmin,
        updatedAt: updatedAt,
        profileImagePath: profileImagePath.isEmpty ? null : profileImagePath,
      );
}
