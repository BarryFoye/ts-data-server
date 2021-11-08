import { getRepository } from 'typeorm';
import { Coin, Quote } from '../models';

export interface IMarketDataPayload {
	data: Coin;
}

export const getWeeklySnapshots = async (): Promise<Array<Coin>> => {
	const marketDataRepository = getRepository(Coin);
	return marketDataRepository.find();
};

// TODO: Test me!
// export const dataTree = async (): Promise<unknown> => {
// 	const quote = getRepository(Quote);
// 	const totalMarketCap = quote
// 		.createQueryBuilder('quote')
// 		.select(['SUM(quote.market_cap)'])
// 		.where('quote.currency = :currency', { currency: 'USD' })
// 		.andWhere('') // TODO: Add logic to select only the latest data
// 		.getRawOne();
// 	const coinMarketValue = quote
// 		.createQueryBuilder('quote')
// 		.leftJoinAndSelect(Coin, 'coin', 'coin.id = quote.coin_id')
// 		.select(['coin.name', 'quote.market_cap'])
// 		.where('quote.currency = :currency', { currency: 'USD' })
// 		.orderBy('quote.last_updated', 'DESC')
// 		.addOrderBy('quote.market_cap', 'DESC')
// 		.addOrderBy('coin.name', 'ASC')
// 		.limit(10)
// 		.getRawMany();

// 	return {
// 		name: 'Market Data',
// 		children: {
// 			name: 'Total Market Cap',
// 			value: totalMarketCap,
// 			children: coinMarketValue
// 		}
// 	};
// };
