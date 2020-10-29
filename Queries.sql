USE VideoLoc;

SELECT Nom, Prenom, Ville
FROM Clients;

SELECT * FROM Clients
ORDER BY Ville;

SELECT Titre, Anne
FROM Dvd
ORDER BY 1;

SELECT Nom, Prenom, Annee_naissance
FROM Realisateur
ORDER BY 3 ASC;

SELECT * FROM Clients
WHERE Code_postal LIKE '44%';

SELECT Nom, Prenom
FROM Clients 
WHERE Prenom LIKE 'J%';

SELECT Nom, Prenom
FROM Clients 
WHERE Date_naissance BETWEEN '01-01-1970' AND '12-31-1980';

SELECT Nom, Prenom, Pay
FROM Realisateur
WHERE Pay LIKE 'USA' OR Pay LIKE 'UK';

SELECT Nom, Prenom
FROM Realisateur
WHERE Annee_naissance BETWEEN '01-01-1900' AND '12-31-1999'
AND Nom LIKE '%a%'; 

SELECT Titre FROM Dvd
WHERE Dvd.Duree > 120;

SELECT c.Titre,
COUNT(c.Code_client) AS "Clients per Titre"
FROM Clients c
GROUP BY c.Titre
ORDER BY 2 DESC;

SELECT gf.Signification, COUNT(d.Num_dvd)  AS "Films per Genre"
FROM Dvd d, Genres_film gf
WHERE d.Code_Genre = gf.Code_genre
GROUP BY gf.Signification;

SELECT r.Pay, COUNT(r.Code_realisateur) AS "Realisateur per Pay"
FROM Realisateur r
GROUP BY r.Pay
ORDER BY 1 DESC;

SELECT gf.Signification, AVG(d.Duree) AS "Average Duration"
FROM Genres_film gf
JOIN Dvd d ON gf.Code_genre = d.Code_genre
GROUP BY gf.Signification
ORDER BY 1 DESC;

SELECT COUNT(c.Code_client) AS "Number of clients",
    MONTH(c.Date_naissance) AS Mois
FROM Clients c
GROUP BY MONTH(c.Date_naissance) ;

SELECT d.Titre, gf.Signification
FROM Dvd d
JOIN Genres_film gf ON d.Code_genre = gf.Code_genre
ORDER BY 1;

SELECT d.Titre, gf.Signification, r.Nom, r.Prenom, r.Pay
FROM Dvd d
JOIN Genres_film gf ON d.Code_genre = gf.Code_genre
JOIN Realisateur r ON d.Code_realisateur = r.Code_realisateur
ORDER BY 1;

SELECT * FROM Factures;

SELECT c.Nom, c.Prenom, f.Date_facture
FROM Clients c
JOIN Factures f ON c.Code_client = f.Code_client
WHERE f.Date_facture BETWEEN '06-01-2020' AND '06-30-2020'
ORDER BY 3;

SELECT d.Titre, d.duree, 
    CONCAT_WS(' ', c.Titre, c.Nom, c.Prenom) as "Client full name",
    CONCAT_WS(' ', r.Nom, r.Prenom) AS "Realisateur full name"
FROM Dvd d 
JOIN Realisateur r ON d.Code_realisateur = r.Code_realisateur
JOIN Locations l ON d.Num_dvd = l.Num_dvd
JOIN Factures f ON l.Num_facture = f.Num_facture
JOIN Clients c ON f.Code_client = c.Code_client
ORDER BY 1;

SELECT CONCAT_WS(' ', c.Nom, c.Prenom) AS "Client full Name",
CONCAT_WS(' ', r.Nom, r.Prenom) AS "Realisateur full name",
d.Titre AS "Film Title"
FROM Clients c
JOIN Factures f ON c.Code_client = f.Code_client
JOIN Locations l ON f.Num_facture = l.Num_facture
JOIN Dvd d ON l.Num_dvd = d.Num_dvd
JOIN Realisateur r on d.Code_realisateur = r.Code_realisateur
WHERE r.Pay = 'USA' 
AND f.Date_facture BETWEEN '06-01-2020' AND '06-30-2020'
ORDER BY d.Titre; 

SELECT CONCAT_WS(' ', c.Nom, c.Prenom) AS "Client full Name",
d.Titre AS "Film Title", COUNT(d.Num_dvd)
FROM Clients c
JOIN Factures f ON c.Code_client = f.Code_client
JOIN Locations l ON f.Num_facture = l.Num_facture
JOIN Dvd d ON l.Num_dvd = d.Num_dvd
GROUP BY c.Nom, c.Prenom, d.Titre
ORDER BY 1, 2;

SELECT COUNT(d.Num_dvd) AS "Total Film",
r.Pay, gf.Signification
FROM Dvd d
JOIN Realisateur r ON d.Code_realisateur = r.Code_realisateur
JOIN Genres_film gf ON d.Code_genre = gf.Code_genre
GROUP BY r.Pay, gf.Signification
ORDER BY 2, 3;

SELECT AVG(d.Duree) AS "Average Film",
r.Pay, gf.Signification
FROM Dvd d
JOIN Realisateur r ON d.Code_realisateur = r.Code_realisateur
JOIN Genres_film gf ON d.Code_genre = gf.Code_genre
GROUP BY r.Pay, gf.Signification
ORDER BY 2, 3;

SELECT Titre, Nom, Prenom, 
    DATEDIFF(YY, Date_naissance, GETDATE()) AS Age
INTO Client_Loire_Atl 
FROM Clients
WHERE Code_postal LIKE '44%'
;

SELECT * FROM Client_Loire_Atl;

DELETE FROM  Client_Loire_Atl
WHERE Age > 40;