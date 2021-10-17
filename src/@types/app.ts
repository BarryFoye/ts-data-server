type Platform = {
	platform_id: number;

	id: number;

	name: string;

	symbol: string;

	slug: string;

	token_address: string;
};

type MarketData = {
	coin_id: number;

	id: number;

	name: string;

	symbol: string;

	slug: string;

	num_market_pairs: number;

	date_added: string;

	max_supply: number;

	circulating_supply: number;

	total_supply: number;

	platform: Platform;

	cmc_rank: number;

	last_updated: string;

	rank: number;
};

export { MarketData, Platform };
