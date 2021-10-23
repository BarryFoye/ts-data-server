import { Entity, Index, JoinColumn, ManyToOne, PrimaryGeneratedColumn } from 'typeorm';
import { Coin } from './Coin';
import { Tag } from './Tag';

@Index('coin_tag_pk', ['coinTagId'], { unique: true })
@Entity('coin_tag', { schema: 'public' })
export class CoinTag {
	@PrimaryGeneratedColumn({ type: 'integer', name: 'coin_tag_id' })
	coinTagId!: number;

	@ManyToOne(() => Coin, (coin) => coin.coinTags)
	@JoinColumn([{ name: 'coin_id', referencedColumnName: 'coinId' }])
	coin!: Coin;

	@ManyToOne(() => Tag, (tag) => tag.coinTags)
	@JoinColumn([{ name: 'tag_id', referencedColumnName: 'tagId' }])
	tag!: Tag;
}
