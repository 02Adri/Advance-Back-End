<?php

Flight::register('db','PDO',array('sqlsrv:server=DESKTOP-58HBMDE;Database=Advance_Go','sserver','root'));
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods:POST");
header("Access-Control-Max-Age:86400");
header("Access-Control-Allow-Headers:Content-Type,Access-Control-Allow-Headers,Authorization,X-Requested-With");

Flight::route('GET /informacion', function(){
 $sentencia=Flight::db()->prepare("SELECT * FROM Informacion_Curricular");
 $sentencia->execute();
 $datos=$sentencia->fetchAll();
 Flight::json($datos);
});

Flight::route('POST /informacion', function(){

    $json_data=file_get_contents("php://input");
    $data=json_decode($json_data,true);
    $Categoria=$data["Categoria"];
    $Profesion=$data["Profesion"];
    $Otros_Estudios=$data["Otros_Estudios"];
    $Horario_Atencion=$data["Horario_Atencion"];
    $Documentacion=$data["Documentacion"];
    $sentencia=Flight::db()->prepare("INSERT INTO Informacion_Curricular(Categoria,Profesion,Otros_Estudios,Horario_Atencion,Documentacion)
     VALUES (:Categoria,:Profesion,:Otros_Estudios,:Horario_Atencion,:Documentacion)");
     $sentencia->bindParam(":Categoria",$Categoria);
     $sentencia->bindParam(":Profesion",$Profesion);
     $sentencia->bindParam(":Otros_Estudios",$Otros_Estudios);
     $sentencia->bindParam(":Horario_Atencion",$Horario_Atencion);
     $sentencia->bindParam(":Documentacion",$Documentacion);
     $sentencia->execute();

     Flight::jsonp(["Contacto registrado correctamente"]);

});