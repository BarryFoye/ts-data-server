import { Column, Entity, Index } from 'typeorm';

@Index('platform_pkey', ['id'], { unique: true })
@Index('ix_platform_platform_id', ['platformId'], {})
@Index('platform_token_address_key', ['tokenAddress'], { unique: true })
@Entity('platform', { schema: 'public' })
export class Platform {
	@Column('integer', { primary: true, name: 'id' })
	id!: number;

	@Column('integer', { name: 'platform_id' })
	platformId!: number;

	@Column('bytea', { name: 'token_address', nullable: true, unique: true })
	tokenAddress!: Buffer | null;
}
