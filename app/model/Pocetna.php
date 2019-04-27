<?php
class Pocetna{

    public static function svioglasi(){
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
        return $izraz->fetchAll();
        }

    public static function read(){
    $db = Db::getInstance();
    $izraz = $db->prepare 
        ("   
        select sifra,naziv,ikona from kategorija
        ");
    $izraz->execute();
    return $izraz->fetchAll();
    }
 

    public static function selekcija($id)
    {
        $db=Db::getInstance();
        $izraz = $db->prepare("
        select  a.sifra,
	            a.pocetnidatum,
                b.korisnickoime as korisnik,
                b.telefon,
                b.email,
                a.vrsta,
                a.naziv,
                a.tekstponude,
                c.naziv as kategorija                
                from oglas a 
                left join korisnik b on a.korisnik =b.sifra
                left join kategorija c on a.kategorija =c.sifra
                where c.sifra=:sifra
                order by pocetnidatum DESC                           
        
        ");                                
       
        $izraz->execute(["sifra"=>$id]);            
        return $izraz->fetchAll();        
       
       
        
    } 
        
    

}