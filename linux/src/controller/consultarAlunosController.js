function fillTable(){
    fetch("http://localhost:3000/api/users/alunos")
    .then(res => res.json())
    .then(data => tratarDados(data))
    .catch((err)=>{
        alert("Ocorreu um erro");
    });
}

function tratarDados(data){
    var codigoHtml = "";

    for(var i = 0; i < Object.keys(data).length; i++){
        codigoHtml +=`
        <tr>
            <td style="text-align: center;">${data[i].nome}</td>
            <td style="text-align: center;">${data[i].nomeTurma}</td>
            <td style="text-align: center;">${data[i].nomeCurso}</td>
            <td> 
                <div class="d-flex justify-content-center">
                    <button type="button" onclick="detalhes(${data[i].idutilizador});" class="btn btn-success"> Detalhes </button>
                    <div style="width:20px;"> </div>
                    <button type="button" onclick="editar(${data[i].idutilizador});"class="btn btn-primary"> Editar </button>
                    <div style="width:20px;"> </div>
                    <button type="button" onclick="eliminar(${data[i].idutilizador});"class="btn btn-danger"> Eliminar </button>

                </div>
            </td>
            
          </tr>
          \n`;
    }
    document.getElementById(`tblAlunos`).innerHTML = codigoHtml;
}

function detalhes(id){
    console.log(id);
}

function editar(id){
    console.log(id);
}

function eliminar(id){
    console.log(id);
}

