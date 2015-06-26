<?php

include_once '../data/Curso.php';
require '../model/CursosDAO.php';
require '../utils/UtilsJSON.php';
      
$titulo = trim($_POST['titulo']);
$descripcion = trim($_POST['descripcion']);

if(!$titulo){
    UtilsJSON::writeJSON(false,'Por favor ingrese el titulo del curso',null);
    return;
}

if(!$descripcion){
    UtilsJSON::writeJSON(false,'Por favor ingrese la descripcion del curso',null);
    return;
}
        
$nombre_archivo = $_FILES['imagen']['name']; 
$tipoArchivo = $_FILES['imagen']['type']; 
$tamano_archivo = $_FILES['imagen']['size']; 
$tmpName = $_FILES['imagen']['tmp_name'];

if($tamano_archivo > 5000000){
    UtilsJSON::writeJSON(false,'El tamaño de la imagen no puede ser mayor a 5 megabytes',null);
}

$fp = fopen($tmpName, 'r');

$data = fread($fp, filesize($tmpName));
$data = addslashes($data);

fclose($fp);

$dao = new CursosDAO();

$curso = new Curso(null,$titulo,$descripcion,$data,$tipoArchivo);

$res = $dao->createCurso($curso);
UtilsJSON::writeJSON(true,'OK',null);

?>