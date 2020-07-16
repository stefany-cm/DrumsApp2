import { Entity, Column, PrimaryGeneratedColumn, Unique, CreateDateColumn, OneToMany, ManyToOne, JoinColumn, Index } from 'typeorm';
import {group_has_practice} from "./group_has_practice";
import {partitura} from "./partitura";


@Entity()
@Index("fk_practice_partitura1_idx",["partitura",])
export class practice {

    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    name: string;

    @OneToMany(type=>group_has_practice, group_has_practice=>group_has_practice.practice,{ onDelete: 'CASCADE' ,onUpdate: 'CASCADE' })
    group_has_practices:group_has_practice[];


    @ManyToOne(type=>partitura, partitura=>partitura.practices,{  nullable:false,onDelete: 'CASCADE',onUpdate: 'CASCADE' })
    @JoinColumn({ name:'fk_id_partitura'})
    partitura:partitura ;
}