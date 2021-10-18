import { Get, Route, Tags } from 'tsoa';
import { getWeeklySnapshots } from '../repositories/market_data';
import { MarketData } from '../@types/app';

@Route('market_data')
@Tags('MarketData')
export default class MarketDataController {
	@Get('/')
	public async getWeeklySnapshots(): Promise<Array<MarketData>> {
		return getWeeklySnapshots();
	}
}
