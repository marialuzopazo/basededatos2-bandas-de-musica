-- =============================================
-- TABLA ESTADOS - Controla si banda está Activa/Inactiva/Separada
-- =============================================
CREATE TABLE Estados (
    EstadoID INT IDENTITY(1,1) PRIMARY KEY,
    NombreEstado VARCHAR(50) NOT NULL UNIQUE,
    Descripcion TEXT
);
PRINT '? Tabla Estados creada';