import { ApiProperty } from '@nestjs/swagger';
import { UserEntity } from '../user.entity';
import { UserAdminResponseDto } from './user-admin-response.dto';

export class UserResponseDto {
  @ApiProperty({
    example: '123e4567-e89b-12d3-a456-426614174000',
    description: 'Unique user ID',
  })
  id: string;

  @ApiProperty({ example: 'John Doe', description: 'User full name' })
  name: string;

  @ApiProperty({
    example: 'user@example.com',
    description: 'User email address',
  })
  email: string;

  @ApiProperty({
    example: 'http://example.com/profile.jpg',
    description: 'Profile image URL',
  })
  profileImagePath: string;

  @ApiProperty({
    example: '2025-02-13T21:28:09.520Z',
    description: 'The timestamp when the user’s profile was last updated',
  })
  updatedAt: Date;
}

/**
 * Maps a UserEntity to a basic UserResponseDto.
 */
export const mapUser = (entity: UserEntity): UserResponseDto => {
  return {
    id: entity.id,
    email: entity.email,
    name: entity.name,
    profileImagePath: entity.profileImagePath,
    updatedAt: entity.updatedAt,
  };
};

/**
 * Maps a UserEntity to a more detailed UserAdminResponseDto.
 */
export const mapUserAdmin = (entity: UserEntity): UserAdminResponseDto => {
  const basic = mapUser(entity);
  return {
    ...basic,
    role: entity.role,
    createdAt: entity.createdAt,
    updatedAt: entity.updatedAt,
    deletedAt: entity.deletedAt,
  };
};
