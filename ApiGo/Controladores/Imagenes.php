<?php
Flight::register('db','PDO',array('sqlsrv:server=DESKTOP-58HBMDE;Database=Advance_Go','sserver','root'));
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods:POST");
header("Access-Control-Max-Age:86400");
header("Access-Control-Allow-Headers:Content-Type,Access-Control-Allow-Headers,Authorization,X-Requested-With");

Flight::route('GET /imagen/@id', function(){
    $json_data=file_get_contents('php://input');
     $data=json_decode($json_data,true);
     $id=$data['id_imagen'];
    $sentencia=Flight::db()->prepare("SELECT imagen FROM Imagenes WHERE id_imagen=:id_imagen");
    $sentencia->bindParam('id_imagen',$id);
    $sentencia->execute();

    header('Content-Type: image/png');
    while($row=$sentencia->fetch(PDO::FETCH_ASSOC))
    {
        echo $row['imagen'];
    }
});

Flight::route('POST /imagen',function(){
     $imagen=file_get_contents($_FILES['imagen']['tmp_name']);
     $sentencia=Flight::db()->Prepare("INSERT INTO Imagenes(imagen) VALUES(:imagen)");
     $sentencia->bindParam(':imagen',$imagen);
     $sentencia->execute();
     
     Flight::jsonp(['Imagen se subio']);
});

