<?php

require 'conexion.php';
$idEvento = $_POST['idEvento'];
$resultado = $_POST['resultado'];
$idRespuesta = $_POST['idRespuesta'];

if($resultado==""){
	$sql="INSERT INTO resultado (evento, resultado, respuesta)VALUES (:eve,:resu,:resp)";
	$resul= $base->prepare($sql);
	$resul->execute(array(":eve"=>$idEvento, ":resu"=>$idRespuesta, ":resp"=>$idRespuesta));
	$c=$resul->rowCount();
}else{
	$sql="INSERT INTO resultado (evento, resultado, respuesta)VALUES (:eve,:resu,:resp)";
	$resul= $base->prepare($sql);
	$resul->execute(array(":eve"=>$idEvento, ":resu"=>$resultado, ":resp"=>$idRespuesta));
	$c=$resul->rowCount();
}

if($c>0){
	echo 'Registra';
}else{
	echo 'Noregistra'; 
}

?>