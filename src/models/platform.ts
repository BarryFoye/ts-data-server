import { Column, Entity, PrimaryGeneratedColumn } from 'typeorm';

@Entity('platform')
export class Platform {
	@PrimaryGeneratedColumn('increment')
	platform_id!: number;

	@Column()
	id!: number;

	@Column()
	name!: string;

	@Column()
	symbol!: string;

	@Column()
	slug!: string;

	@Column()
	token_address!: string;
}
