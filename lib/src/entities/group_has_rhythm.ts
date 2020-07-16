import { Entity, Column, PrimaryGeneratedColumn, Unique, CreateDateColumn, ManyToOne, JoinColumn, Index } from 'typeorm';
import {rhythm} from "./rhythm";
import {group} from "./group";


@Entity()
@Index("fk_rhythm__group2_idx",["rhythm",])
@Index("fk_group_rhythm2_idx",["group",])
export class group_has_rhythm {

    @PrimaryGeneratedColumn()
    id: number;

    // @CreateDateColumn({ type: "timestamp", name: "created_at" })
    // createdAt: Date;
    @Column()
    createdAt: Date;

    @ManyToOne(type=>group, group=>group.group_has_rhythms,{  nullable:false,onDelete: 'CASCADE',onUpdate: 'CASCADE' })
    @JoinColumn({ name:'fk_id_group'})
    group:group ;


    @ManyToOne(type=>rhythm, rhythm=>rhythm.group_has_rhythms,{  nullable:false,onDelete: 'CASCADE',onUpdate: 'CASCADE' })
    @JoinColumn({ name:'fk_id_rhythm'})
    rhythm:rhythm ;
}