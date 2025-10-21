-- =============================================
-- INSERTAR INSTRUMENTOS - 13 instrumentos musicales
-- =============================================
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
-- Verificar
SELECT * FROM Instrumentos;