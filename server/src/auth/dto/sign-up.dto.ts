import { LoginDto } from './login.dto';
import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty, IsString } from 'class-validator';

export class SignUpDto extends LoginDto {
  @ApiProperty({
    example: 'Admin Name',
    description: 'Name of the admin user',
  })
  @IsNotEmpty()
  @IsString()
  name: string;
}
