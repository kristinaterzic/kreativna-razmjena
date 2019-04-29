<?php

class Profil{

    public static function read($id){
        $db = Db::getInstance();       
        $izraz = $db->prepare
        ("
                select * from korisnik where sifra=:sifra                   
        ");

        
        $izraz->execute(["sifra"=>$id]);
        return $izraz->fetch();
        
    }
}    