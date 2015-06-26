<?php

class LoginDAO{
    
    private $response;
    private $usuario;
    
    function isValidLogin($usuario,$password){
        require 'Connection.php';
        require 'DBData.php';
        
        $bd=Connection::getInstance();
        $sql = "SELECT * FROM login WHERE usuario='".$usuario."'";
        $stmt=$bd->query($sql);
        $record=$bd->obtener_fila($stmt,0);
        
        if(!$record){
             $this->response = "Este usuario no existe";
             return false;
        }
        
        $activo = $record['activo'];
        
        if(!$activo){
            $this->response = "Este usuario esta inactivo";
            return false;
        }
        
        $passwordDB = $record['password'];
        
        if($passwordDB != $password ){
            $this->response = "El password es incorrecto";
            return false;
        }
        
        $usuarioDB = $record['usuario'];
        $nombre = $record['nombre'];
        
        include_once '../data/Usuario.php';
        
        $this->usuario = new Usuario($nombre,$usuarioDB);
        $this->response = 'OK';
        return true;
    }
    
    public function getReponse(){
      return $this->response;     
    }
    
    public function getUsuario(){
        return $this->usuario;
    }
   
    
}