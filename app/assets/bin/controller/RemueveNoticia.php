<?php

require '../model/NoticiasDAO.php';
$id = trim($_POST['id']);

if(!$id){
    return;
}

$curso = new NoticiasDAO();
$curso->deleteNoticia($id);

return;
        
        