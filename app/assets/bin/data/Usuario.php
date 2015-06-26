<?php

class Usuario {
    
    private $usuario;
    private $nombre;
    
    function Usuario($nombre,$usuario){
        $this->usuario = $usuario;
        $this->nombre = $nombre;
    }
    
    function setUsuario($usuario){
        $this->usuario = $usuario;
    }
    
    function setNombre($nombre){
        $this->nombre = $nombre;
    }
    
    function getUsuario(){
        return $this->usuario;
    }
    
    function getNombre(){
        return $this->nombre;
    }
    
}
