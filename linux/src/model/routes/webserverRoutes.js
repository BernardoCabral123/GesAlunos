const srcLocation = require("../../srcLocation");
const express = require("express");
const router = express.Router();


const apiRouter = require("./apiRoutes");
router.use("/api",apiRouter);

const fileRouter = require("./fileRoutes");
router.use("/files",fileRouter);

router.get("/",(req,res)=>{
    res.sendFile(srcLocation + "/view/index.html"); 
    console.log()
})

router.get("/login",(req,res)=>{
    res.sendFile(srcLocation + "/view/login.html"); 
})
router.get("/consultaralunos",(req,res)=>{
    res.sendFile(srcLocation + "/view/consultarAlunos.html"); 
})

router.get("/inseriralunos",(req,res)=>{
    res.sendFile(srcLocation + "/view/inserirAlunos.html"); 
})

module.exports = router;