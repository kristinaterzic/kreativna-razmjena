<?php
class KategorijaController
{
    function delete($id)
    {       
            Kategorija::delete($id);
            $this->izlistaj();
    }


    function edit($id)
    {
        $_POST["sifra"]=$id;
        $kontrola = $this->kontrola();
        if($kontrola===true){
            Kategorija::update($id);
            $this->izlistaj();
        }else{
            $view = new View();
            $view->render(
                'kategorije/edit',
                [
                "poruka"=>$kontrola
                ]
            );
        }

    }

    function kontrola()
    {
        if(Request::post("naziv")===""){
            return "Obavezno unesite ime kategorije.";
        }

        if(strlen(Request::post("naziv"))>100){
            return "Kategorija ne smije imati više od 100 znakova.";
        }

        $db = Db::getInstance();
        $izraz = $db->prepare("select count(sifra) from kategorija where naziv=:naziv and sifra<>:sifra");
        $izraz->execute(["naziv"=>Request::post("naziv"), "sifra" => Request::post("sifra")]);
        $ukupno = $izraz->fetchColumn();
        if($ukupno>0){
            return "Kategorija već postoji.";
        }
       
        return true;
    }


    function prepareedit($id)
    {
        $view = new View();
        $kategorija = Kategorija::find($id);
        $_POST["naziv"]=$kategorija->naziv;
        $_POST["ikona"]=$kategorija->ikona;
        $_POST["sifra"]=$kategorija->sifra;
        $view->render(
            'kategorije/edit',
            [
            "poruka"=>""
            ]
        );
    }

    function izlistaj(){
        $view = new View();
        $view->render(   
            'kategorije/read',
                [
                "izlistaj"=>Kategorija::read()
                ]
            );
    }  

    function selekcija($id)
    {
        $view = new View();
        $naziv = Kategorija::selekcija($id);
        $_POST["pocetnidatum"]=$naziv->pocetnidatum;
        $_POST["korisnik"]=$naziv->korisnik;
        $_POST["telefon"]=$naziv->telefon;
        $_POST["email"]=$naziv->email;
        $_POST["vrsta"]=$naziv->vrsta;
        $_POST["naziv"]=$naziv->naziv;
        $_POST["tekstponude"]=$naziv->tekstponude;
        $_POST["kategorija"]=$naziv->kategorija;
        $_POST["sifra"]=$naziv->sifra;
        $view->render(
            'kategorije/index',
                [
                "poruka"=>""
                ]
            );
    }


   /*  function selekcija()
    {
        
        $view = new View();
        $view->render(   
            'kategorije/index',
                [
                "kategorije"=>Kategorija::selekcija()
                ]
            );
    } */

    
    function read(){
        $view = new View();
        $view->render(
            'index',
                [
                "index"=>Kategorija::read()
                ]
            );
    }
    function index(){
        $view = new View();
        $view->render('kategorije/index',["poruka"=>""]);
    }

    


}