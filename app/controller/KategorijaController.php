<?php

class KategorijaController
{
    function selekcija(){
        $view = new View();
        $view->render(
            'kategorije/index',
                [
                "kategorije"=>Kategorija::selekcija()
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