<?php
Flight::register('db','PDO',array('sqlsrv:server=DESKTOP-58HBMDE;Database=Advance_Go','sserver','root'));
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods:POST");
header("Access-Control-Max-Age:86400");
header("Access-Control-Allow-Headers:Content-Type,Access-Control-Allow-Headers,Authorization,X-Requested-With");

Flight::route('GET /Curricular',function(){
 $sentencia=Flight::db()->prepare("SELECT * FROM Informacion_Curricular");
 $sentencia->execute();
 $datos=$sentencia->fetchAll();

 Flight::json($datos);
});

Flight::route('POST /Curricular',function(){
  $json_data=file_get_contents('php://input');
  $data=json_decode($json_data,true);
  $Nombre=$data['Nombre'];
  $Apellido=$data['Apellido'];
  $Region=$data['Region'];
  $Fecha_Nacimiento=$data['Fecha_Nacimiento'];
  $Direccion=$data['Direccion'];
  $Telefono=$data['Telefono'];
  $Identificacion=$data['Identificacion'];
  $sentencia=Flight::db()->prepare("INSERT INTO Informacion_Curricular(Nombre,Apellido,Region,Fecha_Nacimiento,Direccion,Telefono,Identificacion)
  VALUES(:Nombre,:Apellido,:Region,:Fecha_Nacimiento,:Direccion,:Telefono,:Identificacion)");
   $sentencia->bindParam(":Nombre",$Nombre);
   $sentencia->bindParam(":Apellido",$Apellido);
   $sentencia->bindParam(":Region",$Region);
   $sentencia->bindParam(":Fecha_Nacimiento",$Fecha_Nacimiento);
   $sentencia->bindParam(":Direccion",$Direccion);
   $sentencia->bindParam(":Telefono",$Telefono);
   $sentencia->bindParam(":Identificacion",$Identificacion);
   $sentencia->execute();
   
   Flight::jsonp(['Informacion Curricular Agregada correctamente Agregado Correctamente']);
});