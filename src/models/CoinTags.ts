import { Entity, Index, JoinColumn, ManyToOne, PrimaryGeneratedColumn } from 'typeorm';
import { Coin } from './Coin';
import { Tags } from './Tags';

@Index('coin_tags_pk', ['coinTagId'], { unique: true })
@Entity('coin_tags', { schema: 'public' })
export class CoinTags {
	@PrimaryGeneratedColumn({ type: 'integer', name: 'coin_tag_id' })
	coinTagId!: number;

	@ManyToOne(() => Coin, (coin) => coin.coinTags)
	@JoinColumn([{ name: 'coin_id', referencedColumnName: 'coinId' }])
	coin!: Coin;

	@ManyToOne(() => Tags, (tags) => tags.coinTags)
	@JoinColumn([{ name: 'tag_id', referencedColumnName: 'tagId' }])
	tag!: Tags;
}
