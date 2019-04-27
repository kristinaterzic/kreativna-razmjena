<?php

class OglasController extends ProtectedController
{
    function delete($id)
    {
            Oglas::delete($id);
            $this->index();
    }

    function brisanje($id)
    {
            Oglas::delete($id);
            $this->obrisano();
    }

    function prepareadd($korisnik)
    {
        $this->prepareedit(Oglas::add($korisnik));        
    }
   

    function oglasKorisnik($korisnik)
    {
        $view = new View();
        $view->render(
            'oglasi/moji',
            [
            "poruka"=>"",
            "moji"=> Oglas::pretraziOglaseKorisnika($korisnik)
            ]
        );
    }

    function promijeni($id)
    {
        $view = new View();
        $entitet = Oglas::find($id);
        $_POST["pocetnidatum"]=$entitet->pocetnidatum;
        $_POST["datumisteka"]=$entitet->datumisteka;
       // $_POST["korisnik"]=$entitet->korisnik;
        $_POST["vrsta"]=$entitet->vrsta;
        $_POST["naziv"]=$entitet->naziv;
        $_POST["tekstponude"]=$entitet->tekstponude;
        $_POST["kategorija"]=$entitet->kategorija;
        $_POST["sifra"]=$entitet->sifra;

        $view->render(
            'oglasi/edit',
            [
            "poruka"=>""
            ]
        );
    }


    function prepareedit($id)
    {
        $view = new View();
        $entitet = Oglas::find($id);
        $_POST["pocetnidatum"]=$entitet->pocetnidatum;
        $_POST["datumisteka"]=$entitet->datumisteka;
       // $_POST["korisnik"]=$entitet->korisnik;
        $_POST["vrsta"]=$entitet->vrsta;
        $_POST["naziv"]=$entitet->naziv;
        $_POST["tekstponude"]=$entitet->tekstponude;
        $_POST["kategorija"]=$entitet->kategorija;
        $_POST["sifra"]=$entitet->sifra;

        $view->render(
            'oglasi/new',
            [
            "poruka"=>""
            ]
        );
    }
  
    function edit($id)
    {
        
        $_POST["sifra"]=$id;
        $kontrola = $this->kontrola();
        if($kontrola===true){
            Oglas::update($id);
            $this->uspjeh();           
        }else{
            $view = new View();
            $view->render(
                'oglasi/edit',
                [
                "poruka"=>$kontrola
                ]
            );
        }
    }
  
    function new($id)
    {
        
        $_POST["sifra"]=$id;
        $kontrola = $this->kontrola();
        if($kontrola===true){
            Oglas::update($id);
            $this->uspjeh();           
        }else{
            $view = new View();
            $view->render(
                'oglasi/new',
                [
                "poruka"=>$kontrola
                ]
            );
        }
    }

    function kontrola()
    {
        if(Request::post("kategorija")=="0"){
            return "Obavezno odaberite kategoriju oglasa.";
        }

        if(Request::post("vrsta")=="0"){
            return "Obavezno odaberite vrstu oglasa.";
        }

        if(Request::post("naziv")===""){
            return "Naslov oglasa je obavezan.";
        }

        if(strlen(Request::post("naziv"))>100){
            return "Naslov ne smije biti veći od 100 znakova";
        }

        if(Request::post("tekstponude")===""){
            return "Tekst oglasa je obavezan.";
        }
        
        if(strlen(Request::post("tekstponude"))>255){
            return "Tekst oglasa ne smije biti veći od 255 znakova";
        }

        return true;
    }

    function index()
    {
        $view = new View();
        $view->render(
            'index',
            [
            "poruka"=>""
            ]
        );
    }

    function uspjeh()
    {
        $view = new View();
        $view->render(
            'oglasi/uspjeh',
            [
            "poruka"=>""
            ]
        );
    }

    function obrisano()
    {
        $view = new View();
        $view->render(
            'oglasi/obrisano',
            [
            "poruka"=>""
            ]
        );
    }

  

}