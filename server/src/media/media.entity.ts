import { Entity, PrimaryGeneratedColumn, Column } from 'typeorm';

@Entity()
export class Media {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  url: string;

  @Column({ nullable: true })
  caption: string;

  @Column({ nullable: true })
  entityId: number; // Reference to the entity (property, room, etc.)

  @Column({ nullable: true })
  entityType: string; // e.g., 'property', 'room'
}
