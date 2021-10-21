import { ConnectionOptions } from 'typeorm';
import { Coin, Platform, CoinTags, Quotes, Tags } from '../models';

const config: ConnectionOptions = {
	type: 'postgres',
	host: process.env.POSTGRES_HOST || 'localhost',
	port: Number(process.env.POSTGRES_PORT) || 5432,
	username: process.env.POSTGRES_USER || 'nacho',
	password: process.env.POSTGRES_PASSWORD || 'nacho',
	database: process.env.POSTGRES_DB || 'cmc_data',
	entities: [Coin, Platform, CoinTags, Quotes, Tags],
	synchronize: false
};

export default config;
