import { Entity, Column, PrimaryGeneratedColumn, Unique, CreateDateColumn, OneToMany } from 'typeorm';
import {rol_has_menu} from "./rol_has_menu";

@Entity()
export class menu {

    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    name: string;

 

    @OneToMany(type=>rol_has_menu, rol_has_menu=>rol_has_menu.menu,{ onDelete: 'CASCADE' ,onUpdate: 'CASCADE' })
    rol_has_menus:rol_has_menu[];

}