import { Entity, Column, PrimaryGeneratedColumn, Unique, CreateDateColumn, OneToMany, ManyToOne, JoinColumn, Index } from 'typeorm';
import {practice} from "./practice";
import {partitura_y} from "./partitura_y";
import {rhythm} from "./rhythm";



@Entity()
@Index("fk_partitura_rhythm1_idx",["rhythm",])
// @Index("fk_partitura_partitura_y2_idx",["partitura_y",])
export class partitura {

    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    name: string;

    @Column()
    state: number;
    @Column()
    createdAt: Date;

    @OneToMany(type=>practice, practice=>practice.partitura,{ onDelete: 'CASCADE' ,onUpdate: 'CASCADE' })
    practices:practice[];


    @ManyToOne(type=>rhythm, rhythm=>rhythm.partituras,{  nullable:false,onDelete: 'CASCADE',onUpdate: 'CASCADE' })
    @JoinColumn({ name:'fk_id_rhythm'})
    rhythm:rhythm ;


    // @ManyToOne(type=>partitura_y, partitura_y=>partitura_y.partituras,{  nullable:false,onDelete: 'CASCADE',onUpdate: 'CASCADE' })
    // @JoinColumn({ name:'fk_id_partitura_y'})
    // partitura_y:partitura_y ;

    @OneToMany(type=>partitura_y, partitura_y=>partitura_y.partitura,{ onDelete: 'CASCADE' ,onUpdate: 'CASCADE' })
    partitura_ys:partitura_y[];
}