import {
  Controller,
  Get,
  Post,
  Put,
  Delete,
  Param,
  Body,
} from '@nestjs/common';
import { PropertiesService } from './properties.service';
import { CreatePropertyDto } from './dto/create-property.dto';
import { UpdatePropertyDto } from './dto/update-property.dto';
import { ApiTags, ApiBody, ApiParam, ApiResponse } from '@nestjs/swagger';

@ApiTags('properties')
@Controller('properties')
export class PropertiesController {
  constructor(private propertiesService: PropertiesService) {}

  @Get()
  @ApiResponse({ status: 200, description: 'List all properties' })
  async findAll() {
    return this.propertiesService.findAll();
  }

  @Get(':id')
  @ApiParam({ name: 'id', description: 'ID of the property' })
  async findOne(@Param('id') id: string) {
    return this.propertiesService.findOne(+id);
  }

  @Post()
  @ApiBody({ type: CreatePropertyDto })
  @ApiResponse({ status: 201, description: 'Property created successfully' })
  async create(@Body() createPropertyDto: CreatePropertyDto) {
    return this.propertiesService.create(createPropertyDto);
  }

  @Put(':id')
  @ApiParam({ name: 'id', description: 'ID of the property' })
  @ApiBody({ type: UpdatePropertyDto })
  async update(
    @Param('id') id: string,
    @Body() updatePropertyDto: UpdatePropertyDto,
  ) {
    return this.propertiesService.update(+id, updatePropertyDto);
  }

  @Delete(':id')
  @ApiParam({ name: 'id', description: 'ID of the property' })
  async remove(@Param('id') id: string) {
    return this.propertiesService.remove(+id);
  }
}
