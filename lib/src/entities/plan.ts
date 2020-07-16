import { Entity, Column, PrimaryGeneratedColumn, Unique, CreateDateColumn, OneToMany, ManyToOne, JoinColumn, Index } from 'typeorm';
import {type_plan} from "./type_plan";
import {user_has_plan} from "./user_has_plan";


@Entity()
@Index("fk_plan_type_plan1_idx",["type_plan",])

export class plan {

    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    name: string;

    @Column()
    limit_user: number;

    
    @Column()
    limit_teacher: number;

    
    @Column()
    values: number;

    
    @Column()
    composition: number;
    // @OneToMany(type=>rol_has_menu, rol_has_menu=>rol_has_menu.fkmenu ,{ onDelete: 'CASCADE' ,onUpdate: 'CASCADE' })
    // fkmenu:rol_has_menu[];

    @OneToMany(type=>user_has_plan, user_has_plan=>user_has_plan.plan,{ onDelete: 'CASCADE' ,onUpdate: 'CASCADE' })
    user_has_plans:user_has_plan[];

    @ManyToOne(type=>type_plan, type_plan=>type_plan.plans,{  nullable:false,onDelete: 'CASCADE',onUpdate: 'CASCADE' })
    @JoinColumn({ name:'fk_id_type'})
    type_plan:type_plan ;
}