import { Injectable, NotFoundException } from '@nestjs/common';
import { Repository } from 'typeorm';
import { User } from './user.entity';
import { InjectRepository } from '@nestjs/typeorm';
import { CreateUserDto } from './dto/create-user.dto';
import * as bcrypt from 'bcryptjs';

@Injectable()
export class UsersService {
  constructor(
    @InjectRepository(User)
    private usersRepository: Repository<User>,
  ) {}

  async findAll(): Promise<User[]> {
    return this.usersRepository.find();
  }

  async findOne(id: number): Promise<User> {
    const user = await this.usersRepository.findOne({ where: { id } });
    if (!user) {
      throw new NotFoundException(`User with ID ${id} not found`);
    }
    return user;
  }

  async findByUsername(username: string): Promise<User | undefined> {
    return this.usersRepository.findOne({ where: { username } });
  }

  async create(createUserDto: CreateUserDto): Promise<User> {
    const user = new User();
    user.username = createUserDto.username;
    user.password = await bcrypt.hash(createUserDto.password, 10);
    user.role = createUserDto.role || 'user';
    user.email = createUserDto.email;
    return this.usersRepository.save(user);
  }

  async update(id: number, updateData: Partial<CreateUserDto>): Promise<User> {
    await this.usersRepository.update(id, updateData);
    return this.findOne(id);
  }

  async remove(id: number): Promise<void> {
    await this.usersRepository.delete(id);
  }

  async disable(id: number): Promise<User> {
    // Mark the user as disabled (or inactive)
    await this.usersRepository.update(id, { role: 'disabled' });
    return this.findOne(id);
  }

  async enable(id: number): Promise<User> {
    // Re-enable the user by setting the role back to 'user'
    await this.usersRepository.update(id, { role: 'user' });
    return this.findOne(id);
  }

  async updateLastLogin(id: number, lastLogin: Date): Promise<void> {
    await this.usersRepository.update(id, { lastLogin });
  }
}
