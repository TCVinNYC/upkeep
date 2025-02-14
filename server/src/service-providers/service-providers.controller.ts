import {
  Controller,
  Get,
  Post,
  Put,
  Delete,
  Param,
  Body,
} from '@nestjs/common';
import { ServiceProvidersService } from './service-providers.service';
import { CreateServiceProviderDto } from './dto/create-service-provider.dto';
import { UpdateServiceProviderDto } from './dto/update-service-provider.dto';
import { ApiTags, ApiParam, ApiBody, ApiResponse } from '@nestjs/swagger';

@ApiTags('service-providers')
@Controller('service-providers')
export class ServiceProvidersController {
  constructor(private serviceProvidersService: ServiceProvidersService) {}

  @Get()
  @ApiResponse({ status: 200, description: 'List all service providers' })
  async findAll() {
    return this.serviceProvidersService.findAll();
  }

  @Get(':id')
  @ApiParam({ name: 'id', description: 'ID of the service provider' })
  async findOne(@Param('id') id: string) {
    return this.serviceProvidersService.findOne(+id);
  }

  @Post()
  @ApiBody({ type: CreateServiceProviderDto })
  async create(@Body() createDto: CreateServiceProviderDto) {
    return this.serviceProvidersService.create(createDto);
  }

  @Put(':id')
  @ApiParam({ name: 'id', description: 'ID of the service provider' })
  @ApiBody({ type: UpdateServiceProviderDto })
  async update(
    @Param('id') id: string,
    @Body() updateDto: UpdateServiceProviderDto,
  ) {
    return this.serviceProvidersService.update(+id, updateDto);
  }

  @Delete(':id')
  @ApiParam({ name: 'id', description: 'ID of the service provider' })
  async remove(@Param('id') id: string) {
    return this.serviceProvidersService.remove(+id);
  }
}
