CREATE TABLE "public.coin" (
	"coin_id" serial NOT NULL,
	"id" integer NOT NULL,
	"name" varchar(255) NOT NULL,
	"symbol" varchar(255) NOT NULL,
	"slug" varchar(255) NOT NULL,
	"num_market_pairs" integer,
	"date_added" DATE NOT NULL,
	"max_supply" integer NOT NULL,
	"circulating_supply" integer NOT NULL,
	"total_supply" integer NOT NULL,
	"platform" integer NOT NULL,
	"cmc_rank" integer NOT NULL,
	"last_updated" DATE NOT NULL,
	"rank" integer NOT NULL,
	CONSTRAINT "coin_pk" PRIMARY KEY ("coin_id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "public.platform" (
	"platform_id" serial NOT NULL,
	"id" integer NOT NULL,
	"name" varchar(255) NOT NULL,
	"symbol" varchar(255) NOT NULL,
	"slug" varchar(255) NOT NULL,
	"token_address" varchar(255) NOT NULL,
	CONSTRAINT "platform_pk" PRIMARY KEY ("platform_id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "public.tags" (
	"tag_id" serial NOT NULL,
	"tag" varchar(255) NOT NULL,
	CONSTRAINT "tags_pk" PRIMARY KEY ("tag_id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "public.coin_tags" (
	"coin_tag_id" serial NOT NULL,
	"coin_id" integer NOT NULL,
	"tag_id" integer NOT NULL,
	CONSTRAINT "coin_tags_pk" PRIMARY KEY ("coin_tag_id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "public.quotes" (
	"quotes_id" serial NOT NULL,
	"currency" varchar(255) NOT NULL,
	"price" DECIMAL NOT NULL,
	"vol_24" DECIMAL NOT NULL,
	"pct_change_1h" DECIMAL NOT NULL,
	"pct_change_24h" DECIMAL NOT NULL,
	"pct_change_7d" DECIMAL NOT NULL,
	"market_cap" DECIMAL NOT NULL,
	"fully_diluted_mc" DECIMAL NOT NULL,
	"last_updated" DATE NOT NULL,
	"coin_id" integer NOT NULL,
	CONSTRAINT "quotes_pk" PRIMARY KEY ("quotes_id")
) WITH (
  OIDS=FALSE
);

ALTER TABLE "coin" ADD CONSTRAINT "coin_fk0" FOREIGN KEY ("platform") REFERENCES "platform"("platform_id");
ALTER TABLE "coin_tags" ADD CONSTRAINT "coin_tags_fk0" FOREIGN KEY ("coin_id") REFERENCES "coin"("coin_id");
ALTER TABLE "coin_tags" ADD CONSTRAINT "coin_tags_fk1" FOREIGN KEY ("tag_id") REFERENCES "tags"("tag_id");
ALTER TABLE "quotes" ADD CONSTRAINT "quotes_fk0" FOREIGN KEY ("coin_id") REFERENCES "coin"("coin_id");
