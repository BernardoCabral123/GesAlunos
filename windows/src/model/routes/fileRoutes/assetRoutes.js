const srcLocation = require("../../../srcLocation");
const express = require("express");
const router = express.Router();

router.get("/logo.png",(req,res)=>{
    res.sendFile(srcLocation +"\\view\\asssets\\logo.png");
})

router.get("/logo2.png",(req,res)=>{
    res.sendFile(srcLocation +"\\view\\asssets\\logo2.png");
})

module.exports = router;
