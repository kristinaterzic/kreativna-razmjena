<?php

class PocetnaController 
{

    function search()
    {
        $view = new View();
        $view->render(
            'pocetne/rezultat_pretrage', 
            [
            "pretraga" => Pocetna::search()
            ]
        );

    }


    function oglas($stranica=1){
        if($stranica<=0){
            $stranica=1;
        }
        if($stranica===1){
            $prethodna=1;
        }else{
            $prethodna=$stranica-1;
        }
        $sljedeca=$stranica+1;

        $view = new View();
        $view->render(
            'pocetne/oglasi',
            [
            "oglasi"=> Pocetna::svioglasi($stranica),
            "prethodna"=>$prethodna,
            "sljedeca"=>$sljedeca
            ]
        );
    }


    function selekcija($id)
    {
        $view = new View();       
        $view->render(
            'pocetne/index',
                [
                "poruka"=>"",
                "oglasi"=> Pocetna::selekcija($id)
                ]
            );
    }

    function read(){
        $view = new View();
        $view->render(
            'index',
                [              
                "poruka"=>"",                      
                "selekcijaoglasa"=>Pocetna::read()
                ]
            );
    }

   
}