import { Entity, Column, PrimaryGeneratedColumn, Unique, CreateDateColumn, OneToMany } from 'typeorm';
// import {partitura_y} from "./partitura_y";

@Entity()
export class partitura_sounds{

    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    sound: string;

    @Column()
    name: string;

    @Column()
    icon: string;

    

    // @OneToMany(type=>partitura_y, partitura_y=>partitura_y.partitura_symbol,{ onDelete: 'CASCADE' ,onUpdate: 'CASCADE' })
    // partitura_ys:partitura_y[];

    // @OneToMany(type=>partitura_y, partitura_y=>partitura_y.partitura_symbol1,{ onDelete: 'CASCADE' ,onUpdate: 'CASCADE' })
    // partitura_y1s:partitura_y[];

    // @OneToMany(type=>partitura_y, partitura_y=>partitura_y.partitura_symbol2,{ onDelete: 'CASCADE' ,onUpdate: 'CASCADE' })
    // partitura_y2s:partitura_y[];

    // @OneToMany(type=>partitura_y, partitura_y=>partitura_y.partitura_symbol3,{ onDelete: 'CASCADE' ,onUpdate: 'CASCADE' })
    // partitura_y3s:partitura_y[];
}