import { Entity, Column, PrimaryGeneratedColumn, Unique, CreateDateColumn, Index, ManyToOne, JoinColumn } from 'typeorm';
import {menu} from "./menu";

import {rol} from "./rol";


@Entity()
@Index("fk_menu_rol1_idx",["menu",])
@Index("fk_rol_menu1_idx",["rol",])
export class rol_has_menu {

    @PrimaryGeneratedColumn()
    id: number;

    

   
    
    // @CreateDateColumn({ type: "timestamp", name: "created_at" })
    // createdAt: Date;
    

    @ManyToOne(type=>menu, menu=>menu.rol_has_menus,{  nullable:false,onDelete: 'CASCADE',onUpdate: 'CASCADE' })
    @JoinColumn({ name:'fk_id_menu'})
    menu:menu ;

    @ManyToOne(type=>rol, rol=>rol.rol_has_menus,{  nullable:false,onDelete: 'CASCADE',onUpdate: 'CASCADE' })
    @JoinColumn({ name:'fk_id_rol'})
    rol:rol ;
    

}