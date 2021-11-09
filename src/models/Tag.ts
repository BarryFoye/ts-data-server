import { Column, Entity, Index, JoinColumn, ManyToOne, PrimaryGeneratedColumn } from 'typeorm';
import { Coin } from './Coin';
import { TagRef } from './TagRef';

@Index('ix_tag_coin_id', ['coinId'], {})
@Index('tag_pkey', ['id'], { unique: true })
@Index('ix_tag_tag_id', ['tagId'], {})
@Entity('tag', { schema: 'public' })
export class Tag {
	@PrimaryGeneratedColumn({ type: 'integer', name: 'id' })
	id!: number;

	@Column('integer', { name: 'coin_id' })
	coinId!: number;

	@Column('integer', { name: 'tag_id' })
	tagId!: number;

	@ManyToOne(() => Coin, (coin) => coin.tags)
	@JoinColumn([{ name: 'coin_id', referencedColumnName: 'id' }])
	coin!: Coin;

	@ManyToOne(() => TagRef, (tagRef) => tagRef.tags)
	@JoinColumn([{ name: 'tag_id', referencedColumnName: 'id' }])
	tag!: TagRef;
}
