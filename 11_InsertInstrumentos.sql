-- =============================================
-- INSERTAR INSTRUMENTOS - 13 instrumentos musicales
-- =============================================
INSERT INTO Instrumentos (NombreInstrumento, Tipo, Descripcion) VALUES
('Guitarra El�ctrica', 'Cuerda', 'Guitarra el�ctrica'),
('Bajo', 'Cuerda', 'Bajo el�ctrico'),
('Bater�a', 'Percusi�n', 'Bater�a completa'),
('Teclado', 'Teclado', 'Teclado o piano el�ctrico'),
('Voz', 'Voz', 'Vocalista principal'),
('Guitarra Ac�stica', 'Cuerda', 'Guitarra ac�stica'),
('Saxof�n', 'Viento', 'Saxof�n'),
('Viol�n', 'Cuerda', 'Viol�n'),
('Arm�nica', 'Viento', 'Arm�nica'),
('Tambor', 'Percusi�n', 'Tambor y percusiones menores'),
('Piano', 'Teclado', 'Piano ac�stico o digital'),
('Trompeta', 'Viento', 'Trompeta'),
('Sintetizador', 'Electr�nico', 'Sintetizador electr�nico');

PRINT '? Instrumentos insertados';
-- Verificar
SELECT * FROM Instrumentos;