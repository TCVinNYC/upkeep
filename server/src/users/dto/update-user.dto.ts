import { PartialType } from '@nestjs/mapped-types';
import { CreateUserDto } from './create-user.dto';
import { ApiPropertyOptional } from '@nestjs/swagger';

export class UpdateUserDto extends PartialType(CreateUserDto) {
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

  @ApiPropertyOptional({
    example: 'Jane Doe',
    description: 'Updated full name',
  })
  name?: string;
}
