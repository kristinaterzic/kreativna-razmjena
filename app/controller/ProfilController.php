<?php

class ProfilController extends ProtectedController
{
    function index($id){
        $view = new View();
        $view->render(
            'profili/index',
            [
            "profili"=>Profil::read($id)
            ]
        );
    }




}