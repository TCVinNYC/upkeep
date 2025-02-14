import { IsString, IsNumber, IsOptional } from 'class-validator';
import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';

export class CreateMediaDto {
  @ApiProperty({
    description: 'URL for the media file (image, document, etc.)',
  })
  @IsString()
  url: string;

  @ApiPropertyOptional({
    description: 'Optional caption or description for the media file',
  })
  @IsOptional()
  @IsString()
  caption?: string;

  @ApiProperty({
    description:
      'ID of the entity (e.g., property, room) this media is associated with',
  })
  @IsNumber()
  entityId: number;

  @ApiProperty({
    description:
      'Type of entity this media belongs to (e.g., "property", "room", "equipment")',
  })
  @IsString()
  entityType: string;

  @ApiProperty({
    description: 'Timestamp when the media record was created',
    readOnly: true,
  })
  readonly createdAt?: Date;
}
