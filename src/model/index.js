const express = require(`express`);
const app = express();
require(`dotenv`).config();

const webserverRouter = require("./routes/webserverRoutes");

const port = process.env.SERVERPORT || 3030;
const protocol = process.env.PROTOCOL || `http`;
const ip = require(`ip`).address();

app.use("/",webserverRouter);

app.listen(port,()=>{
    console.log(`Server running on localhost:${port} or ${protocol}:${ip}:${port}`);
});
