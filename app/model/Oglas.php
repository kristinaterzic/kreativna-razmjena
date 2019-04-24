<?php

class Oglas{

        public static function add()
    {
        $db = Db::getInstance();
        $izraz = $db->prepare("insert into oglas (korisnik,vrsta,naziv,tekstponude,kategorija)
        values (:korisnik,:vrsta,:naziv,:tekstponude,:kategorija)");
        $izraz->execute(self::podaci());
    }
      
        public static function read(){
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
                order by pocetnidatum DESC                   
                
        ");
        $izraz->execute();
                //echo is_array($izraz) ? 'Array' : 'not an Array';
                //echo "<br />";
                //echo is_object($izraz) ? 'object' : 'not an object';   
        return $izraz->fetchAll();
        }

        private static function podaci(){
                return [
                    "korisnik"=>Request::post("korisnik"),
                    "vrsta"=>Request::post("vrsta"),
                    "naziv"=>Request::post("naziv"),
                    "tekstponude"=>Request::post("tekstponude"),
                    "kategorija"=>Request::post("kategorija")
                ];
            }
    }