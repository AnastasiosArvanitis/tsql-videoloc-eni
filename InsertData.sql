DECLARE @InsertTran VARCHAR(20);
SELECT @InsertTran = 'InsertTableClient';

BEGIN TRANSACTION @InsertTran;
USE VideoLoc;

-----------------------------------------------------------
-----       Creating Tables without Foreign Keys      -----
-----------------------------------------------------------

INSERT INTO Clients 
    (Titre, Prenom, Nom, Adresse_rue,
    Code_postal, Ville, Num_telephone,
    Date_naissance, Enfants)
VALUES
    ('M', 'Genia', 'Perpo', 'RueVenice', '44600',
     'Lille', '0655555478', '08-12-1960', 3),
     ('M', 'Jerry', 'Johnson', 'RueToro', '44600',
     'Rennes', '0698745632', '06-08-1962', 2),
     ('M', 'Peter', 'Zedas', 'RueFerd', '44688',
     'Nantes', '0532145698', '03-10-1987', 0),
     ('Mme', 'Eliza', 'Vanet', 'RueKemo', '44000',
     'Nantes', '0498745632', '02-06-1998', 0),
     ('Mme', 'Mary', 'Zeli', 'RueVia', '44600',
     'NewYork', '0236541236', '06-15-1975', 2),
     ('Mme', 'Helene', 'Smith', 'RueBoris', '85479',
     'London', '4569874123', '03-17-1968', 4),
     ('Mme', 'Sarah', 'Zeni', 'RueAlphonse', '33654',
     'Napoli', '0123456789', '05-22-2000', 0),
     ('Au', 'Debora', 'Lemon', 'RueDelhi', '66523',
     'Napoli', '9965412354', '01-03-2002', 0),
     ('M', 'Klid', 'Strus', 'RueMela', '22456',
     'Athens', '5541236987', '03-20-1958', 8),
     ('M', 'Stauros', 'Pikoouros', 'RueMela', '22456',
     'Athens', '9987456321', '02-20-1978', 2),
     ('M', 'Petros', 'Devolos', 'RueFeka', '22333',
     'Athens', '4455663322', '08-21-1999', 0);


COMMIT TRANSACTION @InsertTran;

-------------------------------------------------------
DECLARE @InsertTranTypes VARCHAR(20);
SELECT @InsertTranTypes = 'InsertTypesLocation';

BEGIN TRANSACTION @InsertTranTypes;
USE VideoLoc;

INSERT INTO Types_location 
(Libelle, Nb_jours)
VALUES
('Longue', 10),
('Short', 3),
('Unknown', NULL);

COMMIT TRANSACTION @InsertTranTypes;

-------------------------------------------------------------
DECLARE @InsertTranGenres VARCHAR(20);
SELECT @InsertTranGenres = 'InsertGenre';

BEGIN TRANSACTION @InsertTranGenres;
USE VideoLoc;

INSERT INTO Genres_film 
(Signification)
VALUES
('Horror'),
('Comedy'),
('Romance'),
('Adventure'),
('Drama');

COMMIT TRANSACTION @InsertTranGenres;

--------------------------------------------------------------
DECLARE @InsertTranRearisateur VARCHAR(20);
SELECT @InsertTranRearisateur = 'InsertRealisateur';

BEGIN TRANSACTION @InsertTranRearisateur;
USE VideoLoc;

INSERT INTO Realisateur
(Prenom, Nom, Annee_naissance, Pay)
VALUES
('Francis', 'Copola', '02-06-1935', 'USA'),
('Quentin', 'Tarantino', '06-18-1960', 'USA'),
('George', 'Ford', '03-11-1970', 'UK'),
('Elton', 'John', '08-23-1940', 'UK'),
('Dani', 'Carakiri', '04-15-1960', 'INDIA'),
('Nicola','Georgi', '09-6-1980','Russia');

COMMIT TRANSACTION @InsertTranRearisateur;

--------------------------------------------------------------

DECLARE @InsertTranDvd VARCHAR(20);
SELECT @InsertTranDvd = 'InsertDvd';

BEGIN TRANSACTION @InsertTranDvd;
USE VideoLoc;

INSERT INTO Dvd
(Titre, Prix_base, Code_realisateur, Code_genre, Anne, Descriptif, Duree)
VALUES
('The shark', 10.20, 1, 1, '02-06-1980', 'The sharks have big teeth...', 185),
('Phantome of the Opera', 9.30, 4, 5, '06-22-1975', 'It was a good phantome...', 160),
('Billy Elliot', 11.50, 6, 2, '05-16-2010', 'He was dancing really well...', 133),
('Pulp Fiction', 15.50, 2, 4, '05-21-2001', 'I love you honey-bunny...', 220),
('The end', 7.60, 1, 4, '04-11-1972', 'It was not the end...', 200),
('Top Gun', 11.10, 5, 4, '04-04-1988', 'It was a big gun...', 165),
('The beautifull', 9.80, 6, 3, '01-06-1999', 'She was very beautifull...', 185),
('Jurasic Parc', 16.20, 3, 5, '03-09-1977', 'The dinosaures come to life...', 190),
('Pinoccio', 11.40, 4, 2, '09-22-1950', 'He has a big nose...', 90);

