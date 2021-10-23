import { Column, Entity, Index, OneToMany, PrimaryGeneratedColumn } from 'typeorm';
import { Coin } from './Coin';

@Index('platform_pk', ['platformId'], { unique: true })
@Entity('platform', { schema: 'public' })
export class Platform {
	@PrimaryGeneratedColumn({ type: 'integer', name: 'platform_id' })
	platformId!: number;

	@Column('integer', { name: 'id' })
	id!: number;

	@Column('character varying', { name: 'name', length: 255 })
	name!: string;

	@Column('character varying', { name: 'symbol', length: 255 })
	symbol!: string;

	@Column('character varying', { name: 'slug', length: 255 })
	slug!: string;

	@Column('text', { name: 'token_address' })
	tokenAddress!: string;

	@OneToMany(() => Coin, (coin) => coin.platform)
	coins!: Coin[];
}
