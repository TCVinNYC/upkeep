import {
  Controller,
  Get,
  Post,
  Put,
  Delete,
  Param,
  Body,
} from '@nestjs/common';
import { MaintenanceService } from './maintenance.service';
import { CreateMaintenanceDto } from './dto/create-maintenance.dto';
import { UpdateMaintenanceDto } from './dto/update-maintenance.dto';
import { ApiTags, ApiParam, ApiBody, ApiResponse } from '@nestjs/swagger';

@ApiTags('maintenance')
@Controller('rooms/:roomId/maintenance')
export class MaintenanceController {
  constructor(private maintenanceService: MaintenanceService) {}

  @Get()
  @ApiParam({ name: 'roomId', description: 'ID of the room' })
  @ApiResponse({
    status: 200,
    description: 'List maintenance records for the room',
  })
  async findAll(@Param('roomId') roomId: string) {
    return this.maintenanceService.findAll(+roomId);
  }

  @Get(':id')
  @ApiParam({ name: 'id', description: 'ID of the maintenance record' })
  async findOne(@Param('id') id: string) {
    return this.maintenanceService.findOne(+id);
  }

  @Post()
  @ApiParam({ name: 'roomId', description: 'ID of the room' })
  @ApiBody({ type: CreateMaintenanceDto })
  async create(
    @Param('roomId') roomId: string,
    @Body() createMaintenanceDto: CreateMaintenanceDto,
  ) {
    return this.maintenanceService.create(createMaintenanceDto, +roomId);
  }

  @Put(':id')
  @ApiParam({ name: 'id', description: 'ID of the maintenance record' })
  @ApiBody({ type: UpdateMaintenanceDto })
  async update(
    @Param('id') id: string,
    @Body() updateMaintenanceDto: UpdateMaintenanceDto,
  ) {
    return this.maintenanceService.update(+id, updateMaintenanceDto);
  }

  @Delete(':id')
  @ApiParam({ name: 'id', description: 'ID of the maintenance record' })
  async remove(@Param('id') id: string) {
    return this.maintenanceService.remove(+id);
  }
}
