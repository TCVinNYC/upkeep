import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  ManyToOne,
  OneToMany,
  CreateDateColumn,
} from 'typeorm';
import { Property } from '../property.entity';
import { Room } from '../rooms/room.entity';

@Entity()
export class Floor {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ nullable: true })
  name: string;

  @Column()
  floorNumber: number;

  @Column({ nullable: true })
  description: string;

  @ManyToOne(() => Property, (property) => property.floors, {
    onDelete: 'CASCADE',
  })
  property: Property;

  @OneToMany(() => Room, (room) => room.floor, { cascade: true })
  rooms: Room[];

  @CreateDateColumn()
  createdAt: Date;
}
