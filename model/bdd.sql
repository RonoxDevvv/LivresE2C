/* Connection à mySQL avec le Terminal*/

sudo mysql

/* Exit mySQL */

exit 

/* Commande de base */

show databases; /* La liste de db sur le serveur */
create database Livre_E2C; /* Créer une db */
use Livre_E2C /* Utilise une db */

/* Gestion de compte */

create user 'Livre_E2C_admin'@'localhost' identified by "123456789"; /*  enzo_master */
grant all privileges on Livre_E2C.* to 'Livre_E2C_admin'@'localhost';

/* Se connecter à mySQL avec un compte utilisateur spécifique */

mysql -h localhost -u Livre_E2C_admin -p

/* Créer une table */

CREATE TABLE IF NOT EXISTS Users (
    id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    pseudo VARCHAR(50) NOT NULL,
    password VARCHAR(30) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    telephone CHAR(10),
    site VARCHAR(30) NOT NULL,
    PRIMARY KEY (id)
) ENGINE=InnoDB;

/* Voir table et détail des tables */

show tables;
describe Users;

/* Ajouter une colonne */

alter table Users 
add [Nom] VARCHAR(30) NOT NULL;

/* Ajouter des données */

insert into Users(prenom, nom, pseudo, password, email, site)
values ('Enzo', 'Lenglart', 'RonoxDev', '123456789', 'enzolenglart07072007@gmail.com', 'Lille'),
       ('Amando', 'Ruiz', 'AR', 'vivementlePHP', 'ar@e2c.fr', 'Lille'),
       ('Olivier','Bucker','Misterbear','MotDePasse','mail','Roubaix');

/* Lire toutes les données dans une table */

select * from Users;
select prenom, nom, email from Users;
select prenom, nom, email from Users order by prenom asc;
select pseudo, password from Users where pseudo='RonoxDev';
select pseudo, site from Users where site='Lille';

/* Gestion des sites */

create table if not EXISTS Sites (
    id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20) NOT NULL
)ENGINE=InnoDB;

insert into Sites (name)
values ('Lille'), ('Roubaix'), ('Armentieres'), ('Saint-Omer');

select * from Sites

/* Supprime une table existante*/

drop table if exists Users 

/* Premiere relation */

alter table Users
add site_id TINYINT UNSIGNED NOT NULL;

update Users SET site_id=1;
select * from Users; 

alter table Users
add CONSTRAINT fk_sites 
    FOREIGN KEY (site_id)
    REFERENCES Sites(id);

update Users set site_id = 1 where site="Lille";
update Users set site_id = 2 where site="Roubaix";
update Users set site_id = 3 where site="Armentieres";
update Users set site_id = 4 where site="Saint-Omer";

alter table Users 
drop site;

/* Jointure */

select Users.pseudo, Users.email, Sites.name from Users inner join Sites on Users.site_id = Sites.id;

/* Les livres */

create table if not exists Genre ( 
    id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE
)ENGINE=InnoDB;

create table if not exists Livres (
    id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Titre VARCHAR(255) NOT NULL,
    Auteur VARCHAR(255) NOT NULL DEFAULT "Inconnu",
    Genre_id TINYINT UNSIGNED NOT NULL DEFAULT 1,
    Synopsis TEXT, 
    Date CHAR(4) NOT NULL DEFAULT '-NC-',
    Pages SMALLINT,
    Site_id TINYINT UNSIGNED NOT NULL,
    CONSTRAINT fk_genre
        FOREIGN KEY (Genre_id)
        REFERENCES Genre(id),

    CONSTRAINT fk_sites_book
        FOREIGN KEY (Site_id)
        REFERENCES Sites(id),
)ENGINE=InnoDB;

alter table Livres 
    add column user_id SMALLINT UNSIGNED;

alter table Livres 
    add CONSTRAINT fk_livres_user
    FOREIGN KEY (user_id)
    REFERENCES Users(id)

/* Les jointures */

select titre, user_id from Livres;

create view livres_vw as (select Livres.id, Livres.titre, Users.pseudo as Utilisateur, Livres.Auteur, Livres.Pages, Livres.Date, Genre.name as Genre, Sites.name AS Ville, Livres.user_id, Livres.site_id, Livres.Genre_id from Livres 
    Left Join Users on Livres.user_id = Users.id
    Left Join Genre on Livres.Genre_id = Genre.id
    Left Join Sites on Livres.Site_id = Sites.id);


select Livres.titre, Users.pseudo from Livres 
    Left Join Users on Livres.user_id = Users.id; 

select Livres.titre, Users.pseudo from Livres 
    Right Join Users on Livres.user_id = Users.id; 

/* Recherche */

select * from livres_vw where Pages <= 100 order by pages asc

/* Relation plusieurs à plusieurs - Commentaires */

create table if not exists comments (
    comment text not null,
    user_id SMALLINT UNSIGNED NOT NULL,
    livre_id SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY (user_id, livre_id),
    CONSTRAINT fk_comment_user
        FOREIGN KEY (user_id)
        REFERENCES Users(id),   

    CONSTRAINT fk_comment_livre
        FOREIGN KEY (livre_id)
        REFERENCES Livres(id)
)ENGINE=InnoDB;

select Livres.titre, Users.pseudo, Comments.Comments from Livres
    Inner Join Comments on Livres.id = Comments.livre_id
    Inner Join Users on Comments.user_id = Users.id
    where Livres.id = 35;