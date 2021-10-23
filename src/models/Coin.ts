import { Column, Entity, Index, JoinColumn, ManyToOne, OneToMany, PrimaryGeneratedColumn } from 'typeorm';
import { Platform } from './Platform';
import { CoinTag } from './CoinTag';
import { Quote } from './Quote';

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

	@Column('integer', { name: 'max_supply' })
	maxSupply!: number;

	@Column('numeric', { name: 'circulating_supply' })
	circulatingSupply!: string;

	@Column('numeric', { name: 'total_supply' })
	totalSupply!: string;

	@Column('integer', { name: 'cmc_rank' })
	cmcRank!: number;

	@Column('date', { name: 'last_updated' })
	lastUpdated!: string;

	@ManyToOne(() => Platform, (platform) => platform.coins)
	@JoinColumn([{ name: 'platform_id', referencedColumnName: 'platformId' }])
	platform!: Platform;

	@OneToMany(() => CoinTag, (coinTag) => coinTag.coin)
	coinTags!: CoinTag[];

	@OneToMany(() => Quote, (quote) => quote.coin)
	quotes!: Quote[];
}
