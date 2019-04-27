<?php

class PocetnaController 
{
    function oglas()
    {
        $view = new View();
        $view->render(
            'pocetne/oglasi',
            [
            "poruka"=>""
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