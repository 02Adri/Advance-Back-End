<?php
Flight::register('db','PDO',array('sqlsrv:server=DESKTOP-58HBMDE;Database=Advance_Go','sserver','root'));
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods:POST");
header("Access-Control-Max-Age:86400");
header("Access-Control-Allow-Headers:Content-Type,Access-Control-Allow-Headers,Authorization,X-Requested-With");

Flight::route('GET /Contacto', function(){
    $sentencia=Flight::db()->prepare("SELECT * FROM Contacto");
    $sentencia->execute();
    $datos=$sentencia->fetchAll();

    Flight::json($datos);
});

Flight::route('POST /Contacto', function(){
   $json_data=file_get_contents('php://input');
   $data=json_decode($json_data,true);
   $Nombre=$data['Nombre'];
   $Telefono=$data['Telefono'];
    $sentencia=Flight::db()->prepare("INSERT INTO Contacto(Nombre,Telefono) VALUES(:Nombre,:Telefono)");
    $sentencia->bindParam(":Nombre",$Nombre);
    $sentencia->bindParam(":Telefono",$Telefono);
    $sentencia->execute();
    Flight::jsonp(['Contacto ingresado correctamente ']);
});