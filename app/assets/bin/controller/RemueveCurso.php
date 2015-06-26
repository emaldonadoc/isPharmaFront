<?php

require '../model/CursosDAO.php';
$id = trim($_POST['id']);

if(!$id){
    return;
}

$curso = new CursosDAO();
$curso->deleteCurso($id);

return;
        
        