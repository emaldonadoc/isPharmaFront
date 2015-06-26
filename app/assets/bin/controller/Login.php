<?php

require '../utils/UtilsJSON.php';

$user = trim($_POST['user']);
$password = trim($_POST['password']);

if(!$user){
    UtilsJSON::writeJSON(false,'Por favor ingrese su nombre de usuario',null);
    return;
}

if(!$password){
    UtilsJSON::writeJSON(false,'Por favor ingrese su password',null);
    return;
}

require '../model/LoginDAO.php';

$login = new LoginDAO();

$isValid = $login->isValidLogin($user, $password);

if(!$isValid){
    UtilsJSON::writeJSON(false,$login->getReponse(),null);
    return;
}

session_start();

$_SESSION['usuario'] = $login->getUsuario();

UtilsJSON::writeJSON(true,$login->getReponse(),$login->getUsuario());
return;

