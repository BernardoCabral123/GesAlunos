const srcLocation = require("../../../srcLocation");
const express = require("express");
const router = express.Router();

router.get("/itemRenderer.js",(req,res)=>{
    res.sendFile(srcLocation +"/controller/itemRenderer.js");
})

router.get("/consultarAlunosController.js",(req,res)=>{
    res.sendFile(srcLocation +"/controller/consultarAlunosController.js");
})

module.exports = router;
