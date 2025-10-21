-- =============================================
-- SP: INSERTAR BANDA BÁSICA
-- =============================================
CREATE PROCEDURE sp_InsertarBandaBasica
    @Nombre VARCHAR(100),
    @FechaFormacion DATE,
    @PaisOrigen VARCHAR(50),
    @EstadoID INT,
    @Biografia TEXT = NULL
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        INSERT INTO Bandas (Nombre, FechaFormacion, PaisOrigen, EstadoID, Biografia)
        VALUES (@Nombre, @FechaFormacion, @PaisOrigen, @EstadoID, @Biografia);
        
        DECLARE @NuevaBandaID INT = SCOPE_IDENTITY();
        
        SELECT 
            @NuevaBandaID AS BandaID, 
            'Banda insertada correctamente. ID: ' + CAST(@NuevaBandaID AS VARCHAR) AS Mensaje;
            
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage VARCHAR(4000) = ERROR_MESSAGE();
        SELECT -1 AS BandaID, 'Error: ' + @ErrorMessage AS Mensaje;
    END CATCH
END;
PRINT '? SP InsertarBanda creado';