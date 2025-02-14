import { Module } from '@nestjs/common';
import { ServiceProvidersService } from './service-providers.service';
import { ServiceProvidersController } from './service-providers.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ServiceProvider } from './service-provider.entity';

@Module({
  imports: [TypeOrmModule.forFeature([ServiceProvider])],
  providers: [ServiceProvidersService],
  controllers: [ServiceProvidersController],
})
export class ServiceProvidersModule {}
