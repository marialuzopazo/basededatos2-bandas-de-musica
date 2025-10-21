-- =============================================
-- TABLA BANDASGÉNEROS - Permite MÚLTIPLES géneros por banda
-- =============================================
CREATE TABLE BandasGeneros (
    BandaGeneroID INT IDENTITY(1,1) PRIMARY KEY,
    BandaID INT NOT NULL,
    GeneroID INT NOT NULL,
    EsPrincipal BIT DEFAULT 0,
    OrdenImportancia INT DEFAULT 1,
    FechaAsignacion DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_BG_Bandas FOREIGN KEY (BandaID) REFERENCES Bandas(BandaID),
    CONSTRAINT FK_BG_Generos FOREIGN KEY (GeneroID) REFERENCES Generos(GeneroID),
    CONSTRAINT UK_BG_Unico UNIQUE (BandaID, GeneroID)
);
PRINT '? Tabla BandasGeneros creada';