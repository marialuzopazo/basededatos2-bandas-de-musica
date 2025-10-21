-- =============================================
-- SCRIPT MAESTRO - EJECUTAR ESTE SOLO
-- =============================================
PRINT '?? INICIANDO CREACIÓN DEL SISTEMA MUSICAL ??';

-- 1. Verificar y crear base de datos si no existe
PRINT '1. Verificando base de datos...';
IF NOT EXISTS(SELECT name FROM sys.databases WHERE name = 'SistemaMusical_Premiado')
BEGIN
    PRINT 'Creando base de datos...';
    CREATE DATABASE SistemaMusical_Premiado;
    PRINT '? Base de datos creada exitosamente';
END
ELSE
BEGIN
    PRINT '? Base de datos ya existe';
END
GO

-- Usar la base de datos
USE SistemaMusical_Premiado;
GO

-- 2. Tablas catálogo (con verificaciones)
PRINT '2. Creando tablas catálogo...';

-- Estados
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Estados')
BEGIN
    CREATE TABLE Estados (
        EstadoID INT IDENTITY(1,1) PRIMARY KEY,
        NombreEstado VARCHAR(50) NOT NULL UNIQUE,
        Descripcion TEXT
    );
    PRINT '? Tabla Estados creada';
END
ELSE
BEGIN
    PRINT '? Tabla Estados ya existe';
END

-- Generos
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Generos')
BEGIN
    CREATE TABLE Generos (
        GeneroID INT IDENTITY(1,1) PRIMARY KEY,
        NombreGenero VARCHAR(50) NOT NULL UNIQUE,
        Descripcion TEXT
    );
    PRINT '? Tabla Generos creada';
END
ELSE
BEGIN
    PRINT '? Tabla Generos ya existe';
END

-- Instrumentos
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Instrumentos')
BEGIN
    CREATE TABLE Instrumentos (
        InstrumentoID INT IDENTITY(1,1) PRIMARY KEY,
        NombreInstrumento VARCHAR(50) NOT NULL UNIQUE,
        Tipo VARCHAR(50),
        Descripcion TEXT
    );
    PRINT '? Tabla Instrumentos creada';
END
ELSE
BEGIN
    PRINT '? Tabla Instrumentos ya existe';
END

-- 3. Tablas principales
PRINT '3. Creando tablas principales...';

-- Bandas
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Bandas')
BEGIN
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
END
ELSE
BEGIN
    PRINT '? Tabla Bandas ya existe';
END

-- Integrantes
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Integrantes')
BEGIN
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
END
ELSE
BEGIN
    PRINT '? Tabla Integrantes ya existe';
END

-- 4. Tablas puente
PRINT '4. Creando tablas puente...';

-- BandasGeneros
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'BandasGeneros')
BEGIN
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
END
ELSE
BEGIN
    PRINT '? Tabla BandasGeneros ya existe';
END

-- IntegrantesInstrumentos
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'IntegrantesInstrumentos')
BEGIN
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
END
ELSE
BEGIN
    PRINT '? Tabla IntegrantesInstrumentos ya existe';
END

-- Exitos
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Exitos')
BEGIN
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
END
ELSE
BEGIN
    PRINT '? Tabla Exitos ya existe';
END

-- 5. Insertar datos catálogo (solo si no existen)
PRINT '5. Insertando datos de catálogo...';

-- Estados
IF NOT EXISTS (SELECT 1 FROM Estados)
BEGIN
    INSERT INTO Estados (NombreEstado, Descripcion) VALUES
    ('Activa', 'Banda en actividad musical'),
    ('Inactiva', 'Banda no activa actualmente'),
    ('Separada', 'Banda que se ha separado definitivamente'),
    ('Hiato', 'Banda en pausa temporal');
    PRINT '? Estados insertados';
END
ELSE
BEGIN
    PRINT '? Estados ya tienen datos';
END

-- Generos
IF NOT EXISTS (SELECT 1 FROM Generos)
BEGIN
    INSERT INTO Generos (NombreGenero, Descripcion) VALUES
    ('Rock', 'Género musical tradicional del rock'),
    ('Pop', 'Música popular comercial'),
    ('Metal', 'Heavy metal y subgéneros'),
    ('Jazz', 'Música jazz y sus variantes'),
    ('Electrónica', 'Música electrónica y EDM'),
    ('Hip Hop', 'Rap y hip hop'),
    ('Reggae', 'Reggae y derivados'),
    ('Blues', 'Blues tradicional y moderno'),
    ('Funk', 'Música funk y soul'),
    ('Indie', 'Música independiente');
    PRINT '? Géneros insertados';
END
ELSE
BEGIN
    PRINT '? Géneros ya tienen datos';
END

