import { ConnectionOptions } from 'typeorm';
import { Coin, Platform } from '../models';

const config: ConnectionOptions = {
	type: 'postgres',
	host: process.env.POSTGRES_HOST || 'localhost',
	port: Number(process.env.POSTGRES_PORT) || 5432,
	username: process.env.POSTGRES_USER || 'root',
	password: process.env.POSTGRES_PASSWORD || 'root',
	database: process.env.POSTGRES_DB || 'cmc_data',
	entities: [Coin, Platform],
	synchronize: true
};

export default config;