<?php
class Pocetna{

    public static function search()
    {
        $db=Db::getInstance();
        if (isset($_POST['search'])){
            $searchq = $_POST['search'];
            $searchq = preg_replace("#[^0-9a-z]#i","",$searchq);

            $expression = $db->prepare("                         
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
                where a.naziv like '%$searchq%'
                or a.tekstponude like '%$searchq%'
            ")
                or die("Could not search");
            $expression->execute();
            $count = $expression->rowCount();
            if ($count == 0){
                return "Nema rezultata!";
            }else{
                return $expression->fetchAll();
                }
            }

        }

    public static function svioglasi($stranica=1){

        $poStranici=5;
        $db = Db::getInstance();
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
                order by pocetnidatum DESC                   
                limit " . (($stranica*$poStranici) - $poStranici)  . ",$poStranici
        ");
        $izraz->execute(); 
        return $izraz->fetchAll();
        }

    public static function read(){
    $db = Db::getInstance();
    $izraz = $db->prepare 
        ("   
            select
          	        a.sifra,
                    a.naziv,
                    a.ikona,
                    count(b.kategorija) as ukupno
                    from kategorija a
                    left join oglas b on a.sifra =b.kategorija
                    group by
                    a.sifra,
                    a.naziv,
                    a.ikona;
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