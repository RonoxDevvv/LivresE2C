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
        <div>
            <label for="number1"></label> Premier nombre <input type="number" name="number1" id="number1">
        </div>
        <div>
            <label for="number2"></label> Deuxième nombre <input type="number" name="number2" id="number2">    
        </div>
        <div>
            <input type="submit" value="Valider" id="Valid">
        </div>
        <p id="Result"></p>
    </main>
</body>
</html>