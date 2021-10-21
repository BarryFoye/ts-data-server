import { Column, Entity, Index, OneToMany, PrimaryGeneratedColumn } from 'typeorm';
import { CoinTags } from './CoinTags';

@Index('tags_pk', ['tagId'], { unique: true })
@Entity('tags', { schema: 'public' })
export class Tags {
	@PrimaryGeneratedColumn({ type: 'integer', name: 'tag_id' })
	tagId!: number;

	@Column('character varying', { name: 'tag', length: 255 })
	tag!: string;

	@OneToMany(() => CoinTags, (coinTags) => coinTags.tag)
	coinTags!: CoinTags[];
}
