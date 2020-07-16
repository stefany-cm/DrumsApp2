import { Entity, Column, PrimaryGeneratedColumn, Unique, CreateDateColumn, ManyToOne, JoinColumn, Index } from 'typeorm';
import {user} from "./user";
import {group} from "./group";


@Entity()
@Index("fk_group_user1_idx",["group",])
@Index("fk_user_group1_idx",["user",])
export class user_has_group {


    @PrimaryGeneratedColumn()
    id: number;

    // @CreateDateColumn({ type: "timestamp", name: "created_at" })
    // createdAt: Date;
    

    

    @ManyToOne(type=>user, user=>user.user_has_groups,{  nullable:false,onDelete: 'CASCADE',onUpdate: 'CASCADE' })
    @JoinColumn({ name:'fk_id_user'})
    user:user ;

    @ManyToOne(type=>group, group=>group.user_has_groups,{  nullable:false,onDelete: 'CASCADE',onUpdate: 'CASCADE' })
    @JoinColumn({ name:'fk_id_group'})
    group:group ;

}