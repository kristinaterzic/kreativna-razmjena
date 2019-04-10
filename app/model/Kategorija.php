<?php

class Kategorija{
      
    public static function read(){
    $db = Db::getInstance();
    $izraz = $db->prepare("select naziv,ikona from kategorija");
    $izraz->execute();
    return $izraz->fetchAll();
    }

}    