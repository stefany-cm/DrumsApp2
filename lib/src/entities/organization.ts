import { Entity, Column, PrimaryGeneratedColumn, Unique, CreateDateColumn, JoinColumn, ManyToOne, Index, OneToMany } from 'typeorm';
import {group} from "./group";
import {user} from "./user";



@Entity()
// @Index("fk_organization_group_idx",["group",])
@Index("fk_organization_user_idx",["user",])
export class organization {

    @PrimaryGeneratedColumn()
    id: number;

    
    // @CreateDateColumn({ type: "timestamp", name: "created_at" })
    // createdAt: Date;
    @Column()
    key: number;
    
    @Column()
    image: String;

    @Column()
    name: String;
    
    @Column()
    createdAt: Date;
    
  
    @OneToMany(type=>group, group=>group.organization,{ onDelete: 'CASCADE' ,onUpdate: 'CASCADE' })
    groups:group[];

    
    @ManyToOne(type=>user, user=>user.organizations,{  nullable:false,onDelete: 'CASCADE',onUpdate: 'CASCADE' })
    @JoinColumn({ name:'fk_id_user'})
    user:user ;

}