import { Injectable, NotFoundException } from '@nestjs/common';
import { Repository } from 'typeorm';
import { UserEntity } from './user.entity';
import { InjectRepository } from '@nestjs/typeorm';
import { CreateUserDto } from './dto/create-user.dto';
import { UpdateUserDto } from './dto/update-user.dto';
import * as bcrypt from 'bcryptjs';

@Injectable()
export class UsersService {
  constructor(
    @InjectRepository(UserEntity)
    private usersRepository: Repository<UserEntity>,
  ) {}

  async findAll(): Promise<UserEntity[]> {
    return this.usersRepository.find();
  }

  async findOne(id: string): Promise<UserEntity> {
    const user = await this.usersRepository.findOne({ where: { id } });
    if (!user) {
      throw new NotFoundException(`User with ID ${id} not found`);
    }
    return user;
  }

  async findByEmail(email: string): Promise<UserEntity | undefined> {
    return this.usersRepository.findOne({ where: { email } });
  }

  async create(dto: CreateUserDto): Promise<UserEntity> {
    const user = new UserEntity();
    user.email = dto.email;
    user.name = dto.name;
    user.password = await bcrypt.hash(dto.password, 10);
    // Use the provided role if exists; default to 'user'
    user.role = dto.role || 'user';
    return this.usersRepository.save(user);
  }

  async update(id: string, dto: UpdateUserDto): Promise<UserEntity> {
    await this.usersRepository.update(id, dto);
    return this.findOne(id);
  }

  async remove(id: string): Promise<void> {
    await this.usersRepository.delete(id);
  }

  async disable(id: string): Promise<UserEntity> {
    await this.usersRepository.update(id, { role: 'disabled' });
    return this.findOne(id);
  }

  async enable(id: string): Promise<UserEntity> {
    await this.usersRepository.update(id, { role: 'user' });
    return this.findOne(id);
  }

  async updateLastLogin(id: string, lastLogin: Date): Promise<void> {
    await this.usersRepository.update(id, { lastLogin });
  }

  async getAdmin(): Promise<UserEntity | undefined> {
    return this.usersRepository.findOne({ where: { role: 'admin' } });
  }

  // Stub implementations for profile image endpoints
  async createProfileImage(file: File): Promise<{
    userId: string;
    profileChangedAt: Date;
    profileImagePath: string;
  }> {
    // In a real application, store the file and update the user record.
    return {
      userId: '1',
      profileChangedAt: new Date(),
      profileImagePath: 'http://example.com/new-profile.jpg',
    };
  }

  async deleteProfileImage(userId: string): Promise<void> {
    await this.usersRepository.update(userId, { profileImagePath: null });
  }

  async getProfileImage(userId: string): Promise<{ profileImagePath: string }> {
    const user = await this.findOne(userId);
    return { profileImagePath: user.profileImagePath };
  }

  // Helper mapping functions
  mapUser(entity: UserEntity) {
    const dto = {
      id: entity.id,
      email: entity.email,
      name: entity.name,
      profileImagePath: entity.profileImagePath,
      updatedAt: entity.updatedAt,
    };
    return dto;
  }

  mapUserAdmin(entity: UserEntity) {
    return {
      ...this.mapUser(entity),
      role: entity.role,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      deletedAt: entity.deletedAt,
    };
  }
}
