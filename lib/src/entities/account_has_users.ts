import { Entity, Column, PrimaryGeneratedColumn, Unique, CreateDateColumn, JoinColumn, ManyToOne, Index } from 'typeorm';
import {account} from "./account";
import {user} from "./user";


@Entity()
@Index("fk_user__account1_idx",["user",])
@Index("fk_account__user1_idx",["account",])
export class account_has_users {

   

   

    @PrimaryGeneratedColumn()
    id: number;

    // @CreateDateColumn({ type: "timestamp", name: "created_at" })
    // createdAt: Date;
    @Column()
    createdAt: Date;
    
    @ManyToOne(type=>account, account=>account.account_has_userss,{  nullable:false,onDelete: 'CASCADE',onUpdate: 'CASCADE' })
    @JoinColumn({ name:'fk_id_account'})
    account:account ;


    @ManyToOne(type=>user, user=>user.account_has_userss,{  nullable:false,onDelete: 'CASCADE',onUpdate: 'CASCADE' })
    @JoinColumn({ name:'fk_id_user'})
    user:user ;


}