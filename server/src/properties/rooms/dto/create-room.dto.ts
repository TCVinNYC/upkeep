import { IsString, IsOptional } from 'class-validator';
import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';

export class CreateRoomDto {
  @ApiProperty({ description: 'Name or number of the room' })
  @IsString()
  roomName: string;

  @ApiPropertyOptional({
    description: 'Area or dimensions of the room (e.g., "200 sqft")',
  })
  @IsOptional()
  @IsString()
  area?: string;

  @ApiPropertyOptional({ description: 'Paint color used in the room' })
  @IsOptional()
  @IsString()
  paintColor?: string;

  @ApiPropertyOptional({
    description: 'Type of flooring in the room (e.g., hardwood, tile)',
  })
  @IsOptional()
  @IsString()
  flooring?: string;
}
