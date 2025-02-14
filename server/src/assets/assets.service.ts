import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Asset } from './asset.entity';
import { Repository } from 'typeorm';
import { CreateAssetDto } from './dto/create-asset.dto';
import { UpdateAssetDto } from './dto/update-asset.dto';

@Injectable()
export class AssetsService {
  constructor(
    @InjectRepository(Asset)
    private assetsRepository: Repository<Asset>,
  ) {}

  async findAssetsForRoom(roomId: number): Promise<Asset[]> {
    return this.assetsRepository.find({
      where: { ownerType: 'room', ownerId: roomId },
    });
  }

  async findAll(ownerType?: string, ownerId?: number): Promise<Asset[]> {
    const query = this.assetsRepository.createQueryBuilder('asset');
    if (ownerType) {
      query.andWhere('asset.ownerType = :ownerType', { ownerType });
    }
    if (ownerId) {
      query.andWhere('asset.ownerId = :ownerId', { ownerId });
    }
    return query.getMany();
  }

  async findOne(id: number): Promise<Asset> {
    return this.assetsRepository.findOne({ where: { id } });
  }

  async create(createAssetDto: CreateAssetDto): Promise<Asset> {
    const asset = this.assetsRepository.create(createAssetDto);
    return this.assetsRepository.save(asset);
  }

  async update(id: number, updateAssetDto: UpdateAssetDto): Promise<Asset> {
    await this.assetsRepository.update(id, updateAssetDto);
    return this.findOne(id);
  }

  async remove(id: number): Promise<void> {
    await this.assetsRepository.delete(id);
  }
}
