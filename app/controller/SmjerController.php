<?php

class SmjerController{

    public function __construct(){
        if(!Session::getInstance()->isLogiran()){
            $view = new View();
            $view->render('index',["poruka"=>"Nemate ovlasti"]);
            exit;
        }
    }

    function edit($id){
        $view = new View();
        $view->render(
            'smjerovi/edit',
            [
            "smjer"=>Smjer::find($id)
            ]
        );
    }


    function index(){
        $view = new View();
        $view->render(
            'smjerovi/index',
            [
            "smjerovi"=>Smjer::read()
            ]
        );
    }
}