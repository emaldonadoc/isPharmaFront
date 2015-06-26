<?php

include_once '../data/Curso.php';
require 'Connection.php';
require 'DBData.php';

class CursosDAO{
    
    private $response;
    
    function createCurso($curso){
        $bd=Connection::getInstance();
        $sql = "INSERT INTO cursos(titulo,descripcion,imagen,extension) VALUES("
                . "'" . $curso->getTitulo() . "',"
                . "'" . $curso->getDescripcion() . "',"
                . "'" .$curso->getImagen() . "',"
                . "'" .$curso->getExtension() . "'"
                . ")";
        $bd->query($sql);
    }
    
    function getCursos(){
        
        $bd=Connection::getInstance();
        $query = "SELECT * FROM cursos"; 
        
       $result=$bd->query($query);
        if(!$result){
            return null;
        }
        $cursos = array();
        while($row=mysql_fetch_array($result)){
            $curso = new StdClass();
            $curso->id = $row['id'];
            $curso->titulo = $row['titulo'];
            $curso->descripcion = $row['descripcion'];
            $curso->imagen = base64_encode($row['imagen']);
            $curso->extension = $row['extension'];
            array_push($cursos, $curso);
        } 
    
        return $cursos;
    }
    
    public function getReponse(){
      return $this->response;     
    }
    
    public function deleteCurso($id){
        $bd=Connection::getInstance();
        $query = "DELETE FROM cursos WHERE id = ". $id;
        $bd->query($query);
    }
}