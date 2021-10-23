import { Request, Response, NextFunction } from 'express';
import { MarketData } from '../@types/app';

interface Test {
	id: Number;
}

interface MktData {
	data: MarketData;
	// coin_id: number;

	// id: number;

	// name: string;

	// symbol: string;

	// slug: string;

	// num_market_pairs: number;

	// date_added: string;

	// max_supply: number;

	// circulating_supply: number;

	// total_supply: number;

	// platform: Platform;

	// cmc_rank: number;

	// last_updated: string;

	// rank: number;
}

const getWeeklySnapshots = (req: Request, res: Response, next: NextFunction) => {
	// interface with postgres
	const result1: MarketData = {
		coin_id: 0,
		id: 0,
		name: '',
		symbol: '',
		slug: '',
		num_market_pairs: 0,
		date_added: '',
		max_supply: 0,
		circulating_supply: 0,
		total_supply: 0,
		platform: {
			platform_id: 0,
			id: 0,
			name: '',
			symbol: '',
			slug: '',
			token_address: ''
		},
		cmc_rank: 0,
		last_updated: '',
		rank: 0
	};
	const result2: MarketData = {
		coin_id: 0,
		id: 0,
		name: '',
		symbol: '',
		slug: '',
		num_market_pairs: 0,
		date_added: '',
		max_supply: 0,
		circulating_supply: 0,
		total_supply: 0,
		platform: {
			platform_id: 0,
			id: 0,
			name: '',
			symbol: '',
			slug: '',
			token_address: ''
		},
		cmc_rank: 0,
		last_updated: '',
		rank: 0
	};
	const result: MarketData[] = [result1, result2];

	return res.status(200).json({
		message: result
	});
};

export default { getWeeklySnapshots };
