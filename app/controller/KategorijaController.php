<?php

class KategorijaController
{

    function read1(){
        $view = new View();
        $view->render(
            'index',
                [
                "index"=>Kategorija::read1()
                ]
            );
    }

    function read2(){
        $view = new View();
        $view->render(
            'index',
                [
                "index"=>Kategorija::read2()
                ]
            );
    }

    function index(){
        $view = new View();
        $view->render('oglasi/index',["poruka"=>""]);
    }


}