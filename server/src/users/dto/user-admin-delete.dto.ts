import { IsBoolean } from 'class-validator';
import { ApiProperty } from '@nestjs/swagger';

export class UserAdminDeleteDto {
  @IsBoolean()
  @ApiProperty({ example: true, description: 'Force deletion flag' })
  force?: boolean;
}
