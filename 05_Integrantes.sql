-- =============================================
-- TABLA INTEGRANTES - Músicos de cada banda
-- =============================================
CREATE TABLE Integrantes (
    IntegranteID INT IDENTITY(1,1) PRIMARY KEY,
    BandaID INT NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Rol VARCHAR(50),
    FechaIngreso DATE,
    Activo BIT DEFAULT 1,
    FechaCreacion DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_Integrantes_Bandas FOREIGN KEY (BandaID) REFERENCES Bandas(BandaID)
);
PRINT '? Tabla Integrantes creada';