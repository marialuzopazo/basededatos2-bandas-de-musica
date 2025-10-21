-- =============================================
-- INSERTAR GÉNEROS - 10 géneros musicales
-- =============================================
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
-- Verificar
SELECT * FROM Generos;