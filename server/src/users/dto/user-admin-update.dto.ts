import { PartialType } from '@nestjs/mapped-types';
import { UserAdminCreateDto } from './user-admin-create.dto';
import { ApiPropertyOptional } from '@nestjs/swagger';

export class UserAdminUpdateDto extends PartialType(UserAdminCreateDto) {
  @ApiPropertyOptional({
    example: 'new_email@example.com',
    description: 'Updated email address',
  })
  email?: string;

  @ApiPropertyOptional({
    example: 'newpassword123',
    description: 'Updated password',
  })
  password?: string;

  @ApiPropertyOptional({ example: 'New Name', description: 'Updated name' })
  name?: string;
}
