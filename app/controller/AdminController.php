<?php

class AdminController
{
    function prijava()
    {
        $view = new View();
        $view->render('prijava',["poruka"=>""]);
    }

    function login()
    {
        //nedostaje konkretan login

        $db=Db::getInstance();
        $izraz = $db->prepare("select ime,prezime,email,lozinka from korisnik where email=:email");
        $izraz->execute(["email"=>Request::post("email")]);

        $view = new View();

        if($izraz->rowCount()>0){
            $red=$izraz->fetch();
            if(password_verify(Request::post("password"),$red->lozinka)){
                $user = new stdClass();                
                $user->ime=$red->ime;
                $user->prezime=$red->prezime;
                $user->email=$red->email;
                $user->imePrezime=$red->ime . " " . $red->prezime;

                Session::getInstance()->login($user);

                
               // $view->render('nadzornaPloca',["poruka"=>"Usmješno prijavljen"]);
               /* $npc = new NadzornaPlocaController();
               $npc->index(); */

                $view->render('index',["poruka"=>"Uspješno ste se prijavili"]);
            }else{
                $view->render('prijava',["poruka"=>"Kombinacija email i lozinka ne odgovaraju"]);
            }
        }else{
            $view->render('prijava',["poruka"=>"Nepostojeći email"]);
        }

                
    }

    function odjava()
    {

        Session::getInstance()->odjava();
        $view = new View();
        $view->render('index',["poruka"=>"Odjavljeni ste."]);
    }


    
    // guidelines za register
 /*    function register(){
        $password = Request::post("password");
        $email = Request::post("email");
        $ime = Request::post("ime");
        $prezime = Request::post("prezime");

        // validacija
        if($password == null || $email == null || $ime == null || $prezime == null)
            return 0;

        $password = password_hash($password,PASSWORD_BCRYPT); // hashing

        $db=Db::getInstance();
        $izraz = $db->prepare("insert into operater (lozinka,ime,prezime,email)
         values ($password,$ime,$prezime,$email)");
        $izraz->execute();

    } */
}