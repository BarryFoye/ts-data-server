import { Get, Route, Tags } from 'tsoa';
import { getWeeklySnapshots } from '../repositories/market_data';
import { Coin } from '../models';

@Route('market_data')
@Tags('MarketData')
export default class MarketDataController {
	@Get('/')
	public async getWeeklySnapshots(): Promise<Array<Coin>> {
		return getWeeklySnapshots();
	}
}
