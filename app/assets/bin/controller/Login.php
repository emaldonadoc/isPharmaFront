<?php

require '../utils/UtilsJSON.php';

$json = UtilsJSON::getInstance();
      
$user = trim($_GET['user']);
$password = trim($_GET['password']);

if(!$user){
    $json->writeJSON(false,'Por favor ingrese su nombre usuario','');
    return;
}

if(!$password){
    $json->writeJSON(false,'Por favor ingrese su password','');
    return;
}

require '../model/LoginDAO.php';

$login = new LoginDAO();

$isValid = $login->isValidLogin($user, $password);

if(!$isValid){
    $json->writeJSON(false,$login->getReponse(),'');
    return;
}

include_once '../data/Usuario.php';
$usuario = $json->writeUsuario($login->getUsuario());

$json->writeJSON(true,$login->getReponse(),$usuario);
return;

