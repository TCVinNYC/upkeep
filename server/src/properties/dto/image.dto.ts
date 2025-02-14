import { IsString, IsOptional } from 'class-validator';
import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';

export class ImageDto {
  @ApiProperty({ description: 'URL for the image/document' })
  @IsString()
  url: string;

  @ApiPropertyOptional({
    description: 'Caption or description for the image/document',
  })
  @IsOptional()
  @IsString()
  caption?: string;
}
