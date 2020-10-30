-------------------------------------------------
-------          Nouvelle Location        ------- 
-------------------------------------------------

ALTER PROCEDURE [dbo].pc_nouv_loc (
    @codeClient INT,
    @numDvd INT,
    @codeType INT
) AS

DECLARE
@numFacture INT;

BEGIN
    INSERT INTO Factures (Code_client, Date_facture) 
    VALUES (@codeClient, GETDATE());
    
    SELECT @numFacture = [Num_facture]
    FROM Factures
    WHERE Num_facture = (
        SELECT MAX(Num_facture)
        FROM Factures
    );

    SET @numFacture = SCOPE_IDENTITY();

    INSERT INTO Locations (Num_facture, Num_dvd, Date_emprunt, Date_retour, Code_type) 
    VALUES (@numFacture, @numDvd, GETDATE(), GETDATE()+10, @codeType);
END
GO
