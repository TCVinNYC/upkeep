// src/properties/rooms/rooms.service.ts
import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Room } from './room.entity';
import { Repository } from 'typeorm';
import { CreateRoomDto } from './dto/create-room.dto';
import { UpdateRoomDto } from './dto/update-room.dto';

@Injectable()
export class RoomsService {
  constructor(
    @InjectRepository(Room)
    private roomRepository: Repository<Room>,
  ) {}

  async findAll(floorId: number): Promise<Room[]> {
    return this.roomRepository.find({ where: { floor: { id: floorId } } });
  }

  async findOne(id: number): Promise<Room> {
    return this.roomRepository.findOne({ where: { id } });
  }

  async create(createRoomDto: CreateRoomDto, floorId: number): Promise<Room> {
    const room = this.roomRepository.create({
      ...createRoomDto,
      floor: { id: floorId },
    });
    return this.roomRepository.save(room);
  }

  async update(id: number, updateRoomDto: UpdateRoomDto): Promise<Room> {
    await this.roomRepository.update(id, updateRoomDto);
    return this.findOne(id);
  }

  async remove(id: number): Promise<void> {
    await this.roomRepository.delete(id);
  }
}
