-- =============================================
-- SP: INSERTAR ÉXITO
-- =============================================
CREATE PROCEDURE sp_InsertarExito
    @BandaID INT,
    @Titulo VARCHAR(100),
    @Album VARCHAR(100) = NULL,
    @AnioLanzamiento INT = NULL,
    @Duracion TIME = NULL,
    @LinkYoutube VARCHAR(200) = NULL,
    @LinkSpotify VARCHAR(200) = NULL,
    @Reproducciones BIGINT = 0
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        INSERT INTO Exitos (BandaID, Titulo, Album, AnioLanzamiento, Duracion, LinkYoutube, LinkSpotify, Reproducciones)
        VALUES (@BandaID, @Titulo, @Album, @AnioLanzamiento, @Duracion, @LinkYoutube, @LinkSpotify, @Reproducciones);
        
        DECLARE @NuevoExitoID INT = SCOPE_IDENTITY();
        
        SELECT 
            @NuevoExitoID AS ExitoID, 
            'Éxito insertado correctamente' AS Mensaje;
            
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMsg VARCHAR(4000) = ERROR_MESSAGE();
        SELECT -1 AS ExitoID, 'Error: ' + @ErrorMsg AS Mensaje;
    END CATCH
END;
PRINT '? SP InsertarExito creado';