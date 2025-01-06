<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../style/style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@200..700&display=swap" rel="stylesheet">
    <script type="module" src="../script/script.js"></script>
    <script type="module" src="../script/nav.js"></script>
    <title>Projet "Silence, on lit!" - E2C Lille</title>
</head>

<?php 
    $title = "Silence, on lit !"
?>


<header>
        <div id="NavBar">
            <div id="Logo">
                <img src="../asset/logo.png" alt="Logo">
            </div>
            <h1 id="Titre"> <?= $title ?> </h1>
            <!-- Le carré noir qui va se transformer en menu -->
            <div id="NavLinks">
                <div id="ExpandButton"></div> <!-- Carré noir initial -->
                <!-- Les liens de navigation, cachés au début -->
                <a href="../controller/homeController.php" class="link">Accueil</a>
                <a href="../controller/libraryController.php" class="link">Bibliothèque</a>
                <a href="../controller/gameController.php" class="link">Espace détente</a>
                <a href="../controller/usController.php" class="link">Qui sommes-nous</a>
            </div>                      
        </div>
</header>