<?php

require 'flight/Flight.php';
Flight::set('flight.log_errors', true);
require 'Controladores/Cliente.php';
require 'Controladores/Profesional.php';
require 'Controladores/Imagenes.php';
require 'Controladores/Emprendedor.php';
require 'Controladores/Detalles_Emprendimiento.php';
require 'Controladores/ValidacionProfesional.php';
require 'Controladores/Contacto.php';
require 'Controladores/Informacion_Curricular.php';
require 'Controladores/ValidacionEmprendedor.php';
Flight::start();