COMMIT TRANSACTION @InsertTranDvd;

--------------------------------------------------------------

DECLARE @InsertTranFactures VARCHAR(20);
SELECT @InsertTranFactures = 'InsertFactures';

BEGIN TRANSACTION @InsertTranFactures;
USE VideoLoc;

INSERT INTO Factures
(Code_client, Date_facture)
VALUES
(35, '04-22-2020'), (36, '06-18-2020'),
(36, '05-15-2020'), (36, '07-22-2020'),
(37, '12-11-2020'), (37, '08-15-2020'),
(38, '11-08-2020'), (40, '07-17-2020'),
(39, '06-27-2020'), (41, '06-20-2020'),
(40, '08-30-2020'), (43, '09-21-2020'),
(41, '01-03-2020'), (44, '11-17-2020'),
(42, '02-19-2020'), (44, '06-25-2020'),
(43, '02-22-2020'), (41, '04-01-2020'),
(44, '11-17-2020'), (44, '04-06-2020'),
(45, '04-16-2020'), (43, '02-08-2020'),
(35, '12-14-2020'), (44, '02-29-2020');

COMMIT TRANSACTION @InsertTranFactures;

----------------------------------------------------------------

DECLARE @InsertTranLocations VARCHAR(20);
SELECT @InsertTranLocations = 'InsertLocations';

BEGIN TRANSACTION @InsertTranLocations;
USE VideoLoc;

INSERT INTO Locations
(Num_facture, Num_dvd, Code_type, Date_emprunt, Date_retour)
VALUES
(1, 2, 1, '05-15-2020', '05-18-2020'), (1, 4, 2, '06-18-2020', '06-25-2020'),
(2, 5, 2, '07-22-2020', '07-25-2020'), (3, 7, 3, '05-15-2020', '05-18-2020'),
(4, 3, 1, '05-15-2020', '05-18-2020'), (4, 6, 1, '05-15-2020', '05-18-2020'),
(5, 8, 1, '11-08-2020', '11-15-2020'), (6, 3, 2, '07-17-2020', '07-24-2020'),
(7, 3, 2, '06-27-2020', '06-30-2020'), (7, 2, 1, '06-20-2020', '06-24-2020'),
(8, 1, 2, '08-25-2020', '08-30-2020'), (9, 4, 3, '09-21-2020', '09-26-2020'),
(10, 6, 2, '01-03-2020', '01-08-2020'), (11, 7, 1, '11-17-2020', '11-23-2020'),
(12, 5, 3, '02-19-2020', '02-21-2020'), (13, 2, 1, '06-25-2020', '06-25-2020'),
(14, 2, 1, '02-22-2020', '02-26-2020'), (15, 6, 2, '04-01-2020', '04-05-2020'),
(16, 3, 2, '11-17-2020', '11-22-2020'), (17, 1, 3, '04-06-2020', '04-12-2020'),
(18, 8, 1, '04-16-2020', '04-19-2020'), (19, 2, 3, '02-08-2020', '02-14-2020'),
(20, 4, 1, '12-14-2020', '12-14-2020'), (21, 8, 3, '02-05-2020', '02-12-2020'),
(22, 3, 1, '12-14-2020', '12-14-2020'), (23, 1, 3, '02-10-2020', '02-13-2020'),
(24, 6, 1, '12-14-2020', '12-14-2020'), (24, 5, 1, '02-14-2020', '02-14-2020');


COMMIT TRANSACTION @InsertTranLocations;

----------------------------------------------------------------

SELECT d.Titre AS "Film Title", 
        CONCAT_WS('', r.Prenom, r.Nom) AS "Realisateur",
        l.Date_retour, f.Date_facture, 
        CONCAT_WS(' ', c.Titre, c.Prenom, c.Nom) AS "Client Full Name"
FROM Dvd d
JOIN Realisateur r ON d.Code_realisateur = r.Code_realisateur
JOIN Locations l ON d.Num_dvd = l.Num_dvd
JOIN Factures f ON l.Num_facture = f.Num_facture
JOIN Clients c ON f.Code_client = c.Code_client
WHERE f.Num_facture = 3
ORDER BY 1;

SELECT * FROM Locations;
SELECT * FROM Dvd;
SELECT * FROM Types_location;

DELETE FROM Locations;

SELECT * FROM Genres_film ORDER BY Code_genre;