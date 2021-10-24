import { Get, Route } from 'tsoa';

interface HBResponse {
	message: string;
}

@Route('heartBeat')
export default class HeartBeatController {
	@Get('/')
	public async getMessage(): Promise<HBResponse> {
		return {
			message: "I'm alive and kicking!"
		};
	}
}
