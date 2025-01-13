<?php 

class Model {

    private PDO $db;

    public function __construct()
    {
        try {
            $this->db = new PDO('mysql:host=localhost:3306;dbname=Livre_E2C;charset=utf8', 'enzo_master', '123456789');
        }catch(Exception $e) {
            echo('Problème de connexion : ' .$e->getMessage());
        }
    }

    public function getUserByEmail(string $email) {
        $sqlQuery = "SELECT id, pseudo, password FROM Users WHERE email = :email";
        $statement = $this->db->prepare($sqlQuery);
        $statement->execute([
            'email' => $email
        ]);
        $req = $statement->fetch(); //ou fetchAll()

        return $req;
    }
}