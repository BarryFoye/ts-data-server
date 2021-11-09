import { Column, Entity, Index, JoinColumn, ManyToOne, PrimaryGeneratedColumn } from 'typeorm';
import { Coin } from './Coin';

@Index('ix_quote_coin_id', ['coinId'], {})
@Index('quote_pkey', ['id'], { unique: true })
@Entity('quote', { schema: 'public' })
export class Quote {
	@PrimaryGeneratedColumn({ type: 'integer', name: 'id' })
	id!: number;

	@Column('integer', { name: 'coin_id' })
	coinId!: number;

	@Column('character varying', { name: 'currency', length: 10 })
	currency!: string;

	@Column('double precision', { name: 'price', precision: 53 })
	price!: number;

	@Column('double precision', { name: 'vol_24', nullable: true, precision: 53 })
	vol_24!: number | null;

	@Column('double precision', {
		name: 'pct_change_1h',
		nullable: true,
		precision: 53
	})
	pctChange_1h!: number | null;

	@Column('double precision', {
		name: 'pct_change_24h',
		nullable: true,
		precision: 53
	})
	pctChange_24h!: number | null;

	@Column('double precision', {
		name: 'pct_change_7d',
		nullable: true,
		precision: 53
	})
	pctChange_7d!: number | null;

	@Column('double precision', {
		name: 'market_cap',
		nullable: true,
		precision: 53
	})
	marketCap!: number | null;

	@Column('double precision', {
		name: 'fully_diluted_mc',
		nullable: true,
		precision: 53
	})
	fullyDilutedMc!: number | null;

	@Column('timestamp without time zone', { name: 'last_updated' })
	lastUpdated!: Date;

	@ManyToOne(() => Coin, (coin) => coin.quotes)
	@JoinColumn([{ name: 'coin_id', referencedColumnName: 'id' }])
	coin!: Coin;
}
