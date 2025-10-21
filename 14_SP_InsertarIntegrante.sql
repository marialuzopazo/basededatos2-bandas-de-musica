-- =============================================
-- esto es el store procedure de INSERTAR INTEGRANTE
-- =============================================
CREATE PROCEDURE sp_InsertarIntegrante
    @BandaID INT,
    @Nombre VARCHAR(50),
    @Apellido VARCHAR(50),
    @Rol VARCHAR(50) = NULL,
    @FechaIngreso DATE = NULL
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        INSERT INTO Integrantes (BandaID, Nombre, Apellido, Rol, FechaIngreso)
        VALUES (@BandaID, @Nombre, @Apellido, @Rol, @FechaIngreso);
        
        DECLARE @NuevoIntegranteID INT = SCOPE_IDENTITY();
        
        SELECT 
            @NuevoIntegranteID AS IntegranteID, 
            'Integrante insertado correctamente' AS Mensaje;
            
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMsg VARCHAR(4000) = ERROR_MESSAGE();
        SELECT -1 AS IntegranteID, 'Error: ' + @ErrorMsg AS Mensaje;
    END CATCH
END;
PRINT '? SP InsertarIntegrante creado';