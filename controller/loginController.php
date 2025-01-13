<?php

    session_start();

    $message = "";

    require_once('../model/Model.php');

    //var_dump($_POST);

    $email = htmlspecialchars($_POST["email"]);
    $password = htmlspecialchars($_POST["password"]);

    if($email == null || $password == null) {
        $message = "Information manquante";
        //header("location: ../controller/homeController.php");
    } else {
        $db = new Model();

        $user = $db->getUserByEmail($email);

        if(!$user) {
            $message = "Gros le compte existe pas";
        } else if($password != $user["password"]) {
            $message = "Mot de passe incorrect";
        } else {
            $_SESSION["id"] = $user["id"];
            $_SESSION["pseudo"] = $user["pseudo"];

            header("location: ../controller/homeController.php?message=$message");    
        }
    }

    if($message != "") {
        header("location: ../controller/homeController.php?message=$message");
        
    }

    //var_dump($user);

