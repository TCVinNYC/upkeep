import {
  Controller,
  Get,
  Post,
  Put,
  Delete,
  Param,
  Query,
  Body,
} from '@nestjs/common';
import { AssetsService } from './assets.service';
import { CreateAssetDto } from './dto/create-asset.dto';
import { UpdateAssetDto } from './dto/update-asset.dto';
import {
  ApiTags,
  ApiParam,
  ApiQuery,
  ApiBody,
  ApiResponse,
} from '@nestjs/swagger';

@ApiTags('assets')
@Controller('assets')
export class AssetsController {
  constructor(private assetsService: AssetsService) {}

  @Get()
  @ApiQuery({
    name: 'ownerType',
    required: false,
    description: 'Filter by parent type (e.g., room, floor, property)',
  })
  @ApiQuery({
    name: 'ownerId',
    required: false,
    description: 'Filter by parent entity ID',
  })
  @ApiResponse({
    status: 200,
    description: 'List assets with optional filtering',
  })
  async findAll(
    @Query('ownerType') ownerType?: string,
    @Query('ownerId') ownerId?: number,
  ) {
    return this.assetsService.findAll(ownerType, ownerId);
  }

  @Get(':id')
  @ApiParam({ name: 'id', description: 'ID of the asset' })
  async findOne(@Param('id') id: string) {
    return this.assetsService.findOne(+id);
  }

  @Post()
  @ApiBody({ type: CreateAssetDto })
  async create(@Body() createAssetDto: CreateAssetDto) {
    return this.assetsService.create(createAssetDto);
  }

  @Put(':id')
  @ApiParam({ name: 'id', description: 'ID of the asset' })
  @ApiBody({ type: UpdateAssetDto })
  async update(
    @Param('id') id: string,
    @Body() updateAssetDto: UpdateAssetDto,
  ) {
    return this.assetsService.update(+id, updateAssetDto);
  }

  @Delete(':id')
  @ApiParam({ name: 'id', description: 'ID of the asset' })
  async remove(@Param('id') id: string) {
    return this.assetsService.remove(+id);
  }
}
