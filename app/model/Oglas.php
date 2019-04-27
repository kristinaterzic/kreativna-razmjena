<?php

class Oglas{

    public static function pretraziOglaseKorisnika($korisnik)
    {
        $db = Db::getInstance();
        $izraz = $db->prepare("
        
        select  a.sifra,
	            a.pocetnidatum,
                b.korisnickoime as korisnik,
                a.vrsta,
                a.naziv,
                a.tekstponude,
                c.naziv as kategorija
                from oglas a 
                left join korisnik b on a.korisnik =b.sifra
                left join kategorija c on a.kategorija =c.sifra
                where a.korisnik=:korisnik
                order by pocetnidatum DESC
                                   
        ");
        $izraz->execute(["korisnik"=>$korisnik]);
        return $izraz->fetchAll();
    }


    public static function delete($id)
    {
        $db = Db::getInstance();
        $izraz = $db->prepare("delete from oglas where sifra=:sifra");
        $podaci = [];
        $podaci["sifra"]=$id;
        $izraz->execute($podaci);
    }

    // maknila sam korisnik=:korisnik,
    public static function update($id)
    {
        $db = Db::getInstance();
        $izraz = $db->prepare("update oglas set 
        pocetnidatum=:pocetnidatum,
        datumisteka=:datumisteka,
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

        if(Request::post("datumisteka")==""){
            $izraz->bindValue("datumisteka",null,PDO::PARAM_NULL);
        }else{
            $izraz->bindParam("datumisteka",Request::post("datumisteka"),PDO::PARAM_STR);
        }


        if(Request::post("datumisteka")==""){
            $izraz->bindValue("datumisteka",null,PDO::PARAM_NULL);
        }else{
            $izraz->bindParam("datumisteka",Request::post("datumisteka"),PDO::PARAM_STR);
        }
        
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


    public static function add($korisnik)
    {
        $db = Db::getInstance();
        $izraz = $db->prepare("           
            insert into oglas (pocetnidatum,datumisteka,korisnik,vrsta,naziv,tekstponude,kategorija) 
            values (now(),null,:korisnik,'','','',null)
        ");
        $izraz->execute(["korisnik"=>$korisnik]);
        return $db->lastInsertId();
    }
      
        

}



