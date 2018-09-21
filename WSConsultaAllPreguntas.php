<?php

require 'conexion.php';

$json      = array();
$sql       = "SELECT * FROM pregunta WHERE estado_pgta=1";
$resultado = $base->prepare($sql);
$resultado->execute(array());
$c = $resultado->rowCount();

if ($c > 0) {
    while ($consulta = $resultado->fetch(PDO::FETCH_ASSOC)) {
        $json['preguntaAll'][] = $consulta;
    }
}

echo json_encode($json);
