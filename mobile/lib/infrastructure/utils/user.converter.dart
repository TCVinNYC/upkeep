// import 'package:openapi/api.dart';
// import 'package:upkeep_mobile/domain/models/user.model.dart';

// abstract final class UserConverter {
//   /// Base user dto used where the complete user object is not required
//   static UserDto fromSimpleUserDto(UserResponseDto dto) => UserDto(
//         id: dto.id,
//         email: dto.email,
//         name: dto.name,
//         isAdmin: false,
//         updatedAt: DateTime.now(),
//         profileImagePath: dto.profileImagePath,
//       );

//   static UserDto fromAdminDto(
//     UserAdminResponseDto adminDto, [
//     UserPreferencesResponseDto? preferenceDto,
//   ]) =>
//       UserDto(
//         id: adminDto.id,
//         email: adminDto.email,
//         name: adminDto.name,
//         isAdmin: adminDto.isAdmin,
//         updatedAt: adminDto.updatedAt,
//         profileImagePath: adminDto.profileImagePath,
//       );
// }
