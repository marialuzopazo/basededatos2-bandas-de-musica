-- =============================================
-- TABLA ÉXITOS - Canciones famosas de cada banda
-- =============================================
CREATE TABLE Exitos (
    ExitoID INT IDENTITY(1,1) PRIMARY KEY,
    BandaID INT NOT NULL,
    Titulo VARCHAR(100) NOT NULL,
    Album VARCHAR(100),
    AnioLanzamiento INT,
    Duracion TIME,
    LinkYoutube VARCHAR(200),
    LinkSpotify VARCHAR(200),
    Reproducciones BIGINT DEFAULT 0,
    FechaCreacion DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_Exitos_Bandas FOREIGN KEY (BandaID) REFERENCES Bandas(BandaID)
);
PRINT '? Tabla Exitos creada';