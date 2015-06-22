<?php

class UtilsJSON {
    
    static $_instance;

    private function __construct(){}

    private function __clone(){}

    public static function getInstance(){
        if (!(self::$_instance instanceof self)){
            self::$_instance = new self();
        }
        return self::$_instance;
    }
    
    function writeJSON($success,$message,$data){
        $response['response'] = array(
            'success' => $success,
            'message' => $message,
            'data' => $data,
        );
        $encoded = json_encode($response);
        header('Content-type: application/json');
        exit($encoded);
    }
    
    function writeUsuario($usuario){
        include_once '../data/Usuario.php';
        $json['usuario'] = array(
            'usuario' => $usuario->getUsuario(),
            'nombre' => $usuario->getNombre()
        );
        
        return $json;
    }
    
}
