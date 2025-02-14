import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  CreateDateColumn,
  UpdateDateColumn,
} from 'typeorm';

@Entity()
export class Asset {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  name: string;

  @Column()
  assetType: string;

  @Column({ nullable: true })
  description: string;

  @Column({ nullable: true })
  manufacturer: string;

  @Column({ nullable: true })
  model: string;

  @Column({ type: 'timestamp', nullable: true })
  installationDate: Date;

  @Column({ type: 'timestamp', nullable: true })
  warrantyExpiration: Date;

  // Polymorphic association:
  @Column()
  ownerType: string; // e.g. "room", "floor", "property"

  @Column()
  ownerId: number; // the ID of the associated entity

  @CreateDateColumn()
  createdAt: Date;

  @UpdateDateColumn()
  updatedAt: Date;
}
