<?php

require 'conexion.php';

$json = array();
	
if(isset($_GET['id_pregunta'])){
	$id_pregunta = $_GET['id_pregunta'];
	
	
	
	$sql="SELECT * FROM respuesta WHERE pregunta = '{$id_pregunta}'";
	$resultado= $base->prepare($sql);
	$resultado->execute(array());
	$c=$resultado->rowCount();
	
	if($c>0){
		while($consulta=$resultado->fetch(PDO::FETCH_ASSOC)){
			$json['respuesta'][]=$consulta;	
		}
		//
	}else{
		$consulta['id_rpta']='0';
		$consulta['nomb_rpta']='1';
		$json['respuesta'][]=$consulta;
    }
	
	echo json_encode($json);

}else{
	$consulta['id_rpta']='0';
		$consulta['nomb_rpta']='2';
	$json['respuesta'][]=$consulta;
	echo  json_encode($json); 
} 

?>