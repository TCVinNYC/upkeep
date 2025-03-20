import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  CreateDateColumn,
} from 'typeorm';
import { Exclude } from 'class-transformer';

@Entity()
export class UserEntity {
  @PrimaryGeneratedColumn('uuid')
  id: string;

  @Column({ unique: true })
  email: string;

  @Column()
  @Exclude() // Do not expose hashed password
  password: string;

  @Column()
  name: string;

  @Column({ nullable: true })
  profileImagePath: string;

  // Optional internal role field – global default is 'user'
  @Column({ default: 'user' })
  role: string;

  @CreateDateColumn()
  createdAt: Date;

  @Column({ nullable: true, type: 'timestamp' })
  lastLogin: Date;

  @Column({ nullable: true, type: 'timestamp' })
  updatedAt: Date;

  @Column({ nullable: true, type: 'timestamp' })
  deletedAt: Date | null;

  // Additional metadata (preferences, etc.)
  @Column({ type: 'json', nullable: true })
  metadata: any;

  @Column({ default: false })
  shouldChangePassword: boolean;
}
