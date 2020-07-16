import { Entity, Column, PrimaryGeneratedColumn, Unique, CreateDateColumn, ManyToOne, JoinColumn, Index } from 'typeorm';
import {user} from "./user";
import {rol} from "./rol";



@Entity()
@Index("fk_rol_user1_idx",["rol",])
@Index("fk_user_rol1_idx",["user",])

export class user_has_rol {

    @PrimaryGeneratedColumn()
    id: number;

    // @CreateDateColumn({ type: "timestamp", name: "created_at" })
    // createdAt: Date;
    


    @ManyToOne(type=>rol, rol=>rol.user_has_rols,{  nullable:false,onDelete: 'CASCADE',onUpdate: 'CASCADE' })
    @JoinColumn({ name:'fk_id_rol'})
    rol:rol;


    @ManyToOne(type=>user, user=>user.user_has_rols,{  nullable:false,onDelete: 'CASCADE',onUpdate: 'CASCADE' })
    @JoinColumn({ name:'fk_id_user'})
    user:user ;
}