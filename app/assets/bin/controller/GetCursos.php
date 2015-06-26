<?php

require '../model/CursosDAO.php';
require '../utils/UtilsJSON.php';

$dao = new CursosDAO;
$cursos = $dao->getCursos();
UtilsJSON::writeJSON(true,'OK',$cursos);
return;