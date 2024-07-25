import express, { Express, Request, Response } from "express";

import { callContractMethodController, createAccountController, executeContractMethodController, getAccountsController } from "../controllers/contract.controller";
import handleControllerCall from "../controllers";

import Logger from "../../helpers/logger.helper";
import Config from "../../types/Config.type";
import { apiKeyMiddleware } from "../middleware/apiKey.middleware";

const app: Express = express();
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(apiKeyMiddleware);

let logger: Logger;
let config: Config;

app.get("/getAccounts", async (req: Request, res: Response) => {
  const requestMade: string = `GET /getAccounts`;

  logger.info(requestMade);
  logger.debug(`${requestMade} ${JSON.stringify(req.headers)} ${JSON.stringify(req.query)} ${JSON.stringify(req.body)}`);

  await handleControllerCall(req, res, logger, getAccountsController);
});

app.post("/createAccount", async (req: Request, res: Response) => {
  const requestMade: string = `POST /createAccount`;

  logger.info(requestMade);
  logger.debug(`${requestMade} ${JSON.stringify(req.headers)} ${JSON.stringify(req.query)} ${JSON.stringify(req.body)}`);

  await handleControllerCall(req, res, logger, createAccountController);
});

app.get("/:address/:method", async (req: Request, res: Response) => {
  const address: string = req.params.address;
  const methodName: string = req.params.method;
  const requestMade: string = `GET /${address}/${methodName}`;

  logger.info(requestMade);
  logger.debug(`${requestMade} ${JSON.stringify(req.headers)} ${JSON.stringify(req.query)} ${JSON.stringify(req.body)}`);

  await handleControllerCall(req, res, logger, callContractMethodController);
});

app.post("/:address/:method", async (req: Request, res: Response) => {
  const address: string = req.params.address;
  const methodName: string = req.params.method;
  const requestMade: string = `POST /${address}/${methodName}`;

  logger.info(requestMade);
  logger.debug(`${requestMade} ${JSON.stringify(req.headers)} ${JSON.stringify(req.query)} ${JSON.stringify(req.body)}`);

  await handleControllerCall(req, res, logger, executeContractMethodController);
});

/**
 * Initialize de application
 */
export default async function startApi(
  _config: Config,
  _loggger: Logger
) {
  logger = _loggger;
  config = _config;

  logger.info("STARTING API");
  const appPort = config.PORT || 3000;
  app.listen(appPort);
  logger.info(`Express server running on port ${appPort}...`);
}
