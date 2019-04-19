<?php
class KategorijaController
{
    
    function selekcija($id)
    {
        $view = new View();
        $naziv = Kategorija::selekcija($id);
        $_POST["pocetnidatum"]=$naziv->pocetnidatum;
        $_POST["korisnik"]=$naziv->korisnik;
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