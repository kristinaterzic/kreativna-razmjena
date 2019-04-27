<?php

class OglasController extends ProtectedController
{
    function prepareadd()
    {
        $view = new View();
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
            $this->index();
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

    function kontrola()
    {
        /* if(Request::post("naziv")===""){
            return "Naziv obavezno";
        }

        if(strlen(Request::post("naziv"))>50){
            return "Naziv ne smije biti veći od 50 znakova";
        }

        if(Request::post("smjer")=="0"){
            return "Obavezno odabir smjera";
        }
 */

        return true;
    }

   

    function prepareedit($id)
    {
        $view = new View();
        $entitet = Oglas::find($id);
        $_POST["pocetnidatum"]=$entitet->pocetnidatum;
        $_POST["korisnik"]=$entitet->korisnik;
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

  

}