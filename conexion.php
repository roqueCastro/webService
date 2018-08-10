<?php 

try{
	$base= new PDO('mysql:host=10.97.128.75; dbname=bomberos','bomberos','juanjose1201');
	$base->exec('SET CHARACTER SET utf8');
	
	
}catch(Exception $e){
	die("error".$e->getMessage());
}
?>