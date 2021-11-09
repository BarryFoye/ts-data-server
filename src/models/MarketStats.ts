import { Column, Entity, Index, JoinColumn, ManyToOne, PrimaryGeneratedColumn } from 'typeorm';
import { Coin } from './Coin';

@Index('ix_market_stats_coin_id', ['coinId'], {})
@Index('market_stats_pkey', ['id'], { unique: true })
@Entity('market_stats', { schema: 'public' })
export class MarketStats {
	@PrimaryGeneratedColumn({ type: 'integer', name: 'id' })
	id!: number;

	@Column('integer', { name: 'coin_id' })
	coinId!: number;

	@Column('integer', { name: 'num_market_pairs', nullable: true })
	numMarketPairs!: number | null;

	@Column('double precision', {
		name: 'circulating_supply',
		nullable: true,
		precision: 53
	})
	circulatingSupply!: number | null;

	@Column('double precision', {
		name: 'total_supply',
		nullable: true,
		precision: 53
	})
	totalSupply!: number | null;

	@Column('integer', { name: 'cmc_rank', nullable: true })
	cmcRank!: number | null;

	@Column('timestamp without time zone', {
		name: 'last_updated',
		nullable: true
	})
	lastUpdated!: Date | null;

	@ManyToOne(() => Coin, (coin) => coin.marketStats)
	@JoinColumn([{ name: 'coin_id', referencedColumnName: 'id' }])
	coin!: Coin;
}
