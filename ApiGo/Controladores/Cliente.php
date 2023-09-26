<?php

Flight::register('db','PDO',array('sqlsrv:server=DESKTOP-58HBMDE;Database=Advance_Go','sserver','root'));
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods:POST");
header("Access-Control-Max-Age:86400");
header("Access-Control-Allow-Headers:Content-Type,Access-Control-Allow-Headers,Authorization,X-Requested-With");

Flight::route('GET /Cliente', function () {
   $sentencia=Flight::db()->prepare("SELECT * FROM Cliente");
   $sentencia->execute();
   $datos=$sentencia->fetchAll();
   Flight::json($datos);
   
});

Flight::route('POST /Cliente', function(){
    $json_data=file_get_contents('php://input');
    $data=json_decode($json_data,true);
    $Nombre=$data['Nombre'];
    $Apellido=$data['Apellido'];
    $Region=$data['Region'];
    $Fecha_Nacimiento=$data['Fecha_Nacimiento'];
    $Direccion=$data['Direccion'];
    $Telefono=$data['Telefono'];
    $Identificacion=$data['Identificacion'];
    $sentencia=Flight::db()->prepare("INSERT INTO Cliente(Nombre,Apellido,Region,Fecha_Nacimiento,Direccion,Telefono,Identificacion)
    VALUES(:Nombre,:Apellido,:Region,:Fecha_Nacimiento,:Direccion,:Telefono,:Identificacion)");
    $sentencia->bindParam(":Nombre",$Nombre);
    $sentencia->bindParam(":Apellido",$Apellido);
    $sentencia->bindParam(":Region",$Region);
    $sentencia->bindParam(":Fecha_Nacimiento",$Fecha_Nacimiento);
    $sentencia->bindParam(":Direccion",$Direccion);
    $sentencia->bindParam(":Telefono",$Telefono);
    $sentencia->bindParam(":Identificacion",$Identificacion);
    $sentencia->execute();
    
    Flight::jsonp(['Cliente Agregado Correctamente']);
});


Flight::route('DELETE /Cliente',function(){
   $json_data=file_get_contents('php://input');
   $data=json_decode($json_data,true);
   $id_cliente=$data["id_cliente"];
   $sentencia=Flight::db()->prepare("DELETE FROM Cliente WHERE id_cliente=:id_cliente");
   $sentencia->bindParam(":id_cliente",$id_cliente);
   $sentencia->execute();
   Flight::jsonp(['Cliente Eliminado Correctamente']);
});

Flight::route('PUT /Cliente', function(){
   $json_data=file_get_contents('php://input');
   $data=json_decode($json_data,true);
   $Nombre=$data['Nombre'];
   $Apellido=$data['Apellido'];
   $Region=$data['Region'];
   $Telefono=$data['Telefono'];
   $Identificacion=$data['Identificacion'];
   $id_cliente=$data["id_cliente"];
   $sentencia=Flight::db()->prepare("UPDATE Cliente SET Nombre=:Nombre,Apellido=:Apellido,Region=:Region,Telefono=:Telefono,
   Identificacion=:Identificacion WHERE id_cliente=:id_cliente");
   $sentencia->bindParam(":Nombre",$Nombre);
   $sentencia->bindParam(":Apellido",$Apellido);
   $sentencia->bindParam(":Region",$Region);
   $sentencia->bindParam(":Telefono",$Telefono);
   $sentencia->bindParam(":Identificacion",$Identificacion);
   $sentencia->bindParam(":id_cliente",$id_cliente);
   $sentencia->execute();
   
   Flight::jsonp(['Cliente Actualizado Correctamente']);
});