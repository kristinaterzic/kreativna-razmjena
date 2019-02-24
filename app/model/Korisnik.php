<?php

class Korisnik{

    public static function read(){
        $db = Db::getInstance();
        //$izraz = $db->prepare("select * from korisnik");
        $izraz = $db->prepare("select korisnickoime, ime, prezime, email, telefon from korisnik");
        $izraz->execute();
        return $izraz->fetchAll();
        
    }

    public static function find($id){
        $db = Db::getInstance();
        $izraz = $db->prepare("select * from korisnik where sifra=:sifra");
        $izraz->execute(["sifra"=>$id]);
        return $izraz->fetch();
    }


}