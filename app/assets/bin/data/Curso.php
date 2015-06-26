<?php

class Curso {
    private $id;
    private $titulo;
    private $descripcion;
    private $imagen;
    private $extension;
    
    function Curso($id,$titulo,$descripcion,$imagen,$extension){
        $this->id = $id;
        $this->titulo = $titulo;
        $this->descripcion = $descripcion;
        $this->imagen = $imagen;
        $this->extension = $extension;
    }
    
    function setId($id){
        $this->id = $id;
    }
    
    function setTitulo($titulo){
        $this->titulo = $titulo;
    }
    
    function setDescripcion($descripcion){
        $this->descripcion = $descripcion;
    }
    
    function setImagen($imagen){
        $this->imagen = $imagen;
    }
    
    function setFecha($fecha){
        $this->fecha = $fecha;
    }
    
    function getId(){
        return $this->id;
    }
    
    function getTitulo(){
        return $this->titulo;
    }
    
    function getDescripcion(){
        return $this->descripcion;
    }
    
    function getImagen(){
        return $this->imagen;
    }
    
    function getFecha(){
        return $this->fecha;
    }
    
    function setExtension($extension){
        $this->extension = $extension;
    }
    
    function getExtension(){
        return $this->extension;
    }
}
