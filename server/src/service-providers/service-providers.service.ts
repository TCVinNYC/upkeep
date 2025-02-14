import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { ServiceProvider } from './service-provider.entity';
import { Repository } from 'typeorm';
import { CreateServiceProviderDto } from './dto/create-service-provider.dto';
import { UpdateServiceProviderDto } from './dto/update-service-provider.dto';

@Injectable()
export class ServiceProvidersService {
  constructor(
    @InjectRepository(ServiceProvider)
    private serviceProviderRepository: Repository<ServiceProvider>,
  ) {}

  async findAll(): Promise<ServiceProvider[]> {
    return this.serviceProviderRepository.find();
  }

  async findOne(id: number): Promise<ServiceProvider> {
    return this.serviceProviderRepository.findOne({ where: { id } });
  }

  async create(createDto: CreateServiceProviderDto): Promise<ServiceProvider> {
    const provider = this.serviceProviderRepository.create(createDto);
    return this.serviceProviderRepository.save(provider);
  }

  async update(
    id: number,
    updateDto: UpdateServiceProviderDto,
  ): Promise<ServiceProvider> {
    await this.serviceProviderRepository.update(id, updateDto);
    return this.findOne(id);
  }

  async remove(id: number): Promise<void> {
    await this.serviceProviderRepository.delete(id);
  }
}
