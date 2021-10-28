import {
  Column,
  Entity,
  Index,
  JoinColumn,
  JoinTable,
  ManyToMany,
  ManyToOne,
  OneToMany,
  PrimaryGeneratedColumn,
} from "typeorm";
import { Tag } from "./Tag";
import { Coin } from "./Coin";
import { Platform } from "./Platform";
import { Quote } from "./Quote";

@Index("ix_market_coin_id", ["coinId"], {})
@Index("market_pkey", ["id"], { unique: true })
@Index("ix_market_id", ["id"], {})
@Index("ix_market_platform_id", ["platformId"], {})
@Entity("market", { schema: "public" })
export class Market {
  @PrimaryGeneratedColumn({ type: "integer", name: "id" })
  id!: number;

  @Column("integer", { name: "coin_id" })
  coinId!: number;

  @Column("integer", { name: "platform_id", nullable: true })
  platformId!: number | null;

  @Column("integer", { name: "num_market_pairs", nullable: true })
  numMarketPairs!: number | null;

  @Column("timestamp without time zone", { name: "date_added" })
  dateAdded!: Date;

  @Column("bigint", { name: "max_supply", nullable: true })
  maxSupply!: string | null;

  @Column("double precision", {
    name: "circulating_supply",
    nullable: true,
    precision: 53,
  })
  circulatingSupply!: number | null;

  @Column("double precision", {
    name: "total_supply",
    nullable: true,
    precision: 53,
  })
  totalSupply!: number | null;

  @Column("integer", { name: "cmc_rank", nullable: true })
  cmcRank!: number | null;

  @Column("timestamp without time zone", {
    name: "last_updated",
    nullable: true,
  })
  lastUpdated!: Date | null;

  @ManyToMany(() => Tag, (tag) => tag.markets)
  @JoinTable({
    name: "coin_tag",
    joinColumns: [{ name: "market_id", referencedColumnName: "id" }],
    inverseJoinColumns: [{ name: "tag_id", referencedColumnName: "id" }],
    schema: "public",
  })
  tags!: Tag[];

  @ManyToOne(() => Coin, (coin) => coin.markets)
  @JoinColumn([{ name: "coin_id", referencedColumnName: "id" }])
  coin!: Coin;

  @ManyToOne(() => Platform, (platform) => platform.markets)
  @JoinColumn([{ name: "platform_id", referencedColumnName: "id" }])
  platform!: Platform;

  @OneToMany(() => Quote, (quote) => quote.market)
  quotes!: Quote[];
}
