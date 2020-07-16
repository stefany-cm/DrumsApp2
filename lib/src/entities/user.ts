import { Entity, Column, PrimaryGeneratedColumn, Unique, CreateDateColumn, OneToMany, Index } from 'typeorm';
import { account_has_users } from "./account_has_users";
import { user_has_group } from "./user_has_group";
import { user_has_rol } from "./user_has_rol";
import { user_has_plan } from "./user_has_plan";
import { organization } from "./organization";
import { isNull } from 'util';





@Entity()
@Unique(['id','email'])
export class user {

    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    name: string;

    @Column()
    email: string;

    @Column()
    password: string;

    // @Column()
    // createdAt: Date;

    @Column( )
    dateN: Date;
    @Column()
    image: string;
    @Column()    
    genre: string;

    @Column()
    state: number;
    
    // @CreateDateColumn({ type: "timestamp", name: "created_at" })
    // createdAt: Date;

    @OneToMany(type=>account_has_users, account_has_users=>account_has_users.user,{ onDelete: 'CASCADE' ,onUpdate: 'CASCADE' })
    account_has_userss:account_has_users[];

    @OneToMany(type=>user_has_group, user_has_group=>user_has_group.user,{ onDelete: 'CASCADE' ,onUpdate: 'CASCADE' })
    user_has_groups:user_has_group[];

    @OneToMany(type=>user_has_rol, user_has_rol=>user_has_rol.user,{ onDelete: 'CASCADE' ,onUpdate: 'CASCADE' })
    user_has_rols:user_has_rol[];

    @OneToMany(type=>user_has_plan, user_has_plan=>user_has_plan.user,{ onDelete: 'CASCADE' ,onUpdate: 'CASCADE' })
    user_has_plans:user_has_plan[];

    @OneToMany(type=>organization, organization=>organization.user,{ onDelete: 'CASCADE' ,onUpdate: 'CASCADE' })
    organizations:organization[];

}