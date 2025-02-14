import { IsDateString, IsNumber, IsString, IsOptional } from 'class-validator';
import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';

export class CreateMaintenanceDto {
  @ApiProperty({
    description: 'Date when maintenance was performed (ISO format)',
  })
  @IsDateString()
  date: string;

  @ApiProperty({ description: 'Cost associated with the maintenance job' })
  @IsNumber()
  cost: number;

  @ApiProperty({
    description: 'Name of the person/company that performed the maintenance',
  })
  @IsString()
  performedBy: string;

  @ApiPropertyOptional({
    description: 'Additional notes regarding the maintenance',
  })
  @IsOptional()
  @IsString()
  notes?: string;
}
