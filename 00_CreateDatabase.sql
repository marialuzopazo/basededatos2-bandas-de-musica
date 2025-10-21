-- =============================================
-- CREO BASE DE DATOS DESDE CERO
-- =============================================

-- Ir a la base de datos principal
USE master;
GO

-- Eliminar si existe y crear nueva
IF EXISTS(SELECT name FROM sys.databases WHERE name = 'SistemaMusical_Premiado')
BEGIN
    ALTER DATABASE SistemaMusical_Premiado SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE SistemaMusical_Premiado;
END
GO

-- Crear la base de datos
CREATE DATABASE SistemaMusical_Premiado;
GO

-- Usar la base de datos nueva
USE SistemaMusical_Premiado;
GO

PRINT '? Base de datos creada exitosamente';