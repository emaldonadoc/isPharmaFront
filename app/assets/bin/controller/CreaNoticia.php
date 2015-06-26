<?php

include_once '../data/Noticia.php';
require '../model/NoticiasDAO.php';
require '../utils/UtilsJSON.php';
      
$titulo = trim($_POST['titulo']);
$descripcion = trim($_POST['descripcion']);

if(!$titulo){
    UtilsJSON::writeJSON(false,'Por favor ingrese el titulo de la noticia',null);
    return;
}

if(!$descripcion){
    UtilsJSON::writeJSON(false,'Por favor ingrese la descripcion de la noticia',null);
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

$dao = new NoticiasDAO();

$noticia = new Noticia(null,$titulo,$descripcion,$data,$tipoArchivo);

$res = $dao->createNoticia($noticia);
UtilsJSON::writeJSON(true,'OK',null);

?>