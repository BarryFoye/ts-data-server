import express from 'express';
import controller from '../controllers/market_data';
const router = express.Router();

router.get('/market_data', controller.getWeeklySnapshots);

export = router;
