-- =============================================
-- TABLA INSTRUMENTOS - Todos los instrumentos musicales
-- =============================================
CREATE TABLE Instrumentos (
    InstrumentoID INT IDENTITY(1,1) PRIMARY KEY,
    NombreInstrumento VARCHAR(50) NOT NULL UNIQUE,
    Tipo VARCHAR(50),
    Descripcion TEXT
);
PRINT '? Tabla Instrumentos creada';