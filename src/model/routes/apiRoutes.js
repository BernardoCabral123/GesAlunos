const express = require("express");
const router = express.Router();

const contentRouter = require("./apiRoutes/contentRoutes");
router.use("/content",contentRouter);

module.exports = router;
