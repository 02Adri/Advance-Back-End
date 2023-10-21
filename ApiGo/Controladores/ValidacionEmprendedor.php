<?php

Flight::register('db','PDO',array('sqlsrv:server=DESKTOP-58HBMDE;Database=Advance_Go','sserver','root'));
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods:POST");
header("Access-Control-Max-Age:86400");
header("Access-Control-Allow-Headers:Content-Type,Access-Control-Allow-Headers,Authorization,X-Requested-With");
//Permite validar la contraseña de emprendedor
Flight::route('GET /ValidacionEmprendedor', function(){
 $sentencia=Flight::db()->prepare("SELECT * FROM ValidacionEmprendedor");
 $sentencia->execute();
 $datos=$sentencia->fetchAll();

 Flight::json($datos);
});

Flight::route('POST /ValidacionProfesional', function(){
  $json_data=file_get_contents('php://input');
  $data=json_decode($json_data,true);
  $Email=$data['Email'];
  $Password=$data['Password'];
  $sentencia=Flight::db()->prepare("INSERT INTO ValidacionEmprendedor(Email,Password) VALUES(:Email,:Password)");
  $sentencia->bindParam(":Email",$Email);
  $sentencia->bindParam(":Password",$Password);
  $sentencia->execute();

  Flight::jsonp(['Email y contraseña enviados correctamente']);
});