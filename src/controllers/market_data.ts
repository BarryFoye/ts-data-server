import { Get, Route, Tags } from 'tsoa';
import { getWeeklySnapshots, dataTree } from '../repositories/market_data';
import { Coin } from '../models';

@Route('market_data')
@Tags('MarketData')
export default class MarketDataController {
	//@Get('/')
	public async getWeeklySnapshots(): Promise<Array<Coin>> {
		return getWeeklySnapshots();
	}
	//@Get('/')
	public async dataTree(): Promise<unknown> {
		return dataTree();
	}
}
