-- =============================================
-- TABLA BANDAS - Información principal de cada banda/solista
-- =============================================
CREATE TABLE Bandas (
    BandaID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    FechaFormacion DATE NOT NULL,
    PaisOrigen VARCHAR(50) NOT NULL,
    EstadoID INT NOT NULL,
    Biografia TEXT,
    FechaCreacion DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_Bandas_Estados FOREIGN KEY (EstadoID) REFERENCES Estados(EstadoID)
);
PRINT '? Tabla Bandas creada';