-- Instrumentos
IF NOT EXISTS (SELECT 1 FROM Instrumentos)
BEGIN
    INSERT INTO Instrumentos (NombreInstrumento, Tipo, Descripcion) VALUES
    ('Guitarra Eléctrica', 'Cuerda', 'Guitarra eléctrica'),
    ('Bajo', 'Cuerda', 'Bajo eléctrico'),
    ('Batería', 'Percusión', 'Batería completa'),
    ('Teclado', 'Teclado', 'Teclado o piano eléctrico'),
    ('Voz', 'Voz', 'Vocalista principal'),
    ('Guitarra Acústica', 'Cuerda', 'Guitarra acústica'),
    ('Saxofón', 'Viento', 'Saxofón'),
    ('Violín', 'Cuerda', 'Violín'),
    ('Armónica', 'Viento', 'Armónica'),
    ('Tambor', 'Percusión', 'Tambor y percusiones menores'),
    ('Piano', 'Teclado', 'Piano acústico o digital'),
    ('Trompeta', 'Viento', 'Trompeta'),
    ('Sintetizador', 'Electrónico', 'Sintetizador electrónico');
    PRINT '? Instrumentos insertados';
END
ELSE
BEGIN
    PRINT '? Instrumentos ya tienen datos';
END

-- 6. Stored Procedures (con verificaciones)
PRINT '6. Creando stored procedures...';
GO

-- SP InsertarBanda
IF OBJECT_ID('sp_InsertarBandaBasica', 'P') IS NOT NULL
    DROP PROCEDURE sp_InsertarBandaBasica;
GO

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
GO
PRINT '? SP InsertarBanda creado';

-- SP AgregarGenero
IF OBJECT_ID('sp_AgregarGeneroABanda', 'P') IS NOT NULL
    DROP PROCEDURE sp_AgregarGeneroABanda;
GO

CREATE PROCEDURE sp_AgregarGeneroABanda
    @BandaID INT,
    @GeneroID INT,
    @EsPrincipal BIT = 0,
    @OrdenImportancia INT = 1
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        INSERT INTO BandasGeneros (BandaID, GeneroID, EsPrincipal, OrdenImportancia)
        VALUES (@BandaID, @GeneroID, @EsPrincipal, @OrdenImportancia);
        
        SELECT 'Género agregado correctamente' AS Mensaje;
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMsg VARCHAR(4000) = ERROR_MESSAGE();
        SELECT 'Error: ' + @ErrorMsg AS Mensaje;
    END CATCH
END;
GO
PRINT '? SP AgregarGenero creado';

-- SP InsertarIntegrante
IF OBJECT_ID('sp_InsertarIntegrante', 'P') IS NOT NULL
    DROP PROCEDURE sp_InsertarIntegrante;
GO

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
        DECLARE @ErrorMsg2 VARCHAR(4000) = ERROR_MESSAGE();
        SELECT -1 AS IntegranteID, 'Error: ' + @ErrorMsg2 AS Mensaje;
    END CATCH
END;
GO
PRINT '? SP InsertarIntegrante creado';

-- SP InsertarExito
IF OBJECT_ID('sp_InsertarExito', 'P') IS NOT NULL
    DROP PROCEDURE sp_InsertarExito;
GO

CREATE PROCEDURE sp_InsertarExito
    @BandaID INT,
    @Titulo VARCHAR(100),
    @Album VARCHAR(100) = NULL,
    @AnioLanzamiento INT = NULL,
    @Duracion TIME = NULL,
    @LinkYoutube VARCHAR(200) = NULL,
    @LinkSpotify VARCHAR(200) = NULL,
    @Reproducciones BIGINT = 0
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        INSERT INTO Exitos (BandaID, Titulo, Album, AnioLanzamiento, Duracion, LinkYoutube, LinkSpotify, Reproducciones)
        VALUES (@BandaID, @Titulo, @Album, @AnioLanzamiento, @Duracion, @LinkYoutube, @LinkSpotify, @Reproducciones);
        
        DECLARE @NuevoExitoID INT = SCOPE_IDENTITY();
        
        SELECT 
            @NuevoExitoID AS ExitoID, 
            'Éxito insertado correctamente' AS Mensaje;
            
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMsg3 VARCHAR(4000) = ERROR_MESSAGE();
        SELECT -1 AS ExitoID, 'Error: ' + @ErrorMsg3 AS Mensaje;
    END CATCH
END;
GO
PRINT '? SP InsertarExito creado';

PRINT '?? SISTEMA MUSICAL CREADO EXITOSAMENTE ??';
PRINT '=== LISTO PARA USAR ===';

-- Verificar creación
PRINT '=== VERIFICANDO TABLAS CREADAS ===';
SELECT name AS Tablas FROM sys.tables ORDER BY name;

PRINT '=== VERIFICANDO DATOS INSERTADOS ===';
SELECT 'Estados' AS Tabla, COUNT(*) AS Registros FROM Estados
UNION ALL
SELECT 'Generos', COUNT(*) FROM Generos
UNION ALL
SELECT 'Instrumentos', COUNT(*) FROM Instrumentos;