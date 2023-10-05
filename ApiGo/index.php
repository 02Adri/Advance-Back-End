<?php

require 'flight/Flight.php';
Flight::set('flight.log_errors', true);
require 'Controladores/Cliente.php';
require 'Controladores/Profesional.php';
require 'Controladores/Imagenes.php';
require 'Controladores/Emprendedor.php';
require 'Controladores/Detalles_Emprendimiento.php';
require 'Controladores/Profesional_Curricular.php';
require 'Controladores/ValidacionProfesional.php';
Flight::start();
