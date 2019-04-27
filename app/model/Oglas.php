<?php

class Oglas{

    public static function update($id)
    {
        $db = Db::getInstance();
        $izraz = $db->prepare("update oglas set 
        pocetnidatum=:pocetnidatum,
        korisnik=:korisnik,
        vrsta=:vrsta,
        naziv=:naziv,
        tekstponude=:tekstponude,
        kategorija=:kategorija
        where sifra=:sifra");
        
        if(Request::post("pocetnidatum")==""){
            $izraz->bindValue("pocetnidatum",null,PDO::PARAM_NULL);
        }else{
            $izraz->bindParam("pocetnidatum",Request::post("pocetnidatum"),PDO::PARAM_STR);
        }
        $izraz->bindParam("korisnik",Request::post("korisnik"),PDO::PARAM_INT);
        $izraz->bindParam("vrsta",Request::post("vrsta"),PDO::PARAM_STR);
        $izraz->bindParam("naziv",Request::post("naziv"),PDO::PARAM_STR);
        $izraz->bindParam("tekstponude",Request::post("tekstponude"),PDO::PARAM_STR);     
        $izraz->bindParam("kategorija",Request::post("kategorija"),PDO::PARAM_INT);
        $izraz->bindParam("sifra",$id,PDO::PARAM_INT);

        $izraz->execute();
    }


    public static function find($id)
    {
        $db = Db::getInstance();
        $izraz = $db->prepare("select * from oglas where sifra=:sifra");
        $izraz->execute(["sifra"=>$id]);
        return $izraz->fetch();
    }


    public static function add()
    {
        $db = Db::getInstance();
        $izraz = $db->prepare("insert into oglas (pocetnidatum,korisnik,vrsta,naziv,tekstponude,kategorija) 
        values (:pocetnidatum,:korisnik,:vrsta,:naziv,:tekstponude,:kategorija)");
        $izraz->execute();
        return $db->lastInsertId();
    }
      
        

}