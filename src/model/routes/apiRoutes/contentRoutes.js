const srcLocation = require("../../../srcLocation");
const express = require("express");
const router = express.Router();

router.get("/navbar", (req, res) => {
    res.sendFile(srcLocation + "\\view\\navbar.html")
});

module.exports = router;

router.get("/footer", (req, res) => {
    res.sendFile(srcLocation + "\\view\\footer.html")
});