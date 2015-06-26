<?php

include_once '../data/Noticia.php';
require 'Connection.php';
require 'DBData.php';

class NoticiasDAO{
    
    private $response;
    
    function createNoticia($noticia){
        $bd=Connection::getInstance();
        $sql = "INSERT INTO noticias(titulo,descripcion,imagen,extension) VALUES("
                . "'" . $noticia->getTitulo() . "',"
                . "'" . $noticia->getDescripcion() . "',"
                . "'" .$noticia->getImagen() . "',"
                . "'" .$noticia->getExtension() . "'"
                . ")";
        $stmt=$bd->query($sql);
    }
    
    function countAllNoticias(){
        $bd=Connection::getInstance();
        $query = "SELECT COUNT(*) as noticias FROM noticias";
        $stmt=$bd->query($query);
        $record=$bd->obtener_fila($stmt,0);
        
        if(!$record){
            return 0;
        }
        return $record['noticias'];
    }
    
    function getNoticias($inicio,$TAMANO_PAGINA){
        
        $bd=Connection::getInstance();
        $query = "SELECT * FROM noticias LIMIT " . $inicio . "," . $TAMANO_PAGINA; 
        openlog("myScriptLog", LOG_PID | LOG_PERROR, LOG_LOCAL0);
        syslog(LOG_INFO, $query);
        $result=$bd->query($query);
        if(!$result){
            return null;
        }
        $noticias = array();
        while($row=mysql_fetch_array($result)){
            $noticia = new StdClass();
            $noticia->id = $row['id'];
            $noticia->titulo = $row['titulo'];
            $noticia->descripcion = $row['descripcion'];
            $noticia->imagen = base64_encode($row['imagen']);
            $noticia->extension = $row['extension'];
            array_push($noticias, $noticia);
        } 
    
        return $noticias;
    }
    
    public function getReponse(){
      return $this->response;     
    }
    
    public function deleteNoticia($id){
        $bd=Connection::getInstance();
        $query = "DELETE FROM noticias WHERE id = ". $id;
        $bd->query($query);
    }
}