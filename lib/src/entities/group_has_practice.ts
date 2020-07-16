import { Entity, Column, PrimaryGeneratedColumn, Unique, CreateDateColumn, JoinColumn, ManyToOne, Index } from 'typeorm';
import {group} from "./group";
import {practice} from "./practice";


@Entity()
@Index("fk_practice__group1_idx",["practice",])
@Index("fk_group_practice1_idx",["group",])
export class group_has_practice {

    @PrimaryGeneratedColumn()
    id: number;

    // @CreateDateColumn({ type: "timestamp", name: "created_at" })
    // createdAt: Date;
    @Column()
    createdAt: Date;
    
    @ManyToOne(type=>group, group=>group.group_has_practices,{  nullable:false,onDelete: 'CASCADE',onUpdate: 'CASCADE' })
    @JoinColumn({ name:'fk_id_group'})
    group:group ;


    @ManyToOne(type=>practice, practice=>practice.group_has_practices,{  nullable:false,onDelete: 'CASCADE',onUpdate: 'CASCADE' })
    @JoinColumn({ name:'fk_id_practice'})
    practice:practice;


}