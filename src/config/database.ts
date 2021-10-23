import { ConnectionOptions } from 'typeorm';
import { Coin, Platform, CoinTag, Quote, Tag } from '../models';

const config: ConnectionOptions = {
	type: 'postgres',
	host: process.env.POSTGRES_HOST || 'localhost',
	port: Number(process.env.POSTGRES_PORT) || 5432,
	username: process.env.POSTGRES_USER || 'nacho',
	password: process.env.POSTGRES_PASSWORD || 'nacho',
	database: process.env.POSTGRES_DB || 'cmc_data',
	entities: [Coin, Platform, CoinTag, Quote, Tag],
	synchronize: false
};

export default config;
