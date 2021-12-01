function renderNav(){
    fetch("http://localhost:3000/api/content/navbar")
    .then(res => res.text())
    .then(data => renderCode("navbar",data))
    .catch((err)=>{
        console.log(err);
        alert("Ocorreu um erro");
    });
}
function renderFooter(){
    fetch("http://localhost:3000/api/content/footer")
    .then(res => res.text())
    .then(data => renderCode("footer",data))
    .catch((err)=>{
        console.log(err);
        alert("Ocorreu um erro");
    });
}
function renderCode(id,codigo){
    document.getElementById(id).innerHTML = codigo;
}

function renderItems(){
    renderFooter();
    renderNav();
}