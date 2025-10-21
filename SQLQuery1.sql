USE SistemaMusical_Premiado;
GO

-- =============================================
-- AGREGAR TODAS TUS BANDAS/ARTISTAS
-- =============================================

-- 1. LOS PIOJOS (Argentina)
EXEC sp_InsertarBandaBasica 
    @Nombre = 'Los Piojos',
    @FechaFormacion = '1988-01-01',
    @PaisOrigen = 'Argentina',
    @EstadoID = 3,  -- Separada
    @Biografia = 'Banda de rock argentina formada en 1988, una de las más influyentes del rock nacional';

-- 2. LA MANCHA DE ROLANDO (Argentina)
EXEC sp_InsertarBandaBasica 
    @Nombre = 'La Mancha de Rolando',
    @FechaFormacion = '1993-01-01',
    @PaisOrigen = 'Argentina',
    @EstadoID = 1,  -- Activa
    @Biografia = 'Banda de rock argentina conocida por sus letras poéticas y fusión de estilos';

-- 3. QUEEN (Reino Unido)
EXEC sp_InsertarBandaBasica 
    @Nombre = 'Queen',
    @FechaFormacion = '1970-01-01',
    @PaisOrigen = 'Reino Unido',
    @EstadoID = 3,  -- Separada (después de muerte de Freddie)
    @Biografia = 'Banda británica de rock considerada una de las más grandes de la historia';

-- 4. GUNS AND ROSES (EEUU)
EXEC sp_InsertarBandaBasica 
    @Nombre = 'Guns and Roses',
    @FechaFormacion = '1985-01-01',
    @PaisOrigen = 'Estados Unidos',
    @EstadoID = 1,  -- Activa
    @Biografia = 'Banda estadounidense de hard rock formada en Los Ángeles en 1985';

-- 5. BRITNEY SPEARS (EEUU)
EXEC sp_InsertarBandaBasica 
    @Nombre = 'Britney Spears',
    @FechaFormacion = '1992-01-01',
    @PaisOrigen = 'Estados Unidos',
    @EstadoID = 1,  -- Activa
    @Biografia = 'Cantante, compositora y bailarina estadounidense, princesa del pop';

-- 6. ADELE (Reino Unido)
EXEC sp_InsertarBandaBasica 
    @Nombre = 'Adele',
    @FechaFormacion = '2006-01-01',
    @PaisOrigen = 'Reino Unido',
    @EstadoID = 1,  -- Activa
    @Biografia = 'Cantante y compositora británica conocida por su poderosa voz y baladas soul';

-- 7. KORN (EEUU)
EXEC sp_InsertarBandaBasica 
    @Nombre = 'Korn',
    @FechaFormacion = '1993-01-01',
    @PaisOrigen = 'Estados Unidos',
    @EstadoID = 1,  -- Activa
    @Biografia = 'Banda estadounidense de nu metal, pionera del género';

-- 8. MARILYN MANSON (EEUU)
EXEC sp_InsertarBandaBasica 
    @Nombre = 'Marilyn Manson',
    @FechaFormacion = '1989-01-01',
    @PaisOrigen = 'Estados Unidos',
    @EstadoID = 1,  -- Activa
    @Biografia = 'Banda estadounidense de metal industrial y rock alternativo';

-- 9. CHAQUEÑO PALAVECINO (Argentina)
EXEC sp_InsertarBandaBasica 
    @Nombre = 'Chaqueño Palavecino',
    @FechaFormacion = '1980-01-01',
    @PaisOrigen = 'Argentina',
    @EstadoID = 1,  -- Activa
    @Biografia = 'Cantante y compositora argentino de folklore y chamamé';

-- 10. SOLEDAD PASTORUTTI (Argentina)
EXEC sp_InsertarBandaBasica 
    @Nombre = 'Soledad Pastorutti',
    @FechaFormacion = '1999-01-01',
    @PaisOrigen = 'Argentina',
    @EstadoID = 1,  -- Activa
    @Biografia = 'Cantante argentina de folklore, conocida como "La Sole"';

-- 11. ABEL PINTOS (Argentina)
EXEC sp_InsertarBandaBasica 
    @Nombre = 'Abel Pintos',
    @FechaFormacion = '1995-01-01',
    @PaisOrigen = 'Argentina',
    @EstadoID = 1,  -- Activa
    @Biografia = 'Cantante y compositor argentino de folklore y pop';

    
-- =============================================
-- ASIGNAR GÉNEROS A LAS BANDAS
-- =============================================

-- Los Piojos (Rock principal, Blues secundario)
EXEC sp_AgregarGeneroABanda @BandaID = 1, @GeneroID = 1, @EsPrincipal = 1; -- Rock
EXEC sp_AgregarGeneroABanda @BandaID = 1, @GeneroID = 8, @EsPrincipal = 0; -- Blues

-- La Mancha de Rolando (Rock principal)
EXEC sp_AgregarGeneroABanda @BandaID = 2, @GeneroID = 1, @EsPrincipal = 1; -- Rock

-- Queen (Rock principal)
EXEC sp_AgregarGeneroABanda @BandaID = 3, @GeneroID = 1, @EsPrincipal = 1; -- Rock

-- Guns and Roses (Rock principal, Metal secundario)
EXEC sp_AgregarGeneroABanda @BandaID = 4, @GeneroID = 1, @EsPrincipal = 1; -- Rock
EXEC sp_AgregarGeneroABanda @BandaID = 4, @GeneroID = 3, @EsPrincipal = 0; -- Metal

-- Britney Spears (Pop principal)
EXEC sp_AgregarGeneroABanda @BandaID = 5, @GeneroID = 2, @EsPrincipal = 1; -- Pop

-- Adele (Pop principal)
EXEC sp_AgregarGeneroABanda @BandaID = 6, @GeneroID = 2, @EsPrincipal = 1; -- Pop

-- Korn (Metal principal)
EXEC sp_AgregarGeneroABanda @BandaID = 7, @GeneroID = 3, @EsPrincipal = 1; -- Metal

-- Marilyn Manson (Metal principal)
EXEC sp_AgregarGeneroABanda @BandaID = 8, @GeneroID = 3, @EsPrincipal = 1; -- Metal

-- Chaqueño Palavecino (Folklore - usar Indie como aproximación)
EXEC sp_AgregarGeneroABanda @BandaID = 9, @GeneroID = 10, @EsPrincipal = 1; -- Indie

-- Soledad Pastorutti (Folklore - usar Indie como aproximación)
EXEC sp_AgregarGeneroABanda @BandaID = 10, @GeneroID = 10, @EsPrincipal = 1; -- Indie

-- Abel Pintos (Folklore/Pop)
EXEC sp_AgregarGeneroABanda @BandaID = 11, @GeneroID = 10, @EsPrincipal = 1; -- Indie
EXEC sp_AgregarGeneroABanda @BandaID = 11, @GeneroID = 2, @EsPrincipal = 0; -- Pop

