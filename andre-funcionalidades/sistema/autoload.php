<?php

$class = null;
$method = null; 

$resultClass = !empty($_POST["class"]) && isset($_POST["class"]) ? $class = $_POST["class"] : $class = null;
$resultClass = !empty($_GET["class"]) && isset($_GET["class"]) ? $class = $_GET["class"] : $class = null;
$resultMethod = !empty($_GET["method"]) || !empty($_POST["method"]) ? $method = $_GET["method"] : $method = null;
$location = empty($_GET["class"]) && empty($_POST["class"]) ? header("location: ../index.html") : "";

spl_autoload_register('meuAutoload');

function meuAutoload($classe) {
   if(file_exists("../funcionalidade/". $classe . ".php")){
        include_once "../funcionalidade/". $classe . ".php";
   }
}

$classe = new $class($_POST);
$metodo = isset($method) ? $classe->$method() : "";

?>


