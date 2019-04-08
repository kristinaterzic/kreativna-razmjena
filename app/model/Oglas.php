<?php

class Oglas{
      
    public static function read(){
        $db = Db::getInstance();
        $izraz = $db->prepare("select naziv from oglas where sifra =1");
        $izraz->execute();
        return $izraz->fetchAll();
        }





    /* public static function read1(){
    $db = Db::getInstance();
    $izraz = $db->prepare("select naziv from kategorija where sifra <=6");
    $izraz->execute();
    return $izraz->fetchAll();
    }

    public static function read2(){
    $db = Db::getInstance();
    $izraz = $db->prepare("select naziv from kategorija where sifra >6");
    $izraz->execute();
    return $izraz->fetchAll();
    }

    public static function read3(){
    $db = Db::getInstance();
    $izraz = $db->prepare("select ikona from kategorija where sifra <=6");
    $izraz->execute();
    return $izraz->fetchAll();
    }

    public static function read4(){
    $db = Db::getInstance();
    $izraz = $db->prepare("select ikona from kategorija where sifra >6");
    $izraz->execute();
    return $izraz->fetchAll();
    } */

}