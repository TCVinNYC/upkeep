import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  OneToMany,
  CreateDateColumn,
  UpdateDateColumn,
} from 'typeorm';
import { Floor } from './floors/floor.entity';

@Entity()
export class Property {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  name: string;

  @Column()
  address: string;

  @Column({ nullable: true })
  description: string;

  @Column({ nullable: true, type: 'json' })
  images: any; // Stores an array of ImageDto objects

  @Column({ nullable: true })
  buildingType: string;

  @OneToMany(() => Floor, (floor) => floor.property, { cascade: true })
  floors: Floor[];

  @CreateDateColumn()
  createdAt: Date;

  @UpdateDateColumn()
  updatedAt: Date;
}
