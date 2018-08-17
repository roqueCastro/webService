<?php

require 'conexion.php';
$encuesta = $_POST['encuesta'];
$cx       = $_POST['cx'];
$cy       = $_POST['cy'];
$imagen   = $_POST['imagen'];
/*$encuesta = 2;
$cx = "12.6846846";
$cy = "-87.168435";*/

$fecha = date("d_m_Y");
$hora  = date("H_i_s");
$path  = "imagenes/Foto_Fecha_" . $fecha . "_Hora_" . $hora . ".jpg";

//$url = "http://$hostname_localhost/ejemploBDRemota/$path";
$url = "imagenes/Foto_Fecha_" . $fecha . "_Hora_" . $hora . ".jpg";

file_put_contents($path, base64_decode($imagen));
$bytesArchivo = file_get_contents($path);

try {
    $sql   = "INSERT INTO evento (latitud, longitud, estado, encuesta, usuario, imagen)VALUES (:lat,:lng,:esta,:encu,:usu,:image)";
    $resul = $base->prepare($sql);
    $resul->execute(array(":lat" => $cx, ":lng" => $cy, ":esta" => 1, ":encu" => $encuesta, ":usu" => 1, ":image" => $url));
    $c = $resul->rowCount();
    if ($c > 0) {
        $idReciente = $base->lastInsertId("evento");
        echo $idReciente;
    } else {
        echo 'Noregistra';
    }
} catch (Exception $e) {
    echo 'ErrorBaseDatos';
}
