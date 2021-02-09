<?php
require_once "../sistema/conexao.php";
session_start();

class Login {

  private $usuario;
  private $password;
  private $msg;

   function __construct($dados)
   {
       if(empty($dados)){

       }else{

        echo "primeiro";
        $this->setUsuario($dados["usuario"]);
        $this->setPassword($dados["password"]);

       }
   }
   function logar(){
     echo "segundo";
     $query = mysqli_query(conexao(),"SELECT * FROM usuario WHERE '{$this->getUsuario()}' IN(email,nome) AND senha = '{$this->getPassword()}';");
     $dados = mysqli_fetch_assoc($query);
     
     if(!empty($dados)){
        echo "terceiro 01";
        $_SESSION["usuario"] = $dados;
        mysqli_free_result($query);
        mysqli_close(conexao());
        header("location: ../painel.html");
 
     }
     else{
         echo "terceiro 02";
         $this->msg = "nada encontrado";
         return $this->msg;

     }

   }
   function deslogar(){

        session_destroy();
        header("location: ../index.html");

   }
   function setUsuario($usuario){
    
      if($usuario == "" || strlen($usuario) < 5){

        $this->msg = "Erro no nome digitado";
        return $this->msg;

      }else{

        $this->usuario = trim($usuario);

      }

   }
   function getUsuario(){
       
    return $this->usuario;

   }
   function setPassword($password){

   
    if($password == "" || strlen($password) < 5){

        $this->msg = "Erro no senha digitado";
        return $this->msg;

      }else{

        $this->password = trim($password);

      }
  
   }
   function getPassword(){
        
    return $this->password;

   }

}



