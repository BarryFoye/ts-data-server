CREATE TABLE "coin" (
	"coin_id" serial NOT NULL,
	"platform_id" integer NOT NULL,
	"id" integer NOT NULL,
	"name" varchar(255) NOT NULL,
	"symbol" varchar(255) NOT NULL,
	"slug" varchar(255) NOT NULL,
	"num_market_pairs" integer,
	"date_added" DATE NOT NULL,
	"max_supply" integer NOT NULL,
	"circulating_supply" DECIMAL NOT NULL,
	"total_supply" DECIMAL NOT NULL,
	"cmc_rank" integer NOT NULL,
	"last_updated" DATE NOT NULL,
	CONSTRAINT "coin_pk" PRIMARY KEY ("coin_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "platform" (
	"platform_id" serial NOT NULL,
	"id" integer NOT NULL,
	"name" varchar(255) NOT NULL,
	"symbol" varchar(255) NOT NULL,
	"slug" varchar(255) NOT NULL,
	"token_address" TEXT NOT NULL,
	CONSTRAINT "platform_pk" PRIMARY KEY ("platform_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "tag" (
	"tag_id" serial NOT NULL,
	"tag" varchar(255) NOT NULL,
	CONSTRAINT "tag_pk" PRIMARY KEY ("tag_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "coin_tag" (
	"coin_tag_id" serial NOT NULL,
	"coin_id" integer NOT NULL,
	"tag_id" integer NOT NULL,
	CONSTRAINT "coin_tag_pk" PRIMARY KEY ("coin_tag_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "quote" (
	"quote_id" serial NOT NULL,
	"coin_id" integer NOT NULL,
	"currency" varchar(255) NOT NULL,
	"price" DECIMAL NOT NULL,
	"vol_24" DECIMAL NOT NULL,
	"pct_change_1h" DECIMAL NOT NULL,
	"pct_change_24h" DECIMAL NOT NULL,
	"pct_change_7d" DECIMAL NOT NULL,
	"market_cap" DECIMAL NOT NULL,
	"fully_diluted_mc" DECIMAL NOT NULL,
	"last_updated" DATE NOT NULL,
	CONSTRAINT "quote_pk" PRIMARY KEY ("quote_id")
) WITH (
  OIDS=FALSE
);



ALTER TABLE "coin" ADD CONSTRAINT "coin_fk0" FOREIGN KEY ("platform_id") REFERENCES "platform"("platform_id");



ALTER TABLE "coin_tag" ADD CONSTRAINT "coin_tag_fk0" FOREIGN KEY ("coin_id") REFERENCES "coin"("coin_id");
ALTER TABLE "coin_tag" ADD CONSTRAINT "coin_tag_fk1" FOREIGN KEY ("tag_id") REFERENCES "tag"("tag_id");

ALTER TABLE "quote" ADD CONSTRAINT "quote_fk0" FOREIGN KEY ("coin_id") REFERENCES "coin"("coin_id");






