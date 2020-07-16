import { Entity, Column, PrimaryGeneratedColumn, Unique, CreateDateColumn, JoinColumn, ManyToOne, Index } from 'typeorm';
import {group} from "./group";
import {theory} from "./theory";


@Entity()
@Index("fk_theory__group1_idx",["theory",])
@Index("fk_group_theory1_idx",["group",])
export class group_has_theory {

    @PrimaryGeneratedColumn()
    id: number;

    // @CreateDateColumn({ type: "timestamp", name: "created_at" })
    // createdAt: Date;
    @Column()
    createdAt: Date;
    
    @ManyToOne(type=>theory, theory=>theory.group_has_theorys,{  nullable:false,onDelete: 'CASCADE',onUpdate: 'CASCADE' })
    @JoinColumn({ name:'fk_id_theory'})
    theory:theory ;

    @ManyToOne(type=>group, group=>group.group_has_theorys,{  nullable:false,onDelete: 'CASCADE',onUpdate: 'CASCADE' })
    @JoinColumn({ name:'fk_id_group'})
    group:group ;

    
}