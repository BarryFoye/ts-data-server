import {
  Column,
  Entity,
  Index,
  JoinColumn,
  ManyToOne,
  OneToMany,
  PrimaryGeneratedColumn,
} from "typeorm";
import { Market } from "./Market";
import { Coin } from "./Coin";

@Index("ix_platform_coin_id", ["coinId"], {})
@Index("ix_platform_id", ["id"], {})
@Index("platform_pkey", ["id"], { unique: true })
@Entity("platform", { schema: "public" })
export class Platform {
  @PrimaryGeneratedColumn({ type: "integer", name: "id" })
  id!: number;

  @Column("integer", { name: "coin_id" })
  coinId!: number;

  @Column("bytea", { name: "token_address", nullable: true })
  tokenAddress!: Buffer | null;

  @OneToMany(() => Market, (market) => market.platform)
  markets!: Market[];

  @ManyToOne(() => Coin, (coin) => coin.platforms)
  @JoinColumn([{ name: "coin_id", referencedColumnName: "id" }])
  coin!: Coin;
}
