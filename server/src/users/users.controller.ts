import {
  Controller,
  Get,
  Post,
  Put,
  Delete,
  Param,
  Body,
  BadRequestException,
} from '@nestjs/common';
import { UpdateUserDto } from './dto/update-user.dto';
import { CreateUserDto } from './dto/create-user.dto';
import { UsersService } from './users.service';
import { ApiTags, ApiBody, ApiParam, ApiResponse } from '@nestjs/swagger';

@ApiTags('users')
@Controller('users')
export class UsersController {
  constructor(private usersService: UsersService) {}

  @Get()
  @ApiResponse({ status: 200, description: 'List all users' })
  async findAll() {
    return this.usersService.findAll();
  }

  @Get(':id')
  @ApiParam({ name: 'id', description: 'ID of the user' })
  async findOne(@Param('id') id: string) {
    return this.usersService.findOne(+id);
  }

  @Post()
  @ApiBody({ type: CreateUserDto })
  @ApiResponse({ status: 201, description: 'User created successfully.' })
  async create(@Body() createUserDto: CreateUserDto) {
    return this.usersService.create(createUserDto);
  }

  @Put(':id')
  @ApiParam({ name: 'id', description: 'ID of the user to update' })
  @ApiBody({ type: UpdateUserDto })
  async update(@Param('id') id: string, @Body() updateUserDto: UpdateUserDto) {
    // If updateUserDto is empty, return a 400 Bad Request
    if (Object.keys(updateUserDto).length === 0) {
      throw new BadRequestException('No data provided for update');
    }
    return this.usersService.update(+id, updateUserDto);
  }

  @Delete(':id')
  @ApiParam({ name: 'id', description: 'ID of the user to delete' })
  async remove(@Param('id') id: string) {
    return this.usersService.remove(+id);
  }

  @Put(':id/disable')
  @ApiParam({ name: 'id', description: 'ID of the user to disable' })
  async disable(@Param('id') id: string) {
    return this.usersService.disable(+id);
  }

  @Put(':id/enable')
  @ApiParam({ name: 'id', description: 'ID of the user to enable' })
  async enable(@Param('id') id: string) {
    return this.usersService.enable(+id);
  }
}
