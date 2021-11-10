import express from 'express';
import HeartBeatController from '../controllers/heart_beat';
import MarketDataRouter from './market_data';

const router = express.Router();

router.get('/v1/heartBeat', async (req, res) => {
	const controller = new HeartBeatController();
	const response = await controller.getMessage();
	return res.send(response);
});

router.use('/v1/market_data', MarketDataRouter);

export default router;
