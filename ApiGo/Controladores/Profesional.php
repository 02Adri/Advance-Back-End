<?php
Flight::register('db','PDO',array('sqlsrv:server=DESKTOP-58HBMDE;Database=Advance_Go','sserver','root'));
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods:POST");
header("Access-Control-Max-Age:86400");
header("Access-Control-Allow-Headers:Content-Type,Access-Control-Allow-Headers,Authorization,X-Requested-With");

Flight::route('GET /Profesional', function(){
    $sentencia=Flight::db()->prepare("SELECT * FROM Profesional");
    $sentencia->execute();
    $datos=$sentencia->fetchAll();
    Flight::json($datos);
});

 Flight::route('POST /Profesional', function(){
     $json_data=file_get_contents('php://input');
     $data=json_decode($json_data,true);
     $Nombre=$data['Nombre'];
     $Apellido=$data['Apellidos'];
     $Region=$data['Region'];
     $Fecha_Nacimiento=$data['Fecha_nacimiento'];
      $Direccion=$data['Direccion'];
      $Telefono=$data['Telefono'];
     $Identificacion=$data['Identificacion'];
     $sentencia=Flight::db()->prepare("INSERT INTO Profesional(Nombre,Apellidos,Region,Fecha_nacimiento,Direccion,Telefono,Identificacion)
     VALUES(:Nombre,:Apellidos,:Region,:Fecha_nacimiento,:Direccion,:Telefono,:Identificacion)");
     $sentencia->bindParam(":Nombre",$Nombre);
     $sentencia->bindParam(":Apellidos",$Apellido);
     $sentencia->bindParam(":Region",$Region);
     $sentencia->bindParam(":Fecha_nacimiento",$Fecha_Nacimiento);
     $sentencia->bindParam(":Direccion",$Direccion);
     $sentencia->bindParam(":Telefono",$Telefono);
     $sentencia->bindParam(":Identificacion",$Identificacion);
     $sentencia->execute();
     
     Flight::jsonp(['Profesional Agregado Correctamente']);
 });
 
 
 Flight::route('DELETE /Profesional',function(){
    $json_data=file_get_contents('php://input');
    $data=json_decode($json_data,true);
    $id_cliente=$data["id_profesional"];
    $sentencia=Flight::db()->prepare("DELETE FROM Cliente WHERE id_profesional=:id_profesional");
    $sentencia->bindParam(":id_cliente",$id_cliente);
    $sentencia->execute();
    Flight::jsonp(['Profesional Eliminado Correctamente']);
 });
 
 Flight::route('PUT /Profesional', function(){
    $json_data=file_get_contents('php://input');
    $data=json_decode($json_data,true);
    $Nombre=$data['Nombre'];
    $Apellido=$data['Apellidos'];
    $Region=$data['Region'];
    $Fecha_Nacimiento=$data['Fecha_nacimiento'];
    $Telefono=$data['Telefono'];
    $Direccion=$data['Direccion'];
    $Identificacion=$data['Identificacion'];
    $id_cliente=$data["id_profesional"];
    $sentencia=Flight::db()->prepare("UPDATE Profesional SET Nombre=:Nombre,Apellidos=:Apellidos,Region=:Region,Fecha_nacimiento=:Fecha_nacimiento,Telefono=:Telefono,
    Identificacion=:Identificacion WHERE id_cliente=:id_cliente");
    $sentencia->bindParam(":Nombre",$Nombre);
    $sentencia->bindParam(":Apellido",$Apellido);
    $sentencia->bindParam(":Region",$Region);
    $sentencia->bindParam(":Telefono",$Telefono);
    $sentencia->bindParam(":Identificacion",$Identificacion);
    $sentencia->bindParam(":id_cliente",$id_cliente);
    $sentencia->execute();
    
    Flight::jsonp(['Profesional Actualizado Correctamente']);
 });


