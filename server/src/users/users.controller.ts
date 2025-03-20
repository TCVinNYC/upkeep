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
import { UsersService } from './users.service';
import { CreateUserDto } from './dto/create-user.dto';
import { UpdateUserDto } from './dto/update-user.dto';
import { UserUpdateMeDto } from './dto/user-update-me.dto';
import { UserResponseDto } from './dto/user-response.dto';
import { UserAdminCreateDto } from './dto/user-admin-create.dto';
import { UserAdminUpdateDto } from './dto/user-admin-update.dto';
import { UserAdminDeleteDto } from './dto/user-admin-delete.dto';
import { UserAdminResponseDto } from './dto/user-admin-response.dto';
import { ApiTags, ApiBody, ApiParam, ApiResponse } from '@nestjs/swagger';

@ApiTags('Users')
@Controller('users')
export class UsersController {
  constructor(private usersService: UsersService) {}

  // Public/self endpoints

  @Post()
  @ApiBody({ type: CreateUserDto })
  @ApiResponse({ status: 201, description: 'User created successfully.' })
  async create(@Body() dto: CreateUserDto): Promise<UserResponseDto> {
    const user = await this.usersService.create(dto);
    return this.usersService.mapUser(user);
  }

  @Get('me')
  @ApiResponse({ status: 200, description: 'Get details of the current user.' })
  async getMyUser(): Promise<UserResponseDto> {
    // Stub: in production, use the authenticated user ID from a guard
    const user = await this.usersService.findOne('1');
    return this.usersService.mapUser(user);
  }

  @Put('me')
  @ApiBody({ type: UserUpdateMeDto })
  @ApiResponse({ status: 200, description: 'Update current user.' })
  async updateMyUser(@Body() dto: UserUpdateMeDto): Promise<UserResponseDto> {
    if (Object.keys(dto).length === 0) {
      throw new BadRequestException('No update data provided');
    }
    // Stub: use authenticated user ID from a guard; here, '1'
    const user = await this.usersService.update('1', dto);
    return this.usersService.mapUser(user);
  }

  @Delete('me')
  @ApiResponse({ status: 204, description: 'Delete your user account.' })
  async deleteMyUser(): Promise<void> {
    await this.usersService.remove('1');
  }

  @Post('profile-image')
  @ApiBody({ description: 'Upload a profile image', type: Object }) // Replace with a proper DTO
  @ApiResponse({
    status: 200,
    description: 'Profile image uploaded successfully.',
  })
  async createProfileImage(@Body() fileDto: any): Promise<{
    userId: string;
    profileChangedAt: Date;
    profileImagePath: string;
  }> {
    // Stub: in production, use file upload interceptor to get file data
    return this.usersService.createProfileImage(fileDto.file);
  }

  @Delete('profile-image')
  @ApiResponse({
    status: 204,
    description: 'Profile image deleted successfully.',
  })
  async deleteProfileImage(): Promise<void> {
    await this.usersService.deleteProfileImage('1');
  }

  @Get(':id/profile-image')
  @ApiParam({ name: 'id', description: 'User ID' })
  @ApiResponse({ status: 200, description: 'Get profile image for a user.' })
  async getProfileImage(
    @Param('id') id: string,
  ): Promise<{ profileImagePath: string }> {
    return this.usersService.getProfileImage(id);
  }

  @Get(':id')
  @ApiParam({ name: 'id', description: 'User ID' })
  async getUser(@Param('id') id: string): Promise<UserResponseDto> {
    const user = await this.usersService.findOne(id);
    return this.usersService.mapUser(user);
  }
}

// Admin endpoints
@ApiTags('Users (admin)')
@Controller('admin/users')
export class UserAdminController {
  constructor(private usersService: UsersService) {}

  @Get()
  @ApiResponse({ status: 200, description: 'List all users (admin view).' })
  async searchUsersAdmin(): Promise<UserAdminResponseDto[]> {
    const users = await this.usersService.findAll();
    return users.map((user) => this.usersService.mapUserAdmin(user));
  }

  @Post()
  @ApiBody({ type: UserAdminCreateDto })
  @ApiResponse({ status: 201, description: 'Admin created a new user.' })
  async createUserAdmin(
    @Body() dto: UserAdminCreateDto,
  ): Promise<UserAdminResponseDto> {
    const user = await this.usersService.create(dto);
    return this.usersService.mapUserAdmin(user);
  }

  @Get(':id')
  @ApiParam({ name: 'id', description: 'User ID' })
  async getUserAdmin(@Param('id') id: string): Promise<UserAdminResponseDto> {
    const user = await this.usersService.findOne(id);
    return this.usersService.mapUserAdmin(user);
  }

  @Put(':id')
  @ApiParam({ name: 'id', description: 'User ID to update' })
  @ApiBody({ type: UserAdminUpdateDto })
  async updateUserAdmin(
    @Param('id') id: string,
    @Body() dto: UserAdminUpdateDto,
  ): Promise<UserAdminResponseDto> {
    if (Object.keys(dto).length === 0) {
      throw new BadRequestException('No update data provided');
    }
    const user = await this.usersService.update(id, dto);
    return this.usersService.mapUserAdmin(user);
  }

  @Delete(':id')
  @ApiParam({ name: 'id', description: 'User ID to delete' })
  async deleteUserAdmin(@Param('id') id: string): Promise<void> {
    await this.usersService.remove(id);
  }

  @Put(':id/disable')
  @ApiParam({ name: 'id', description: 'User ID to disable' })
  async disableUserAdmin(
    @Param('id') id: string,
  ): Promise<UserAdminResponseDto> {
    const user = await this.usersService.disable(id);
    return this.usersService.mapUserAdmin(user);
  }

  @Put(':id/enable')
  @ApiParam({ name: 'id', description: 'User ID to enable' })
  async enableUserAdmin(
    @Param('id') id: string,
  ): Promise<UserAdminResponseDto> {
    const user = await this.usersService.enable(id);
    return this.usersService.mapUserAdmin(user);
  }

  @Post(':id/restore')
  @ApiParam({ name: 'id', description: 'User ID to restore' })
  @ApiResponse({
    status: 200,
    description: 'User restored successfully (admin).',
  })
  async restoreUserAdmin(
    @Param('id') id: string,
  ): Promise<UserAdminResponseDto> {
    // Restore user means re-enable (clear deletion flags if any)
    const user = await this.usersService.enable(id);
    return this.usersService.mapUserAdmin(user);
  }
}
