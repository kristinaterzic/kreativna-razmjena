<?php
class Kategorija{

    public static function add()
    {
        $db = Db::getInstance();
        $izraz = $db->prepare("insert into kategorija (naziv,ikona) 
        values (:naziv,:ikona)");
        $izraz->execute(self::podaci());
    }


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
         

    public static function podaci(){
        return [            
            "naziv"=>Request::post("naziv"),
            "ikona"=>Request::post("ikona")
        ];
    }

}