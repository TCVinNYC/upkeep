import { Module } from '@nestjs/common';
import { UsersService } from './users.service';
import { UsersController, UserAdminController } from './users.controller';
import { UserEntity } from './user.entity';
import { TypeOrmModule } from '@nestjs/typeorm';

@Module({
  imports: [TypeOrmModule.forFeature([UserEntity])],
  providers: [UsersService],
  controllers: [UsersController, UserAdminController],
  exports: [UsersService],
})
export class UsersModule {}
