import { IsString, IsOptional } from 'class-validator';
import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';

export class CreateServiceProviderDto {
  @ApiProperty({ description: 'Name of the service provider' })
  @IsString()
  name: string;

  @ApiProperty({
    description: 'Contact information (phone, email, etc.) for the provider',
  })
  @IsString()
  contactInfo: string;

  @ApiPropertyOptional({
    description: 'Additional details or description of the provider',
  })
  @IsOptional()
  @IsString()
  description?: string;

  @ApiProperty({
    description: 'Timestamp when the service provider record was created',
    readOnly: true,
  })
  readonly createdAt?: Date;
}
