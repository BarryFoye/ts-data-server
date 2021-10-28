import { ConnectionOptions } from 'typeorm';
import { Coin, Market, Platform, Tag, Quote, TagRef } from '../models'

const config: ConnectionOptions = {
	type: 'postgres',
	host: process.env.POSTGRES_HOST || '172.19.0.2',
	port: Number(process.env.POSTGRES_PORT) || 5432,
	username: process.env.POSTGRES_USER || 'nacho',
	password: process.env.POSTGRES_PASSWORD || 'nacho',
	database: process.env.POSTGRES_DB || 'cmc_data',
	entities: [Coin, Market, Platform, Tag, Quote, TagRef],
	synchronize: false
};

export default config;
