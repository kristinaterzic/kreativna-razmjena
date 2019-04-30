<?php
                       
class Ocjena{
    public static function delete($id)
    {
        $db = Db::getInstance();
        $izraz = $db->prepare("delete from ocjena where sifra=:sifra");
        $podaci = [];
        $podaci["sifra"]=$id;
        $izraz->execute($podaci);
    }
        
    public static function update($id)
    {
        $db = Db::getInstance();
        $izraz = $db->prepare("update ocjena set 
        datumocjene=:datumocjene,
        ocjena=:ocjena,                       
        javljamse_korisnik=:javljamse_korisnik,
        where sifra=:sifra");
        if(Request::post("datumocjene")==""){
            $izraz->bindValue("datumocjene",null,PDO::PARAM_NULL);
        }else{
            $izraz->bindParam("datumocjene",Request::post("datumocjene"),PDO::PARAM_STR);
        }       
        $izraz->bindParam("ocjena",Request::post("ocjena"),PDO::PARAM_INT);
        $izraz->bindParam("javljamse_korisnik",Request::post("javljamse_korisnik"),PDO::PARAM_INT);
        $izraz->bindParam("sifra",$id,PDO::PARAM_INT);
        $izraz->execute();
    }
    public static function trazi($id)
    {
        $db = Db::getInstance();
        $izraz = $db->prepare("select * from ocjena where sifra=:sifra");
        $izraz->execute(["sifra"=>$id]);
        return $izraz->fetch();
    }
    public static function unos($sifraoglasa)
    {
        $db = Db::getInstance();
        $izraz = $db->prepare("           
            insert into ocjena (datumocjene,ocjena,oglas,javljamse_korisnik) 
            values (now(),'',:oglas,javljamse_korisnik)
        ");
        $izraz->execute(["oglas"=>$sifraoglasa]);
        return $db->lastInsertId();
    }
    public static function find()
    {
        $db = Db::getInstance();
        $izraz = $db->prepare("
        select 	a.sifra,
		        a.datumocjene,
                a.ocjena,
                b.korisnickoime,
                c.sifra as IDoglasa,
                concat(c.naziv, '; ',c.tekstponude) as sadrzajOglasa,
                count(a.ocjena) as brojocjena
                from ocjena a
                left join korisnik b on a.javljamse_korisnik =b.sifra
                left join oglas c on a.oglas =c.sifra        
                group by a.sifra,a.datumocjene,a.ocjena,b.korisnickoime,c.sifra,concat(c.naziv, '; ',c.tekstponude)
                ");
                $izraz->execute();
                return $izraz->fetchAll();
    
    
        }
    
    }