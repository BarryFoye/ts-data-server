import {
  Column,
  Entity,
  Index,
  JoinColumn,
  ManyToMany,
  ManyToOne,
  PrimaryGeneratedColumn,
} from "typeorm";
import { Market } from "./Market";
import { TagRef } from "./TagRef";

@Index("ix_tag_id", ["id"], {})
@Index("tag_pkey", ["id"], { unique: true })
@Index("ix_tag_tag_id", ["tagId"], {})
@Entity("tag", { schema: "public" })
export class Tag {
  @PrimaryGeneratedColumn({ type: "integer", name: "id" })
  id!: number;

  @Column("integer", { name: "tag_id" })
  tagId!: number;

  @ManyToMany(() => Market, (market) => market.tags)
  markets!: Market[];

  @ManyToOne(() => TagRef, (tagRef) => tagRef.tags)
  @JoinColumn([{ name: "tag_id", referencedColumnName: "id" }])
  tag!: TagRef;
}
