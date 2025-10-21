-- =============================================
-- TABLA GÉNEROS - Lista de todos los géneros musicales
-- =============================================
CREATE TABLE Generos (
    GeneroID INT IDENTITY(1,1) PRIMARY KEY,
    NombreGenero VARCHAR(50) NOT NULL UNIQUE,
    Descripcion TEXT
);
PRINT '? Tabla Generos creada';