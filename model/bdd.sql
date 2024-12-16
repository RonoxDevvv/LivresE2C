/* Connection à mySQL avec le Terminal*/

sudo mysql

/* Exit mySQL */

exit 

/* Commande de base */

show databases; /* La liste de db sur le serveur */
create database Livre_E2C; /* Créer une db */
use Livre_E2C /* Utilise une db */

/* Gestion de compte */

create user 'Livre_E2C_admin'@'localhost' identified by "123456789";
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