<?php

class KategorijaController
{

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
        $view->render('oglasi/index',["poruka"=>""]);
    }


}