<?php

require '../model/NoticiasDAO.php';
require '../utils/UtilsJSON.php';
require '../config/PropertiesSystem.php';

$TAMANO_PAGINA = $ResultadosPorPaginaCursos; 

$pagina = $_POST['pagina'] ? $_POST['pagina'] : 1; 
$inicio = ($pagina - 1) * $TAMANO_PAGINA; 

$dao = new NoticiasDAO;

$totalNoticias = $dao->countAllNoticias();
$total_paginas = ceil($totalNoticias / $TAMANO_PAGINA); 
$noticias = $dao->getNoticias($inicio, $TAMANO_PAGINA);

$data = new stdClass();
$data->noticias = $noticias;
$data->paginas = $total_paginas;
$data->pagina = $pagina;

UtilsJSON::writeJSON(true,'OK',$data);
return;