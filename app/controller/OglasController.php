<?php

class OglasController
{

    function index(){
        $view = new View();
        $view->render('oglasi/index',["poruka"=>""]);
    }

}