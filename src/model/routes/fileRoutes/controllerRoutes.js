const srcLocation = require("../../../srcLocation");
const express = require("express");
const router = express.Router();

router.get("/itemRenderer.js",(req,res)=>{
    res.sendFile(srcLocation +"\\controller\\itemRenderer.js");
})

module.exports = router;
