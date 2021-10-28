import {
  Column,
  Entity,
  Index,
  JoinColumn,
  ManyToOne,
  PrimaryGeneratedColumn,
} from "typeorm";
import { Market } from "./Market";

@Index("quote_pkey", ["id"], { unique: true })
@Index("ix_quote_id", ["id"], {})
@Index("ix_quote_market_id", ["marketId"], {})
@Entity("quote", { schema: "public" })
export class Quote {
  @PrimaryGeneratedColumn({ type: "integer", name: "id" })
  id!: number;

  @Column("integer", { name: "market_id", nullable: true })
  marketId!: number | null;

  @Column("character varying", { name: "currency", nullable: true })
  currency!: string | null;

  @Column("double precision", { name: "price", precision: 53 })
  price!: number;

  @Column("double precision", { name: "vol_24", nullable: true, precision: 53 })
  vol_24!: number | null;

  @Column("double precision", {
    name: "pct_change_1h",
    nullable: true,
    precision: 53,
  })
  pctChange_1h!: number | null;

  @Column("double precision", {
    name: "pct_change_24h",
    nullable: true,
    precision: 53,
  })
  pctChange_24h!: number | null;

  @Column("double precision", {
    name: "pct_change_7d",
    nullable: true,
    precision: 53,
  })
  pctChange_7d!: number | null;

  @Column("double precision", {
    name: "market_cap",
    nullable: true,
    precision: 53,
  })
  marketCap!: number | null;

  @Column("double precision", {
    name: "fully_diluted_mc",
    nullable: true,
    precision: 53,
  })
  fullyDilutedMc!: number | null;

  @Column("timestamp without time zone", { name: "last_updated" })
  lastUpdated!: Date;

  @ManyToOne(() => Market, (market) => market.quotes)
  @JoinColumn([{ name: "market_id", referencedColumnName: "id" }])
  market!: Market;
}
