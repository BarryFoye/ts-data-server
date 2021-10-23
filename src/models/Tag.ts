import { Column, Entity, Index, OneToMany, PrimaryGeneratedColumn } from 'typeorm';
import { CoinTag } from './CoinTag';

@Index('tag_pk', ['tagId'], { unique: true })
@Entity('tag', { schema: 'public' })
export class Tag {
	@PrimaryGeneratedColumn({ type: 'integer', name: 'tag_id' })
	tagId!: number;

	@Column('character varying', { name: 'tag', length: 255 })
	tag!: string;

	@OneToMany(() => CoinTag, (coinTag) => coinTag.tag)
	coinTags!: CoinTag[];
}
