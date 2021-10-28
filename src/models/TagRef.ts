import {
  Column,
  Entity,
  Index,
  OneToMany,
  PrimaryGeneratedColumn,
} from "typeorm";
import { Tag } from "./Tag";

@Index("tag_ref_pkey", ["id"], { unique: true })
@Index("ix_tag_ref_id", ["id"], {})
@Index("tag_ref_name_key", ["name"], { unique: true })
@Entity("tag_ref", { schema: "public" })
export class TagRef {
  @PrimaryGeneratedColumn({ type: "integer", name: "id" })
  id!: number;

  @Column("character varying", { name: "name", unique: true })
  name!: string;

  @OneToMany(() => Tag, (tag) => tag.tag)
  tags!: Tag[];
}
