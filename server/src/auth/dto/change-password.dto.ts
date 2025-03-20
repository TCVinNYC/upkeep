import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty, IsString, MinLength } from 'class-validator';

export class ChangePasswordDto {
  @ApiProperty({ example: 'oldpassword', description: 'Current password' })
  @IsNotEmpty()
  @IsString()
  password: string;

  @ApiProperty({
    example: 'newStrongPassword123',
    description: 'New password (minimum 8 characters)',
  })
  @IsNotEmpty()
  @IsString()
  @MinLength(8)
  newPassword: string;
}
