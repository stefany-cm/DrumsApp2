import { Entity, Column, PrimaryGeneratedColumn, Unique, CreateDateColumn, OneToMany } from 'typeorm';
import {rol_has_menu} from "./rol_has_menu";
import {user_has_rol} from "./user_has_rol";


@Entity()
export class rol {

    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    name: string;

    

    @OneToMany(type=>rol_has_menu, rol_has_menu=>rol_has_menu.rol,{ onDelete: 'CASCADE' ,onUpdate: 'CASCADE' })
    rol_has_menus:rol_has_menu[];

    @OneToMany(type=>user_has_rol, user_has_rol=>user_has_rol.rol,{ onDelete: 'CASCADE' ,onUpdate: 'CASCADE' })
    user_has_rols:user_has_rol[];

   
}