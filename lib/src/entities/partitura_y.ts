import { Entity, Column, PrimaryGeneratedColumn, Unique, CreateDateColumn, OneToMany, JoinColumn, ManyToOne, Index } from 'typeorm';
import {partitura_symbol} from "./partitura_symbol";
import {partitura_x} from "./partitura_x";
import {partitura} from "./partitura";



@Entity()
// @Index("fk_partitura_y_symbol_idx",["partitura_symbol",])
// @Index("fk_partitura_y3_idx",["partitura_symbol1",])
// @Index("fk_partitura_y2_idx",["partitura_symbol2",])
// @Index("fk_partitura_y1_idx",["partitura_symbol3",])
@Index("fk_partitura_partituras_idx",["partitura",])

export class partitura_y {

    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    y1: number;

    @Column()
    y2: number;

    @Column()
    y3: number;

    // @ManyToOne(type=>partitura_symbol, partitura_symbol=>partitura_symbol.partitura_y3s,{  nullable:false,onDelete: 'CASCADE',onUpdate: 'CASCADE' })
    // @JoinColumn({ name:'fk_partitura_y1'})
    // partitura_symbol1:partitura_symbol ;

   

    // @ManyToOne(type=>partitura_symbol, partitura_symbol=>partitura_symbol.partitura_y2s,{  nullable:false,onDelete: 'CASCADE',onUpdate: 'CASCADE' })
    // @JoinColumn({ name:'fk_partitura_y2'})
    // partitura_symbol2:partitura_symbol ;

    

    // @ManyToOne(type=>partitura_symbol, partitura_symbol=>partitura_symbol.partitura_y3s,{  nullable:false,onDelete: 'CASCADE',onUpdate: 'CASCADE' })
    // @JoinColumn({ name:'fk_partitura_y3'})
    // partitura_symbol3:partitura_symbol ;

    @OneToMany(type=>partitura_x, partitura_x=>partitura_x.partitura_y,{ onDelete: 'CASCADE' ,onUpdate: 'CASCADE' })
    partitura_xs:partitura_x[];

    // @OneToMany(type=>partitura, partitura=>partitura.partitura_y,{ onDelete: 'CASCADE' ,onUpdate: 'CASCADE' })
    // partituras:partitura[];

    @ManyToOne(type=>partitura, partitura=>partitura.partitura_ys,{  nullable:false,onDelete: 'CASCADE',onUpdate: 'CASCADE' })
    @JoinColumn({ name:'fk_id_partitura'})
    partitura:partitura ;
    // @ManyToOne(type=>partitura_symbol, partitura_symbol=>partitura_symbol.partitura_y3s,{  nullable:false,onDelete: 'CASCADE',onUpdate: 'CASCADE' })
    // @JoinColumn({ name:'fk_partitura_y3'})
    // partitura_symbol3:partitura_symbol ;

    // @ManyToOne(type=>partitura_symbol, partitura_symbol=>partitura_symbol.partitura_ys,{  nullable:false,onDelete: 'CASCADE',onUpdate: 'CASCADE' })
    // @JoinColumn({ name:'fk_id_partitura_symbol'})
    // partitura_symbol:partitura_symbol ;

   


   

    
}