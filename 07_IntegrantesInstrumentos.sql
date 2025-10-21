-- =============================================
-- TABLA INTEGRANTESINSTRUMENTOS - MÚLTIPLES instrumentos por músico
-- =============================================
CREATE TABLE IntegrantesInstrumentos (
    IntegranteInstrumentoID INT IDENTITY(1,1) PRIMARY KEY,
    IntegranteID INT NOT NULL,
    InstrumentoID INT NOT NULL,
    FechaAsignacion DATE DEFAULT GETDATE(),
    NivelDominio VARCHAR(50),
    CONSTRAINT FK_II_Integrantes FOREIGN KEY (IntegranteID) REFERENCES Integrantes(IntegranteID),
    CONSTRAINT FK_II_Instrumentos FOREIGN KEY (InstrumentoID) REFERENCES Instrumentos(InstrumentoID),
    CONSTRAINT UK_II_Unico UNIQUE (IntegranteID, InstrumentoID)
);
PRINT '? Tabla IntegrantesInstrumentos creada';