// src/properties/rooms/rooms.controller.ts
import {
  Controller,
  Get,
  Post,
  Put,
  Delete,
  Param,
  Body,
} from '@nestjs/common';
import { RoomsService } from './rooms.service';
import { CreateRoomDto } from './dto/create-room.dto';
import { UpdateRoomDto } from './dto/update-room.dto';
import { ApiParam, ApiTags } from '@nestjs/swagger';

@ApiTags('rooms')
@Controller('floors/:floorId/rooms')
export class RoomsController {
  constructor(private roomsService: RoomsService) {}

  @Get()
  @ApiParam({
    name: 'floorId',
    description: 'ID of the floor to list rooms for',
  })
  async findAll(@Param('floorId') floorId: string) {
    return this.roomsService.findAll(+floorId);
  }

  @Get(':id')
  async findOne(@Param('id') id: string) {
    return this.roomsService.findOne(+id);
  }

  @Post()
  async create(
    @Param('floorId') floorId: string,
    @Body() createRoomDto: CreateRoomDto,
  ) {
    return this.roomsService.create(createRoomDto, +floorId);
  }

  @Put(':id')
  async update(@Param('id') id: string, @Body() updateRoomDto: UpdateRoomDto) {
    return this.roomsService.update(+id, updateRoomDto);
  }

  @Delete(':id')
  async remove(@Param('id') id: string) {
    return this.roomsService.remove(+id);
  }
}
