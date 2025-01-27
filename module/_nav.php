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


<nav>
    <?php
        foreach($navButtons as $button) {
            ?>
                <a href=<?= $button["path"] ?> class="link"><?= $button["label"] ?></a>
            <?php
        }
    ?>
    <!--
    <a href="../controller/homeController.php" class="bouton">Accueil</a>
    <a href="../controller/libraryController.php" class="bouton">Bibliothèque</a>
    <a href="../controller/gameController.php" class="bouton">Espace détente</a>
    <a href="../controller/usController.php" class="bouton">Qui sommes-nous</a>
    -->
</nav>