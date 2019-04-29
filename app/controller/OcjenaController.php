<?php

class OcjenaController extends ProtectedController
{

    function delete($id)
    {
            Ocjena::delete($id);
            $this->index();
    }


    function index(){
        
    $view = new View();    
    $view->render(
        'ocjene/index',
        [
        "ocjena"=>Ocjena::find()
        ]);

    }
 

    function unos($sifraoglasa)
    {    
        $this->prepareedit(Ocjena::unos($sifraoglasa));
    }

    
    function prepareedit($id)
    {
        $view = new View();
        $entitet = Ocjena::trazi($id);
        $_POST["datumocjene"]=$entitet->datumocjene;
        $_POST["ocjena"]=$entitet->ocjena;
       // $_POST["oglas"]=$entitet->oglas;
        $_POST["javljamse_korisnik"]=$entitet->javljamse_korisnik;        
        $_POST["sifra"]=$entitet->sifra;

        $view->render(
            'ocjene/nova',
            [
            "poruka"=>""
            ]
        );
    }

    function novaocjena($id)
    {
        
        $_POST["sifra"]=$id;
        $kontrola = $this->kontrola();
        if($kontrola===true){
            Ocjena::update($id);
            $this->uspjeh();           
        }else{
            $view = new View();
            $view->render(
                'ocjene/nova',
                [
                "poruka"=>$kontrola
                ]
            );
        }
    }
    function kontrola()
    {       
        if(Request::post("ocjena")=="0"){
            return "Obavezno odaberite broj ocjene.";
        }
        
        return true;
    }

    function uspjeh()
    {
        $view = new View();
        $view->render(
            'ocjene/uspjeh',
            [
            "poruka"=>""
            ]
        );
    }

}
