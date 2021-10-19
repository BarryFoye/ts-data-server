import { Entity, PrimaryGeneratedColumn, Column, ManyToOne } from 'typeorm';
import { Platform } from './platform';

@Entity('coin')
export class Coin {
	@PrimaryGeneratedColumn('increment')
	coin_id!: number;

	@Column()
	id!: number;

	@Column()
	name!: string;

	@Column()
	symbol!: string;

	@Column()
	slug!: string;

	@Column()
	num_market_pairs!: number;

	@Column({ type: 'timestamp' })
	date_added!: Date;

	@Column()
	max_supply!: number;

	@Column()
	circulating_supply!: number;

	@Column()
	total_supply!: number;

	@ManyToOne(() => Platform, (platform: Platform) => platform.platform_id)
	platform!: number;

	@Column()
	cmc_rank!: number;

	@Column({ type: 'timestamp' })
	last_updated!: Date;

	@Column()
	rank!: number;
}
