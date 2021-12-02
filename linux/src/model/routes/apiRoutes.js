const express = require("express");
const router = express.Router();

const contentRouter = require("./apiRoutes/contentRoutes");
router.use("/content",contentRouter);

const turmaRouter = require("./apiRoutes/turmaRoutes");
router.use("/turmas",turmaRouter);

const userRouter = require("./apiRoutes/userRoutes");
router.use("/users",userRouter);

module.exports = router;
