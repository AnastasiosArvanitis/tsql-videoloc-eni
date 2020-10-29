
-------------------------------------------------
-------  Print Receipt - Imprimer Facture ------- 
-------------------------------------------------

CREATE OR ALTER FUNCTION fn_facture(@factureId INT)
RETURNS TABLE
AS
RETURN(
    SELECT
    f.Num_Facture AS "Numero Facture", 
    f.Date_facture AS "Date Facture",
    l.Date_emprunt AS "Date Emprunt",
    CONCAT_WS (' ', c.Titre, c.Nom, c.Prenom) AS "Client Name",
    d.Titre AS "Film Titre", d.Prix_base AS "Prix", 
    gf.Signification AS "Genre",
    CONCAT_WS(' ', r.Nom, r.Prenom) AS "Realisateur Name"
    FROM Clients c
    JOIN Factures f ON c.Code_client = f.Code_client
    JOIN Locations l ON f.Num_facture = l.Num_facture
    JOIN Dvd d ON l.Num_dvd = d.Num_dvd
    JOIN Realisateur r ON d.Code_realisateur = r.Code_realisateur
    JOIN Genres_film gf ON d.Code_genre = gf.Code_genre
    WHERE f.Num_facture = @factureId
);