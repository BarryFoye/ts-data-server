import express from 'express';
import MarketDataController from '../controllers/market_data';
const router = express.Router();

// router.get('/market_data', controller.getWeeklySnapshots);

router.get('/', async (req, res) => {
	const controller = new MarketDataController();
	const response = await controller.getWeeklySnapshots();
	return res.send(response);
});

export default router;
