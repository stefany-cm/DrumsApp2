import { Entity, Column, PrimaryGeneratedColumn, Unique, CreateDateColumn, OneToMany } from 'typeorm';
import { account_has_users } from "./account_has_users";

@Entity()
export class account {

    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    number: number;

    
    @Column()
    cvs: number;

    // @CreateDateColumn({ type: "timestamp", name: "created_at" })
    // createdAt: Date;
    @Column()
    createdAt: Date;
    

    @OneToMany(type=>account_has_users, account_has_users=>account_has_users.account,{ onDelete: 'CASCADE' ,onUpdate: 'CASCADE' })
    account_has_userss:account_has_users[];
}