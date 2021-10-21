import { Column, Entity, Index, JoinColumn, ManyToOne, OneToMany, PrimaryGeneratedColumn } from 'typeorm';
import { Platform } from './Platform';
import { CoinTags } from './CoinTags';
import { Quotes } from './Quotes';

@Index('coin_pk', ['coinId'], { unique: true })
@Entity('coin', { schema: 'public' })
export class Coin {
	@PrimaryGeneratedColumn({ type: 'integer', name: 'coin_id' })
	coinId!: number;

	@Column('integer', { name: 'id' })
	id!: number;

	@Column('character varying', { name: 'name', length: 255 })
	name!: string;

	@Column('character varying', { name: 'symbol', length: 255 })
	symbol!: string;

	@Column('character varying', { name: 'slug', length: 255 })
	slug!: string;

	@Column('integer', { name: 'num_market_pairs', nullable: true })
	numMarketPairs!: number | null;

	@Column('date', { name: 'date_added' })
	dateAdded!: string;

	@Column('integer', { name: 'max_supply', nullable: true })
	maxSupply!: number | null;

	@Column('integer', { name: 'circulating_supply' })
	circulatingSupply!: number;

	@Column('integer', { name: 'total_supply' })
	totalSupply!: number;

	@Column('integer', { name: 'cmc_rank' })
	cmcRank!: number;

	@Column('date', { name: 'last_updated' })
	lastUpdated!: string;

	@Column('integer', { name: 'rank' })
	rank!: number;

	@ManyToOne(() => Platform, (platform) => platform.coins)
	@JoinColumn([{ name: 'platform', referencedColumnName: 'platformId' }])
	platform!: Platform;

	@OneToMany(() => CoinTags, (coinTags) => coinTags.coin)
	coinTags!: CoinTags[];

	@OneToMany(() => Quotes, (quotes) => quotes.coin)
	quotes!: Quotes[];
}
