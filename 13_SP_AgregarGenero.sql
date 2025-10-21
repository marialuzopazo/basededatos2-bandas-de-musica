-- =============================================
-- el store procedure de AGREGAR G�NERO A BANDA
-- =============================================
CREATE PROCEDURE sp_AgregarGeneroABanda
    @BandaID INT,
    @GeneroID INT,
    @EsPrincipal BIT = 0,
    @OrdenImportancia INT = 1
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        INSERT INTO BandasGeneros (BandaID, GeneroID, EsPrincipal, OrdenImportancia)
        VALUES (@BandaID, @GeneroID, @EsPrincipal, @OrdenImportancia);
        
        SELECT 'G�nero agregado correctamente' AS Mensaje;
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMsg VARCHAR(4000) = ERROR_MESSAGE();
        SELECT 'Error: ' + @ErrorMsg AS Mensaje;
    END CATCH
END;
PRINT '? SP AgregarGenero creado';