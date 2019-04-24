<?php
class Kategorija{

    public static function delete($id)
    {
        $db = Db::getInstance();
        $izraz = $db->prepare("delete from kategorija where sifra=:sifra");
        $podaci = [];
        $podaci["sifra"]=$id;
        $izraz->execute($podaci);
    }


    public static function update($id)
    {
        $db = Db::getInstance();
        $izraz = $db->prepare("update kategorija set 
        naziv=:naziv,
        ikona=:ikona
        where sifra=:sifra");
        $podaci = self::podaci();
        $podaci["sifra"]=$id;
        $izraz->execute($podaci);

    }
    
    public static function find($id){
        $db = Db::getInstance();
        $izraz = $db->prepare("select * from kategorija where sifra=:sifra");
        $izraz->execute(["sifra"=>$id]);
        return $izraz->fetch();
    }

    public static function read(){
    $db = Db::getInstance();
    $izraz = $db->prepare //select sifra,naziv,ikona from kategorija
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
        
        ");                                
        
        $izraz->execute(["sifra"=>$id]);
        return $izraz->fetch();
        
    } //kad stavim fetchAll
        
    

    public static function podaci(){
        return [            
            "naziv"=>Request::post("naziv"),
            "ikona"=>Request::post("ikona")
        ];
    }

}