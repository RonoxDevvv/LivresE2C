<?php 
    
    session_start();

    require_once('../model/Model.php');

    $db = new Model();
    $bookList = $db->getAllBooks();

    //var_dump($bookList);

    //$username=$_POST["username"];
    $navButtons = 
    [
        [
            "label" => "Accueil",
            "path" => "../controller/homeController.php"
        ],
        [
            "label" => "Bibliothèque",
            "path" => "../controller/libraryController.php"
        ],
        [
            "label" => "Espace détente",
            "path" => "../controller/gameController.php"
        ],
        [
            "label" => "Qui sommes nous?",
            "path" => "../controller/usController.php"
        ],
    ];   

    if(isset($_SESSION["id"])) {
        $navButtons[]= [
            "label" => "Mon compte",
            "path" => "../controller/accountController.php"
        ];
    }

    $title = "Projet Silence, on lit! - E2C Lille";
    require_once("../view/libraryView.php");
?>
