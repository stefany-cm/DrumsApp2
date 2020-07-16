import { Entity, Column, PrimaryGeneratedColumn, Unique, CreateDateColumn, ManyToOne, JoinColumn, Index } from 'typeorm';
import {partitura_y} from "./partitura_y";

@Entity()
@Index("fk_partitura_x_fkIdpartitura_y1_idx",["partitura_y",])

export class partitura_x {

    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    x1: number;

    
    @ManyToOne(type=>partitura_y, partitura_y=>partitura_y.partitura_xs,{  nullable:false,onDelete: 'CASCADE',onUpdate: 'CASCADE' })
    @JoinColumn({ name:'fk_id_partitura_y'})
    partitura_y:partitura_y ;
}