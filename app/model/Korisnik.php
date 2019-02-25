<?php

class Korisnik{

    public static function read(){
        $db = Db::getInstance();
        //$izraz = $db->prepare("select * from korisnik");
        $izraz = $db->prepare
        //("select korisnickoime,ime,prezime,email,telefon from korisnik order by korisnickoime");
        ("
                select 
                a.sifra,
                a.korisnickoime,
                a.ime,
                a.prezime,
                a.email,
                a.telefon,
                count(b.sifra) as ukupno from 
                korisnik a left join oglas b on a.sifra=b.korisnik
                group by 
                a.sifra,
                a.korisnickoime,
                a.ime,
                a.prezime,
                a.email,
                a.telefon
                order by a.korisnickoime

        ");

        
        $izraz->execute();
        return $izraz->fetchAll();
        
    }

    public static function find($id){
        $db = Db::getInstance();
        $izraz = $db->prepare("select * from korisnik where sifra=:sifra");
        $izraz->execute(["sifra"=>$id]);
        return $izraz->fetch();
    }
    public static function add()
    {
        $db = Db::getInstance();
        $izraz = $db->prepare("insert into korisnik (korisnickoime,ime,prezime,email,telefon)
        values (:korisnickoime,:ime,:prezime,:email,:telefon)");
        $izraz->execute(self::podaci());
    }

    public static function update($id)
    {
        $db = Db::getInstance();
        $izraz = $db->prepare("update korisnik set 
        korisnickoime=:korisnickoime,
        ime=:ime,
        prezime=:prezime,
        email=:email,
        telefon=:telefon
        where sifra=:sifra");
        $podaci = self::podaci();
        $podaci["sifra"]=$id;
        $izraz->execute($podaci);
    }

    public static function delete($id)
    {
        $db = Db::getInstance();
        $izraz = $db->prepare("delete from korisnik where sifra=:sifra");
        $podaci = [];
        $podaci["sifra"]=$id;
        $izraz->execute($podaci);
    }

    private static function podaci(){
        return [
            "korisnickoime"=>Request::post("korisnickoime"),
            "ime"=>Request::post("ime"),
            "prezime"=>Request::post("prezime"),
            "email"=>Request::post("email"),
            "telefon"=>Request::post("telefon")
        ];
    }

}