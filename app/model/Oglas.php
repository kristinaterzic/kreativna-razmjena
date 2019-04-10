<?php

class Oglas{
      
        public static function read(){
        $db = Db::getInstance();
        $izraz = $db->prepare("select naziv,tekstponude from oglas");
        $izraz->execute();
        return $izraz->fetchAll();
        }
    }