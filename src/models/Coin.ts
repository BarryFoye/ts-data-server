import { Column, Entity, Index, OneToMany } from 'typeorm';
import { MarketStats } from './MarketStats';
import { Quote } from './Quote';
import { Tag } from './Tag';

@Index('coin_pkey', ['id'], { unique: true })
@Index('coin_slug_key', ['slug'], { unique: true })
@Entity('coin', { schema: 'public' })
export class Coin {
	@Column('integer', { primary: true, name: 'id' })
	id!: number;

	@Column('character varying', { name: 'name' })
	name!: string;

	@Column('character varying', { name: 'symbol', length: 25 })
	symbol!: string;

	@Column('character varying', { name: 'slug', unique: true, length: 50 })
	slug!: string;

	@Column('bigint', { name: 'max_supply', nullable: true })
	maxSupply!: string | null;

	@Column('timestamp without time zone', { name: 'date_added', nullable: true })
	dateAdded!: Date | null;

	@OneToMany(() => MarketStats, (marketStats) => marketStats.coin)
	marketStats!: MarketStats[];

	@OneToMany(() => Quote, (quote) => quote.coin)
	quotes!: Quote[];

	@OneToMany(() => Tag, (tag) => tag.coin)
	tags!: Tag[];
}
