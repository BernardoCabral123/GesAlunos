const express = require("express");
const router = express.Router();

const assetRouter = require("./fileRoutes/assetRoutes");
router.use("/assets",assetRouter);

const controllerRouter = require("./fileRoutes/controllerRoutes");
router.use("/controllers",controllerRouter);

const styleRouter = require("./fileRoutes/styleRoutes");
router.use("/styles",styleRouter);

module.exports = router;
