import { Entity, Column, PrimaryGeneratedColumn, Unique, CreateDateColumn, OneToMany } from 'typeorm';
import { plan } from "./plan";

@Entity()
export class type_plan {

    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    name: string;

    @OneToMany(type=>plan, plan=>plan.type_plan,{ onDelete: 'CASCADE' ,onUpdate: 'CASCADE' })
    plans:plan[];
}