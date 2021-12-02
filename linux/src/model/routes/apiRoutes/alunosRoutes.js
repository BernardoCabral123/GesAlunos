const srcLocation = require("../../../srcLocation");
const express = require("express");
const router = express.Router();

var bodyParser = require('body-parser')

const dbConnection = require("../../dbConnection");

router.use(bodyParser.urlencoded({ extended: false }))
router.use(bodyParser.json())

router.get(`/`,(req,res)=>{
    dbConnection.query("SELECT * FROM infoAlunos;",(err,result)=>{
        if(err){
            console.log("falha na execucao do query")
        }
        else{
            res.json(result);
        }
    })
});

router.post(`/`,(req,res)=>{
    dbConnection.query(`CALL criarAluno(${req.body.email},${req.body.password},${req.body.nome},${req.body.morada},${req.body.dataNascimento},${req.body.telemovel},${req.body.idTurma})`,(err,result)=>{
        if(err){
            console.log("falha na introducao do aluno")
        }
        else{
            res.json(result);
        }
  });



module.exports = router;