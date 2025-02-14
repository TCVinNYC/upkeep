import { Injectable } from '@nestjs/common';
import { Repository } from 'typeorm';
import { Property } from './property.entity';
import { InjectRepository } from '@nestjs/typeorm';
import { CreatePropertyDto } from './dto/create-property.dto';
import { UpdatePropertyDto } from './dto/update-property.dto';

@Injectable()
export class PropertiesService {
  constructor(
    @InjectRepository(Property)
    private propertiesRepository: Repository<Property>,
  ) {}

  async findAll(): Promise<Property[]> {
    return this.propertiesRepository.find({ relations: ['floors'] });
  }

  async findOne(id: number): Promise<Property> {
    return this.propertiesRepository.findOne({
      where: { id },
      relations: ['floors'],
    });
  }

  async create(createPropertyDto: CreatePropertyDto): Promise<Property> {
    const property = this.propertiesRepository.create(createPropertyDto);
    return this.propertiesRepository.save(property);
  }

  async update(
    id: number,
    updatePropertyDto: UpdatePropertyDto,
  ): Promise<Property> {
    await this.propertiesRepository.update(id, updatePropertyDto);
    return this.findOne(id);
  }

  async remove(id: number): Promise<void> {
    await this.propertiesRepository.delete(id);
  }
}
