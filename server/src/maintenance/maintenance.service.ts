import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Maintenance } from './maintenance.entity';
import { Repository } from 'typeorm';
import { CreateMaintenanceDto } from './dto/create-maintenance.dto';
import { UpdateMaintenanceDto } from './dto/update-maintenance.dto';

@Injectable()
export class MaintenanceService {
  constructor(
    @InjectRepository(Maintenance)
    private maintenanceRepository: Repository<Maintenance>,
  ) {}

  async findAll(roomId: number): Promise<Maintenance[]> {
    return this.maintenanceRepository.find({ where: { room: { id: roomId } } });
  }

  async findOne(id: number): Promise<Maintenance> {
    return this.maintenanceRepository.findOne({ where: { id } });
  }

  async create(
    createMaintenanceDto: CreateMaintenanceDto,
    roomId: number,
  ): Promise<Maintenance> {
    const maintenance = this.maintenanceRepository.create({
      ...createMaintenanceDto,
      room: { id: roomId },
    });
    return this.maintenanceRepository.save(maintenance);
  }

  async update(
    id: number,
    updateMaintenanceDto: UpdateMaintenanceDto,
  ): Promise<Maintenance> {
    await this.maintenanceRepository.update(id, updateMaintenanceDto);
    return this.findOne(id);
  }

  async remove(id: number): Promise<void> {
    await this.maintenanceRepository.delete(id);
  }
}
