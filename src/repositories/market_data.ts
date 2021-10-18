import { getRepository } from 'typeorm';
import { MarketData } from '../@types/app';
import { Coin } from '../models';

export interface IMarketDataPayload {
	data: MarketData;
}

export const getWeeklySnapshots = async (): Promise<Array<MarketData>> => {
	const marketDataRepository = getRepository(Coin);
	return marketDataRepository.find();
};
