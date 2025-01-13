
<!DOCTYPE html>
<html lang="fr">
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
<body>
    <nav>
    </nav>
    
    <?php 
        require_once("../module/_header.php");
        require_once("../module/_nav.php");
    ?>

    <main>
        <div id="book-table">
            <div id="head-line">
                <div class="title">Titre</div>
                <div class="author">Auteur</div>
                <div class="genre">Genre</div>
                <div class="date">Date</div>
                <div class="link"></div>
            </div>
            <?php 
                foreach($bookList AS $book) {
                    ?>
                        <div class="book-line">
                            <div class="title"> <?= $book["titre"] ?> </div>
                            <div class="author"> <?= $book["Auteur"] ?> </div>
                            <div class="genre"> <?= $book["Genre"] ?> </div>
                            <div class="date"> <?= $book["Date"] ?> </div>
                            <div class="linkSQL"> 1 </div>
                        </div>
                    <?php
                }
            ?>
        </div>
    </main>
</body>
</html>