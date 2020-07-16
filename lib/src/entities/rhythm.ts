import { Entity, Column, PrimaryGeneratedColumn, Unique, CreateDateColumn, OneToMany } from 'typeorm';
import {group_has_rhythm} from "./group_has_rhythm";
import {partitura} from "./partitura";


@Entity()
export class rhythm {

    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    name: string;

    @Column()
    state: number;

    @OneToMany(type=>group_has_rhythm, group_has_rhythm=>group_has_rhythm.rhythm,{ onDelete: 'CASCADE' ,onUpdate: 'CASCADE' })
    group_has_rhythms:group_has_rhythm[];

    @OneToMany(type=>partitura, partitura=>partitura.rhythm,{ onDelete: 'CASCADE' ,onUpdate: 'CASCADE' })
    partituras:partitura[];
}