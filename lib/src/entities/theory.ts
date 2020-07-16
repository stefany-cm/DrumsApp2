import { Entity, Column, PrimaryGeneratedColumn, Unique, CreateDateColumn, OneToMany } from 'typeorm';
import {group_has_theory} from "./group_has_theory";

@Entity()
export class theory {

    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    name: string;

    @Column()
    description: string;

    @Column()
    state: number;


    @OneToMany(type=>group_has_theory, group_has_theory=>group_has_theory.theory ,{ onDelete: 'CASCADE' ,onUpdate: 'CASCADE' })
    group_has_theorys:group_has_theory[];
}