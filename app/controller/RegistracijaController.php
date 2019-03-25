<?php

class RegistracijaController{
    
    function index(){        
        $view = new View();
        $view->render('registracija/new',["poruka"=>"Uspješno ste se registrirali!"]);

    }

    function add()
    {
        
        $kontrola = $this->kontrola();
        if($kontrola===true){
            Registracija::add();
            $this->index();
        }else{
            $view = new View();
            $view->render(
                'registracija/new',
                [
                "poruka"=>$kontrola
                ]
            );
        }
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

            
        if(Request::post("email")===""){
            return "Email je obavezan.";
        }

        if(Request::post("lozinka")===""){
            return "Lozinka je obavezna.";
        }

        if(strlen(Request::post("lozinka"))<8){
            return "Lozinka mora imati minimalno 8 znakova.";
        }

        return true;
    }

}