import { IsNumber, IsOptional, IsString } from 'class-validator';
import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';

export class CreateFloorDto {
  @ApiProperty({ description: 'Floor number (e.g., 1, 2, 3)' })
  @IsNumber()
  floorNumber: number;

  @ApiPropertyOptional({
    description:
      'Name or label for the floor (e.g., "Main Lobby", "Second Floor Offices")',
  })
  @IsOptional()
  @IsString()
  name?: string;

  @ApiPropertyOptional({ description: 'Optional description for the floor' })
  @IsOptional()
  @IsString()
  description?: string;
}
