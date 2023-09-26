<?php
Flight::register('db','PDO',array('sqlsrv:server=DESKTOP-58HBMDE;Database=Advance_Go','sserver','root'));
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods:POST");
header("Access-Control-Max-Age:86400");
header("Access-Control-Allow-Headers:Content-Type,Access-Control-Allow-Headers,Authorization,X-Requested-With");

Flight::route('GET /detalle_emprendimiento', function(){
    $sentencia=Flight::db()->prepare("SELECT * FROM Detalles_Emprendimiento");
    $sentencia->execute();
    $datos=$sentencia->fetchAll();

    Flight::json($datos);
});

Flight::route('POST /detalle_emprendimiento',function(){
    $json_data=file_get_contents('php://input');
    $data=json_decode($json_data,true);
    $Nombre_Emprendimiento=$data['Nombre_Emprendimiento'];
    $Categoria=$data['Categoria'];
    $Ciudad=$data['Ciudad'];
    $Direccion=$data['Direccion'];
    $Telefono=$data['Telefono'];
    $N_Ruc=$data['N_Ruc'];
    $sentencia=Flight::db()->prepare("INSERT INTO Detalles_Emprendimiento(Nombre_Emprendimiento,Categoria,Ciudad,Direccion,Telefono,N_Ruc)
    VALUES(:Nombre_Emprendimiento,:Categoria,:Ciudad,:Direccion,:Telefono,:N_Ruc)");
    $sentencia->bindParam(":Nombre_Emprendimiento",$Nombre_Emprendimiento);
    $sentencia->bindParam(":Categoria",$Categoria);
    $sentencia->bindParam(":Ciudad",$Ciudad);
    $sentencia->bindParam(":Direccion",$Direccion);
    $sentencia->bindParam(":Telefono",$Telefono);
    $sentencia->bindParam(":N_Ruc",$N_Ruc);
    $sentencia->execute();

    Flight::jsonp(['Detalle de emprendimiento Agregado Correctamente']);

});