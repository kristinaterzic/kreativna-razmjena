<?php

class Registracija{
    public static function add()
    {
        $db = Db::getInstance();
        $izraz = $db->prepare("insert into korisnik (korisnickoime,email,lozinka)
        values (:korisnickoime,:email,:lozinka)");
        $izraz->execute(self::podaci());
    }

    private static function podaci(){
        return [
            "korisnickoime"=>Request::post("korisnickoime"),
            "email"=>Request::post("email"),
            "lozinka"=>password_hash(Request::post("lozinka"),PASSWORD_BCRYPT),
        ];
    }

}    