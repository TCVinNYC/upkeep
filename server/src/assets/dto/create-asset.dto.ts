import { IsString, IsOptional, IsDateString, IsNumber } from 'class-validator';
import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';

export class CreateAssetDto {
  @ApiProperty({ description: 'Name of the asset (e.g., Boiler, Elevator)' })
  @IsString()
  name: string;

  @ApiProperty({
    description: 'Type of the asset (e.g., boiler, elevator, window)',
  })
  @IsString()
  assetType: string;

  @ApiPropertyOptional({ description: 'Detailed description of the asset' })
  @IsOptional()
  @IsString()
  description?: string;

  @ApiPropertyOptional({ description: 'Manufacturer of the asset' })
  @IsOptional()
  @IsString()
  manufacturer?: string;

  @ApiPropertyOptional({ description: 'Model of the asset' })
  @IsOptional()
  @IsString()
  model?: string;

  @ApiPropertyOptional({ description: 'Installation date (ISO format)' })
  @IsOptional()
  @IsDateString()
  installationDate?: string;

  @ApiPropertyOptional({ description: 'Warranty expiration date (ISO format)' })
  @IsOptional()
  @IsDateString()
  warrantyExpiration?: string;

  // Fields to associate the asset with its parent
  @ApiProperty({
    description:
      'Type of the parent entity (e.g., "room", "floor", "property")',
  })
  @IsString()
  ownerType: string;

  @ApiProperty({
    description:
      'ID of the parent entity (e.g., room ID, floor ID, or property ID)',
  })
  @IsNumber()
  ownerId: number;
}
