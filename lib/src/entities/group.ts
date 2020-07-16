import { Entity, Column, PrimaryGeneratedColumn, Unique, CreateDateColumn, OneToMany, ManyToOne, JoinColumn, Index } from 'typeorm';
import {group_has_practice} from "./group_has_practice";
import {user_has_group} from "./user_has_group";
import {group_has_rhythm} from "./group_has_rhythm";
import {group_has_theory} from "./group_has_theory";
import {organization} from "./organization";



@Entity()
@Index("fk_organization_group_idx",["organization",])
export class group {

    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    name: string;
    
    @Column()
    key: number;
    
    @Column()
    state: number;

    @Column()
    image: string;

    // @CreateDateColumn({ type: "timestamp", name: "created_at" })
    // createdAt: Date;
    @Column()
    createdAt: Date;


    @OneToMany(type=>group_has_practice, group_has_practice=>group_has_practice.group,{ onDelete: 'CASCADE' ,onUpdate: 'CASCADE' })
    group_has_practices:group_has_practice[];

    @OneToMany(type=>user_has_group, user_has_group=>user_has_group.group,{ onDelete: 'CASCADE' ,onUpdate: 'CASCADE' })
    user_has_groups:user_has_group[];

    @OneToMany(type=>group_has_rhythm, group_has_rhythm=>group_has_rhythm.group,{ onDelete: 'CASCADE' ,onUpdate: 'CASCADE' })
    group_has_rhythms:group_has_rhythm[];

    @OneToMany(type=>group_has_theory, group_has_theory=>group_has_theory.group,{ onDelete: 'CASCADE' ,onUpdate: 'CASCADE' })
    group_has_theorys:group_has_theory[];

    @ManyToOne(type=>organization, organization=>organization.groups,{  nullable:false,onDelete: 'CASCADE',onUpdate: 'CASCADE' })
    @JoinColumn({ name:'fk_id_organization'})
    organization:organization ;

}