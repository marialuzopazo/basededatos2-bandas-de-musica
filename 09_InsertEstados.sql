-- =============================================
-- INSERTAR ESTADOS - Los 4 estados posibles
-- =============================================
INSERT INTO Estados (NombreEstado, Descripcion) VALUES
('Activa', 'Banda en actividad musical'),
('Inactiva', 'Banda no activa actualmente'),
('Separada', 'Banda que se ha separado definitivamente'),
('Hiato', 'Banda en pausa temporal');

PRINT '? Estados insertados';
-- Verificar
SELECT * FROM Estados;