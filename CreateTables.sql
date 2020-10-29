DECLARE @TranName VARCHAR(20);  
SELECT @TranName = 'CreateTablesTran';

BEGIN TRANSACTION @TranName;
USE VideoLoc;

-----------------------------------------------------------
-----       Creating Tables without Foreign Keys      -----
-----------------------------------------------------------

CREATE TABLE Clients (
    Code_client INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    Titre VARCHAR(10) NOT NULL,
    Prenom VARCHAR(30) NOT NULL,
    Nom VARCHAR(50) NOT NULL,
    Adresse_rue VARCHAR(150) NULL,
    Code_postal CHAR(5) NULL,
    Ville VARCHAR(30) NULL,
    Num_telephone CHAR(10) NOT NULL CONSTRAINT ch_telephone_client CHECK        (Num_telephone LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
    Date_naissance DATE NULL CONSTRAINT ch_date_naissa_client
    CHECK (Date_naissance > DATEADD(YEAR, - 100, GETDATE())),
    Enfants INT NULL
);

CREATE TABLE Factures (
    Num_facture INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    Code_client INT NOT NULL,
    Date_facture DATE NOT NULL CONSTRAINT ch_date_facture
    CHECK (Date_facture > DATEADD(YEAR, - 20, GETDATE()))
);

CREATE TABLE Types_location (
    Code_type INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    Libelle VARCHAR(150) NOT NULL,
    Coefficient INT NULL,
    Nb_jours INT NULL
);

CREATE TABLE Locations (
    Num_facture INT NOT NULL,
    Num_dvd INT NOT NULL,
    Code_type INT NOT NULL,
    Date_emprunt DATE NULL CONSTRAINT ch_date_emprunt
    CHECK (Date_emprunt > DATEADD(YEAR, - 20, GETDATE())),
    Date_retour DATE NOT NULL CONSTRAINT ch_date_retour
    CHECK (Date_retour > DATEADD(YEAR, - 20, GETDATE())),
    CONSTRAINT pk_locations PRIMARY KEY(Num_facture, Num_dvd)
);

CREATE TABLE Dvd (
    Num_dvd INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    Titre VARCHAR(50) NOT NULL UNIQUE,
    Prix_base NUMERIC(4,2) NOT NULL,
    Code_realisateur INT NOT NULL,
    Code_genre INT NOT NULL,
    Anne DATE NOT NULL CONSTRAINT ch_anne_dvd
    CHECK (Anne > DATEADD(YEAR, - 150, GETDATE())),
    Descriptif VARCHAR(250) NOT NULL UNIQUE DEFAULT 'Pas de descriptif...',
    Duree INT NOT NULL
);

CREATE TABLE Realisateur (
    Code_realisateur INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    Prenom VARCHAR(30) NOT NULL,
    Nom VARCHAR(50) NOT NULL,
    Annee_naissance DATE NOT NULL CONSTRAINT ch_anne_naissance
    CHECK (Annee_naissance > DATEADD(YEAR, - 150, GETDATE())), 
    Pay VARCHAR(30) NULL
);

CREATE TABLE Genres_film (
    Code_genre INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    Signification VARCHAR(20) NOT NULL UNIQUE
);

-----------------------------------------------------------
-----     Creating the relations with alter table     -----
-----------------------------------------------------------

ALTER TABLE Factures
ADD CONSTRAINT fk_client_factures
FOREIGN KEY (Code_client) REFERENCES Clients(Code_client);

ALTER TABLE Dvd
ADD CONSTRAINT fk_dvd_genre
FOREIGN KEY (Code_genre) REFERENCES Genres_film(Code_genre);

ALTER TABLE Dvd
ADD CONSTRAINT fk_dvd_realisateurs 
FOREIGN KEY (Code_realisateur) REFERENCES Realisateur(Code_realisateur);

ALTER TABLE Locations
ADD CONSTRAINT fk_location_factures
FOREIGN KEY (Num_facture) REFERENCES Factures(Num_facture);

ALTER TABLE Locations
ADD CONSTRAINT fk_location_dvd
FOREIGN KEY (Num_dvd) REFERENCES Dvd(Num_dvd);

ALTER TABLE Locations
ADD CONSTRAINT fk_location_types
FOREIGN KEY (Code_type) REFERENCES Types_location(Code_type);


COMMIT TRANSACTION @TranName;