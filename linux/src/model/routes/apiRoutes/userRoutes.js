const express = require("express");
const router = express.Router();

const alunosRouter = require("./alunosRoutes");
router.use("/alunos",alunosRouter);

module.exports = router;
