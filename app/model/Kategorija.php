<?php

class Kategorija{
      
    public static function read1(){
    $db = Db::getInstance();
    $izraz = $db->prepare("select naziv,ikona from kategorija where sifra <=6");
    $izraz->execute();
    return $izraz->fetchAll();
    }

    public static function read2(){
    $db = Db::getInstance();
    $izraz = $db->prepare("select naziv,ikona from kategorija where sifra >6");
    $izraz->execute();
    return $izraz->fetchAll();
    }

}    