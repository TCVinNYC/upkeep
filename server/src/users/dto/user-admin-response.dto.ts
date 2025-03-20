import { UserResponseDto } from './user-response.dto';
import { ApiProperty } from '@nestjs/swagger';

export class UserAdminResponseDto extends UserResponseDto {
  @ApiProperty({
    example: 'admin',
    description: 'Global role of the user (admin or user)',
  })
  role: string;

  @ApiProperty({
    example: '2025-02-13T21:28:09.520Z',
    description: 'Timestamp when the user was created',
  })
  createdAt: Date;

  @ApiProperty({
    example: '2025-02-13T21:30:00.000Z',
    description: 'Timestamp when the user was last updated',
  })
  updatedAt: Date;

  @ApiProperty({
    example: null,
    description: 'Deletion timestamp (if soft-deleted)',
  })
  deletedAt: Date | null;
}
