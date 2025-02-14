import { Entity, PrimaryGeneratedColumn, Column, ManyToOne } from 'typeorm';
import { Room } from '../properties/rooms/room.entity';

@Entity()
export class Maintenance {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ type: 'timestamp' })
  date: Date;

  @Column('decimal')
  cost: number;

  @Column()
  performedBy: string;

  @Column({ nullable: true })
  notes: string;

  @ManyToOne(() => Room, (room) => room.maintenanceRecords, {
    onDelete: 'CASCADE',
  })
  room: Room;
}
