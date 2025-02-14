import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  ManyToOne,
  OneToMany,
  CreateDateColumn,
} from 'typeorm';
import { Floor } from '../floors/floor.entity';
import { Maintenance } from '../../maintenance/maintenance.entity';

@Entity()
export class Room {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  roomName: string;

  @Column({ nullable: true })
  area: string;

  @Column({ nullable: true })
  paintColor: string;

  @Column({ nullable: true })
  flooring: string;

  @ManyToOne(() => Floor, (floor) => floor.rooms, { onDelete: 'CASCADE' })
  floor: Floor;

  @OneToMany(() => Maintenance, (maintenance) => maintenance.room, {
    cascade: true,
  })
  maintenanceRecords: Maintenance[];

  @CreateDateColumn()
  createdAt: Date;
}
