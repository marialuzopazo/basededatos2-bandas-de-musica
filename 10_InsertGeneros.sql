-- =============================================
-- INSERTAR G�NEROS - 10 g�neros musicales
-- =============================================
INSERT INTO Generos (NombreGenero, Descripcion) VALUES
('Rock', 'G�nero musical tradicional del rock'),
('Pop', 'M�sica popular comercial'),
('Metal', 'Heavy metal y subg�neros'),
('Jazz', 'M�sica jazz y sus variantes'),
('Electr�nica', 'M�sica electr�nica y EDM'),
('Hip Hop', 'Rap y hip hop'),
('Reggae', 'Reggae y derivados'),
('Blues', 'Blues tradicional y moderno'),
('Funk', 'M�sica funk y soul'),
('Indie', 'M�sica independiente');

PRINT '? G�neros insertados';
-- Verificar
SELECT * FROM Generos;