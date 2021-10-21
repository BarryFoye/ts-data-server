import { Column, Entity, Index, JoinColumn, ManyToOne, PrimaryGeneratedColumn } from 'typeorm';
import { Coin } from './Coin';

@Index('quotes_pk', ['quotesId'], { unique: true })
@Entity('quotes', { schema: 'public' })
export class Quotes {
	@PrimaryGeneratedColumn({ type: 'integer', name: 'quotes_id' })
	quotesId!: number;

	@Column('character varying', { name: 'currency', length: 255 })
	currency!: string;

	@Column('numeric', { name: 'price' })
	price!: string;

	@Column('numeric', { name: 'vol_24' })
	vol_24!: string;

	@Column('numeric', { name: 'pct_change_1h' })
	pctChange_1h!: string;

	@Column('numeric', { name: 'pct_change_24h' })
	pctChange_24h!: string;

	@Column('numeric', { name: 'pct_change_7d' })
	pctChange_7d!: string;

	@Column('numeric', { name: 'market_cap' })
	marketCap!: string;

	@Column('numeric', { name: 'fully_diluted_mc', nullable: true })
	fullyDilutedMc!: string | null;

	@Column('date', { name: 'last_updated' })
	lastUpdated!: string;

	@ManyToOne(() => Coin, (coin) => coin.quotes)
	@JoinColumn([{ name: 'coin_id', referencedColumnName: 'coinId' }])
	coin!: Coin;
}
