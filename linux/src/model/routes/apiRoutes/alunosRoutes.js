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

    let newAluno = req.body;
    let formattedDate = null;

    if(newAluno.dataNascimento)
        formattedDate = `'${newAluno.dataNascimento}'`;


    dbConnection.query(`CALL criarAluno('${newAluno.email}','${newAluno.password}','${newAluno.nome}','${newAluno.morada}',${formattedDate},${newAluno.telemovel},${newAluno.idTurma})`,(err,result)=>{
        if(err){
            console.log("falha na introducao do aluno");
        }
        else{
            res.send("deu certo");
        }
  });
});



module.exports = router;