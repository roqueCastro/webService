<?php

require 'conexion.php';

$json      = array();
$sql       = "SELECT * FROM bomberos.contacto ccta Inner join bomberos.encuesta ecta On ecta.id_encuesta=ccta.encuesta1";
$resultado = $base->prepare($sql);
$resultado->execute(array());
$c = $resultado->rowCount();

if ($c > 0) {
    while ($consulta = $resultado->fetch(PDO::FETCH_ASSOC)) {
        $json['contacto'][] = $consulta;
    }
}

echo json_encode($json);
