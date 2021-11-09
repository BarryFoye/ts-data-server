import { getRepository } from 'typeorm';
import { Coin } from '../models';

export interface IMarketDataPayload {
	data: Coin;
}

export const getWeeklySnapshots = async (): Promise<Array<Coin>> => {
	const marketDataRepository = getRepository(Coin);
	return marketDataRepository.find();
};

