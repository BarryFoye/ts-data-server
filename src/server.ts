import http from 'http';
import express, { Express } from 'express';
import morgan from 'morgan';
import routes from './routes';
import swaggerUi from 'swagger-ui-express';
import { createConnection } from 'typeorm';
import dbConfig from './config/database';

const SERVER_TYPE = 'Data Server';
const router: Express = express();

/** Logging */
router.use(morgan('dev'));
/** Parse the request */
router.use(express.urlencoded({ extended: false }));
/** Takes care of JSON data */
router.use(express.json());
/** OpenAPI with swagger */
router.use(
	'/docs',
	swaggerUi.serve,
	swaggerUi.setup(undefined, {
		swaggerOptions: {
			url: '/swagger.json'
		}
	})
);
/** Serve static files */
router.use(express.static('public'));

//* API Rules
router.use((req, res, next) => {
	// set the CORS policy
	res.header('Access-Control-Allow-Origin', '*');
	// set the CORS headers
	res.header('Access-Control-Allow-Headers', 'origin, X-Requested-With,Content-Type,Accept, Authorization');
	// set the CORS method headers
	if (req.method === 'OPTIONS') {
		res.header('Access-Control-Allow-Methods', 'GET PATCH DELETE POST');
		return res.status(200).json({});
	}
	next();
});

/** Routes */
router.use('/', routes);

/** Error handling */
router.use((req, res, next) => {
	const error = new Error('not found');
	return res.status(404).json({
		message: error.message
	});
});

const httpServer = http.createServer(router);
const PORT: any = process.env.PORT ?? 3100;

createConnection(dbConfig)
	.then((_connection) => {
		httpServer.listen(PORT, () => console.log(`${SERVER_TYPE} running on http://localhost:${PORT}/heartBeat`));
	})
	.catch((err) => {
		console.log(`KAPUT -_- db ain't working yo: ${err}`);
	});
