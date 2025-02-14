import { IsString, IsOptional, IsArray, ValidateNested } from 'class-validator';
import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
import { Type } from 'class-transformer';
import { ImageDto } from './image.dto';

export class CreatePropertyDto {
  @ApiProperty({ description: 'Name of the property/building' })
  @IsString()
  name: string;

  @ApiProperty({ description: 'Physical address of the property' })
  @IsString()
  address: string;

  @ApiPropertyOptional({ description: 'Detailed description of the property' })
  @IsOptional()
  @IsString()
  description?: string;

  @ApiPropertyOptional({
    description: 'Type of building (e.g., residential, commercial)',
    default: 'residential',
  })
  @IsOptional()
  @IsString()
  buildingType?: string;

  @ApiPropertyOptional({
    description: 'List of images/documents attached to the property',
    type: [ImageDto],
  })
  @IsOptional()
  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => ImageDto)
  images?: ImageDto[];
}
