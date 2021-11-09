import { ConnectionOptions } from 'typeorm';
import { Coin, MarketStats, Platform, Tag, Quote, TagRef } from '../models';

const config: ConnectionOptions = {
	type: 'postgres',
	host: process.env.DB_HOST || 'db',
	port: Number(process.env.DB_PORT) || 5432,
	username: process.env.DB_USER || 'nacho',
	password: process.env.DB_PASSWORD || 'nacho',
	database: process.env.DB_NAME || 'cmc_data',
	entities: [Coin, MarketStats, Platform, Tag, Quote, TagRef],
	synchronize: false
};

export default config;
