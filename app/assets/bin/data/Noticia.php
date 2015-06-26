<?php

class Noticia {
    private $id;
    private $titulo;
    private $descripcion;
    private $imagen;
    private $extension;
    
    function Noticia($id,$titulo,$descripcion,$imagen,$extension){
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
    
    function getId(){
        return $this->id;
    }
    
    function getTitulo(){
        return $this->titulo;
    }
    
    function getDescripcion(){
        return $this->descripcion;
    }
    
    function setImagen($imagen){
        $this->imagen = $imagen;
    }
    
    function getImagen(){
        return $this->imagen;
    }
    
    function setExtension($extension){
        $this->extension = $extension;
    }
    
    function getExtension(){
        return $this->extension;
    }
}
