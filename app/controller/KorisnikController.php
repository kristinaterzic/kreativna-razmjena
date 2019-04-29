<?php

class KorisnikController extends ProtectedController
{
 
    function add()
    {
        $datoteka = APP::config("path") . "public/img/korisnici/" . $id . ".png"; 
        move_uploaded_file($_FILES["slika"]["tmp_name"],$datoteka);
        $kontrola = $this->kontrola();
        if($kontrola===true){
            Korisnik::add();
            $this->index();
        }else{
            $view = new View();
            $view->render(
                'korisnici/new',
                [
                "poruka"=>$kontrola
                ]
            );
        }

    }

    
    function edit($id)
    {
        $_POST["sifra"]=$id;
         //echo __DIR__;
         $datoteka = APP::config("path") . "public/img/korisnici/" . $id . ".png"; 
         move_uploaded_file($_FILES["slika"]["tmp_name"],$datoteka);
        // print_r($_FILES);
        $kontrola = $this->kontrola();
        if($kontrola===true){
            Korisnik::update($id);
            $this->index();
        }else{
            $view = new View();
            $view->render(
                'korisnici/edit',
                [
                "poruka"=>$kontrola
                ]
            );
        }

    }

    function delete($id)
    {
            Korisnik::delete($id);
            $this->index();
    }

    function kontrola()
    {
        if(Request::post("korisnickoime")===""){
            return "Korisničko ime je obavezno";
        }

        if(strlen(Request::post("korisnickoime"))>20){
            return "Korisničko ime ne smije imati više od 20 znakova";
        }

        $db = Db::getInstance();
        $izraz = $db->prepare("select count(sifra) from korisnik where korisnickoime=:korisnickoime and sifra<>:sifra");
        $izraz->execute(["korisnickoime"=>Request::post("korisnickoime"), "sifra" => Request::post("sifra")]);
        $ukupno = $izraz->fetchColumn();
        if($ukupno>0){
            return "Korisničko ime postoji, odaberite drugo korisničko ime.";
        }
            
        if(!Utillity::checkOib(Request::post("oib"))){
            return "OIB nije u dobrom formatu";
        }
        return true;
    
            
        /* if(Request::post("ime")===""){
            return "Ime je obavezno.";
        }

        if(Request::post("prezime")===""){
            return "Prezime je obavezno";
        }

        if(Request::post("telefon")===""){
            return "Telefon je obavezan.";
        } */

        if(Request::post("lozinka")===""){
            return "Lozinka je obavezna.";
        }

        /* if(strlen(Request::post("lozinka"))<8){
            return "Lozinka mora imati minimalno 8 znakova.";
        } */

        return true;
    }

    function prepareadd()
    {
        $view = new View();
        $view->render(
            'korisnici/new',
            [
            "poruka"=>""
            ]
        );
    }

    function prepareedit($id)
    {
        $view = new View();
        $korisnik = Korisnik::find($id);
        $_POST["korisnickoime"]=$korisnik->korisnickoime;
        $_POST["ime"]=$korisnik->ime;
        $_POST["prezime"]=$korisnik->prezime;
        $_POST["email"]=$korisnik->email;
        $_POST["telefon"]=$korisnik->telefon;
        $_POST["lozinka"]=$korisnik->lozinka;
        $_POST["oib"]=$korisnik->oib;
        $_POST["datumrodenja"]=$korisnik->datumrodenja;
        $_POST["omeni"]=$korisnik->omeni;
        $_POST["profilnaslika"]=$korisnik->profilnaslika;
        $_POST["sifra"]=$korisnik->sifra;

        $view->render(
            'korisnici/edit',
            [
            "poruka"=>""
            ]
        );
    }

    function index(){
        $view = new View();
        $view->render(
            'korisnici/index',
            [
            "korisnici"=>Korisnik::read()
            ]
        );
    }
}