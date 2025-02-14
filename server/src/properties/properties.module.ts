import { Module } from '@nestjs/common';
import { PropertiesService } from './properties.service';
import { PropertiesController } from './properties.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Property } from './property.entity';
import { Floor } from './floors/floor.entity';
import { RoomsModule } from './rooms/rooms.module';

@Module({
  imports: [TypeOrmModule.forFeature([Property, Floor]), RoomsModule],
  providers: [PropertiesService],
  controllers: [PropertiesController],
  exports: [PropertiesService],
})
export class PropertiesModule {}
