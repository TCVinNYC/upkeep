import 'package:upkeep/utils/hash.dart';
import 'package:isar/isar.dart';

part 'user.entity.g.dart';

@Collection(inheritance: false)
class User {
  User(
      {required this.id,
      required this.updatedAt,
      required this.email,
      required this.name,
      required this.isAdmin,
      this.profileImagePath = '',
      this.avatarColor = AvatarColorEnum.primary});

  Id get isarId => fastHash(id);

  // User.fromUserDto(
  //   UserAdminResponseDto dto,
  //   UserPreferencesResponseDto? preferences,
  // )   : id = dto.id,
  //       updatedAt = dto.updatedAt,
  //       email = dto.email,
  //       name = dto.name,
  //       profileImagePath = dto.profileImagePath,
  //       isAdmin = dto.isAdmin,
  //       avatarColor = dto.avatarColor.toAvatarColor();

  // /// Base user dto used where the complete user object is not required
  // User.fromSimpleUserDto(UserResponseDto dto)
  //     : id = dto.id,
  //       email = dto.email,
  //       name = dto.name,
  //       profileImagePath = dto.profileImagePath,
  //       avatarColor = dto.avatarColor.toAvatarColor(),
  //       // Fill the remaining fields with placeholders
  //       isAdmin = false,
  //       updatedAt = DateTime.now();

  @Index(unique: true, replace: false, type: IndexType.hash)
  String id;
  DateTime updatedAt;
  String email;
  String name;
  bool isAdmin;
  String profileImagePath;
  @Enumerated(EnumType.ordinal)
  AvatarColorEnum avatarColor;

  @override
  bool operator ==(other) {
    if (other is! User) return false;
    return id == other.id &&
        updatedAt.isAtSameMomentAs(other.updatedAt) &&
        avatarColor == other.avatarColor &&
        email == other.email &&
        name == other.name &&
        profileImagePath == other.profileImagePath &&
        isAdmin == other.isAdmin;
  }

  @override
  @ignore
  int get hashCode =>
      id.hashCode ^
      updatedAt.hashCode ^
      email.hashCode ^
      name.hashCode ^
      profileImagePath.hashCode ^
      avatarColor.hashCode ^
      isAdmin.hashCode;
}

enum AvatarColorEnum {
  // do not change this order or reuse indices for other purposes, adding is OK
  primary,
  pink,
  red,
  yellow,
  blue,
  green,
  purple,
  orange,
  gray,
  amber,
}

// extension AvatarColorEnumHelper on UserAvatarColor {
//   AvatarColorEnum toAvatarColor() {
//     switch (this) {
//       case UserAvatarColor.primary:
//         return AvatarColorEnum.primary;
//       case UserAvatarColor.pink:
//         return AvatarColorEnum.pink;
//       case UserAvatarColor.red:
//         return AvatarColorEnum.red;
//       case UserAvatarColor.yellow:
//         return AvatarColorEnum.yellow;
//       case UserAvatarColor.blue:
//         return AvatarColorEnum.blue;
//       case UserAvatarColor.green:
//         return AvatarColorEnum.green;
//       case UserAvatarColor.purple:
//         return AvatarColorEnum.purple;
//       case UserAvatarColor.orange:
//         return AvatarColorEnum.orange;
//       case UserAvatarColor.gray:
//         return AvatarColorEnum.gray;
//       case UserAvatarColor.amber:
//         return AvatarColorEnum.amber;
//     }
//     return AvatarColorEnum.primary;
//   }
// }

// extension AvatarColorToColorHelper on AvatarColorEnum {
//   Color toColor([bool isDarkTheme = false]) {
//     switch (this) {
//       case AvatarColorEnum.primary:
//         return isDarkTheme ? const Color(0xFFABCBFA) : const Color(0xFF4250AF);
//       case AvatarColorEnum.pink:
//         return const Color.fromARGB(255, 244, 114, 182);
//       case AvatarColorEnum.red:
//         return const Color.fromARGB(255, 239, 68, 68);
//       case AvatarColorEnum.yellow:
//         return const Color.fromARGB(255, 234, 179, 8);
//       case AvatarColorEnum.blue:
//         return const Color.fromARGB(255, 59, 130, 246);
//       case AvatarColorEnum.green:
//         return const Color.fromARGB(255, 22, 163, 74);
//       case AvatarColorEnum.purple:
//         return const Color.fromARGB(255, 147, 51, 234);
//       case AvatarColorEnum.orange:
//         return const Color.fromARGB(255, 234, 88, 12);
//       case AvatarColorEnum.gray:
//         return const Color.fromARGB(255, 75, 85, 99);
//       case AvatarColorEnum.amber:
//         return const Color.fromARGB(255, 217, 119, 6);
//     }
//   }
// }
