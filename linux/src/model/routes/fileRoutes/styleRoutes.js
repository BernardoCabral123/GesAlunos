const srcLocation = require("../../../srcLocation");
const express = require("express");
const router = express.Router();

router.get("/inserirAlunosStyles.css",(req,res)=>{
    res.sendFile(srcLocation + "/view/styles/inserirAlunosStyles.css"); 
})

module.exports = router;