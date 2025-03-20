import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
import {
  IsEmail,
  IsNotEmpty,
  IsString,
  MinLength,
  IsBoolean,
} from 'class-validator';
import { Transform } from 'class-transformer';
import { toEmail, Optional } from 'src/validation';

export class UserAdminCreateDto {
  @ApiProperty({
    example: 'admin@example.com',
    description: 'Admin email address',
  })
  @IsEmail({ require_tld: false })
  @Transform(toEmail)
  email: string;

  @ApiProperty({
    example: 'password123',
    description: 'Password (minimum 6 characters)',
  })
  @IsString()
  @MinLength(6)
  password: string;

  @ApiProperty({ example: 'Admin User', description: 'Name of the admin' })
  @IsNotEmpty()
  @IsString()
  name: string;

  @Optional({ nullable: true })
  @IsBoolean()
  @ApiPropertyOptional({
    example: false,
    description: 'Flag indicating if password change is required on next login',
  })
  shouldChangePassword?: boolean;
}
