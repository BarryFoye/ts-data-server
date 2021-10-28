import { Column, Entity, Index, OneToMany } from "typeorm";
import { Market } from "./Market";
import { Platform } from "./Platform";

@Index("ix_coin_id", ["id"], {})
@Index("coin_pkey", ["id"], { unique: true })
@Index("coin_slug_key", ["slug"], { unique: true })
@Entity("coin", { schema: "public" })
export class Coin {
  @Column("integer", { primary: true, name: "id" })
  id!: number;

  @Column("character varying", { name: "name" })
  name!: string;

  @Column("character varying", { name: "symbol" })
  symbol!: string;

  @Column("character varying", { name: "slug", unique: true })
  slug!: string;

  @OneToMany(() => Market, (market) => market.coin)
  markets!: Market[];

  @OneToMany(() => Platform, (platform) => platform.coin)
  platforms!: Platform[];
}
