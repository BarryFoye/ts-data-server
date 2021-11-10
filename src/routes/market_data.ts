import express from 'express';
import MarketDataController from '../controllers/market_data';
const router = express.Router();

router.get('/coin', async (req, res) => {
	const controller = new MarketDataController();
	const response = await controller.getWeeklySnapshots();
	return res.send(response);
});

router.get('/tree_map', async (req, res) => {
	const controller = new MarketDataController();
	const response = await controller.dataTree();
	return res.send(response);
});

export default router;
