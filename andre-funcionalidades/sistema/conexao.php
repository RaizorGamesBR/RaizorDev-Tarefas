<?php

function conexao(){

    $conexao = mysqli_connect("localhost","root","1234","Raizon");

    if(mysqli_connect_errno()){
         
       echo "A conexão nao foi bem sucedida". mysqli_connect_error();
       exit;

    }
    
    return $conexao;
}


