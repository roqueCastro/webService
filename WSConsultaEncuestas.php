<?php

require 'conexion.php';

$json      = array();
$sql       = "SELECT * FROM encuesta WHERE est_encta=1";
$resultado = $base->prepare($sql);
$resultado->execute(array());
$c = $resultado->rowCount();

if ($c > 0) {
    while ($consulta = $resultado->fetch(PDO::FETCH_ASSOC)) {
        $json['encuesta'][] = $consulta;
    }
}

echo json_encode($json);
