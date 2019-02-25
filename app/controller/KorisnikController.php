<?php

class KorisnikController
{

    public function __construct()
    {
        if(!Session::getInstance()->isLogiran()){
            $view = new View();
            $view->render('index',["poruka"=>"Nemate ovlasti"]);
            exit;
        }
    }

    function add()
    {
        
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
       
        if(Request::post("ime")===""){
            return "Ime je obavezno.";
        }

        if(Request::post("prezime")===""){
            return "Prezime je obavezno";
        }

        if(Request::post("telefon")===""){
            return "Telefon je obavezan.";
        }

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