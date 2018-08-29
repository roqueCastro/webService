<?php

require 'conexion.php';

$json = array();

if (isset($_GET['id_encuesta'])) {
    $id_encuesta = $_GET['id_encuesta'];

    $sql       = "SELECT id_pgta, nomb_pgta, tipo_pregunta FROM pregunta WHERE encuesta2 = '{$id_encuesta}' Order by tipo_pregunta asc ";
    $resultado = $base->prepare($sql);
    $resultado->execute(array());
    $c = $resultado->rowCount();

    if ($c > 0) {
        while ($consulta = $resultado->fetch(PDO::FETCH_ASSOC)) {
            $json['pregunta'][] = $consulta;
        }
        //
    } else {
        $consulta['id_pgta']       = '0';
        $consulta['nomb_pgta']     = '1';
        $consulta['tipo_pregunta'] = '1';
        $json['pregunta'][]        = $consulta;
    }

    echo json_encode($json);

} else {
    $consulta['id_pgta']       = '0';
    $consulta['nomb_pgta']     = '2';
    $consulta['tipo_pregunta'] = '2';
    $json['pregunta'][]        = $consulta;
    echo json_encode($json);
}
