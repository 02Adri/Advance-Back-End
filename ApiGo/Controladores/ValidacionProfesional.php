<?php
Flight::register('db','PDO',array('sqlsrv:server=DESKTOP-58HBMDE;Database=Advance_Go','sserver','root'));
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods:POST");
header("Access-Control-Max-Age:86400");
header("Access-Control-Allow-Headers:Content-Type,Access-Control-Allow-Headers,Authorization,X-Requested-With");

Flight::route('GET /ValidacionProfesional', function(){
 $sentencia=Flight::db()->prepare("SELECT * FROM ValidacionProfesional");
 $sentencia->execute();
 $datos=$sentencia->fetchAll();

 Flight::json($datos);
});

Flight::route('POST /ValidacionProfesional', function(){
  $json_data=file_get_contents('php://input');
  $data=json_decode($json_data,true);
  $Email=$data['Email'];
  $password=$data['password'];
  $sentencia=Flight::db()->prepare("INSERT INTO ValidacionProfesional(Email,password) VALUES(:Email,:password)");
  $sentencia->bindParam(":Email",$Email);
  $sentencia->bindParam(":password",$password);
  $sentencia->execute();

  Flight::jsonp(['Email y contraseña enviados correctamente']);
});