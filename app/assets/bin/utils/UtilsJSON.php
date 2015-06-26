<?php

class UtilsJSON {
    
    static $_instance;

    private function __construct(){}

    private function __clone(){}

    private static function getInstance(){
        if (!(self::$_instance instanceof self)){
            self::$_instance = new self();
        }
        return self::$_instance;
    }
    
    static function writeJSON($success,$message,$data){
        $response = new stdClass();
        $response->success = $success;
        $response->message = $message;
        $response->data = $data;
        $json = json_encode($response);
        header('Content-type: application/json');
        exit($json);
    }
    
}
