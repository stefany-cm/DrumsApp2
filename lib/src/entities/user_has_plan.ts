import { Entity, Column, PrimaryGeneratedColumn, Unique, CreateDateColumn, ManyToOne, JoinColumn, Index } from 'typeorm';
import {user} from "./user";
import {plan} from "./plan";


@Entity()
@Index("fk_plan_user1_idx",["plan",])
@Index("fk_user_plan1_idx",["user",])
export class user_has_plan {

    @Column()
    key: number;

    @PrimaryGeneratedColumn()
    id:number;

    @Column()
    date_end: Date;


    // @CreateDateColumn({ type: "timestamp", name: "created_at" })
    // createdAt: Date;
    
    
    @ManyToOne(type=>user, user=>user.user_has_plans,{  nullable:false,onDelete: 'CASCADE',onUpdate: 'CASCADE' })
    @JoinColumn({ name:'fk_id_user'})
    user:user ;

    
    @ManyToOne(type=>plan, plan=>plan.user_has_plans,{  nullable:false,onDelete: 'CASCADE',onUpdate: 'CASCADE' })
    @JoinColumn({ name:'fk_id_plan'})
    plan:plan ;
}