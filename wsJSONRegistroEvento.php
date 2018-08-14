<?php

require 'conexion.php';
$encuesta = $_POST['encuesta'];
$cx       = $_POST['cx'];
$cy       = $_POST['cy'];
$imagen   = $_POST['imagen'];
/*$encuesta = 2;
$cx = "12.6846846";
$cy = "-87.168435";*/
$path   = "imagenes/Foto_$cx.jpg";
$actual = date("Y-m-d H:i:s");

//$url = "http://$hostname_localhost/ejemploBDRemota/$path";
$url = "imagenes/Foto_$actual.jpg";

file_put_contents($path, base64_decode($imagen));
$bytesArchivo = file_get_contents($path);

$sql   = "INSERT INTO evento (latitud, longitud, encuesta, usuario, imagen)VALUES (:lat,:lng,:encu,:usu,:image)";
$resul = $base->prepare($sql);
$resul->execute(array(":lat" => $cx, ":lng" => $cy, ":encu" => $encuesta, ":usu" => 1, ":image" => $url));
$c = $resul->rowCount();
if ($c > 0) {
    $idReciente = $base->lastInsertId("evento");
    echo $idReciente;
} else {
    echo 'Noregistra';
}
