CREATE DATABASE SistemaCotizacionPrestamos;
GO

USE SistemaCotizacionPrestamos;
GO

/*=========================================================
    TABLA: Rol
=========================================================*/
CREATE TABLE Rol
(
    IdRol INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Descripcion VARCHAR(150),
    Activo BIT NOT NULL
        DEFAULT 1,
    FechaCreacion DATETIME NOT NULL
        DEFAULT GETDATE(),
    UsuarioCreacion VARCHAR(50) NOT NULL,
    FechaModificacion DATETIME NULL,
    UsuarioModificacion VARCHAR(50) NULL
);
GO

-- CREATE
CREATE PROCEDURE sp_InsertarRol
    @Nombre VARCHAR(50),
    @Descripcion VARCHAR(150) = NULL,
    @UsuarioCreacion VARCHAR(50),
    @Activo BIT = 1
AS
BEGIN
    INSERT INTO Rol (Nombre, Descripcion, Activo, FechaCreacion, UsuarioCreacion)
    VALUES (@Nombre, @Descripcion, @Activo, GETDATE(), @UsuarioCreacion);
    
    SELECT SCOPE_IDENTITY() AS IdRol;
END
GO

-- READ (Todos)
CREATE PROCEDURE sp_ObtenerRoles
AS
BEGIN
    SELECT IdRol, Nombre, Descripcion, Activo, FechaCreacion, UsuarioCreacion, 
           FechaModificacion, UsuarioModificacion
    FROM Rol
    WHERE Activo = 1;
END
GO

-- READ (Por ID)
CREATE PROCEDURE sp_ObtenerRolPorId
    @IdRol INT
AS
BEGIN
    SELECT IdRol, Nombre, Descripcion, Activo, FechaCreacion, UsuarioCreacion, 
           FechaModificacion, UsuarioModificacion
    FROM Rol
    WHERE IdRol = @IdRol;
END
GO

-- UPDATE
CREATE PROCEDURE sp_ActualizarRol
    @IdRol INT,
    @Nombre VARCHAR(50),
    @Descripcion VARCHAR(150) = NULL,
    @UsuarioModificacion VARCHAR(50),
    @Activo BIT
AS
BEGIN
    UPDATE Rol
    SET Nombre = @Nombre,
        Descripcion = @Descripcion,
        Activo = @Activo,
        FechaModificacion = GETDATE(),
        UsuarioModificacion = @UsuarioModificacion
    WHERE IdRol = @IdRol;
    
    SELECT @@ROWCOUNT AS FilasAfectadas;
END
GO

-- DELETE (Lógico)
CREATE PROCEDURE sp_EliminarRol
    @IdRol INT,
    @UsuarioModificacion VARCHAR(50)
AS
BEGIN
    UPDATE Rol
    SET Activo = 0,
        FechaModificacion = GETDATE(),
        UsuarioModificacion = @UsuarioModificacion
    WHERE IdRol = @IdRol;
    
    SELECT @@ROWCOUNT AS FilasAfectadas;
END
GO

/*=========================================================
    TABLA: Genero
=========================================================*/
CREATE TABLE Genero
(
    IdGenero INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(30) NOT NULL,
    Activo BIT NOT NULL
        DEFAULT 1,
    FechaCreacion DATETIME NOT NULL
        DEFAULT GETDATE(),
    UsuarioCreacion VARCHAR(50) NOT NULL,
    FechaModificacion DATETIME NULL,
    UsuarioModificacion VARCHAR(50) NULL
);
GO

-- CREATE
CREATE PROCEDURE sp_InsertarGenero
    @Nombre VARCHAR(30),
    @UsuarioCreacion VARCHAR(50),
    @Activo BIT = 1
AS
BEGIN
    INSERT INTO Genero (Nombre, Activo, FechaCreacion, UsuarioCreacion)
    VALUES (@Nombre, @Activo, GETDATE(), @UsuarioCreacion);
    
    SELECT SCOPE_IDENTITY() AS IdGenero;
END
GO

-- READ (Todos)
CREATE PROCEDURE sp_ObtenerGeneros
AS
BEGIN
    SELECT IdGenero, Nombre, Activo, FechaCreacion, UsuarioCreacion, 
           FechaModificacion, UsuarioModificacion
    FROM Genero
    WHERE Activo = 1;
END
GO

-- READ (Por ID)
CREATE PROCEDURE sp_ObtenerGeneroPorId
    @IdGenero INT
AS
BEGIN
    SELECT IdGenero, Nombre, Activo, FechaCreacion, UsuarioCreacion, 
           FechaModificacion, UsuarioModificacion
    FROM Genero
    WHERE IdGenero = @IdGenero;
END
GO

-- UPDATE
CREATE PROCEDURE sp_ActualizarGenero
    @IdGenero INT,
    @Nombre VARCHAR(30),
    @UsuarioModificacion VARCHAR(50),
    @Activo BIT
AS
BEGIN
    UPDATE Genero
    SET Nombre = @Nombre,
        Activo = @Activo,
        FechaModificacion = GETDATE(),
        UsuarioModificacion = @UsuarioModificacion
    WHERE IdGenero = @IdGenero;
    
    SELECT @@ROWCOUNT AS FilasAfectadas;
END
GO

-- DELETE (Lógico)
CREATE PROCEDURE sp_EliminarGenero
    @IdGenero INT,
    @UsuarioModificacion VARCHAR(50)
AS
BEGIN
    UPDATE Genero
    SET Activo = 0,
        FechaModificacion = GETDATE(),
        UsuarioModificacion = @UsuarioModificacion
    WHERE IdGenero = @IdGenero;
    
    SELECT @@ROWCOUNT AS FilasAfectadas;
END
GO

/*=========================================================
    TABLA: NivelEducativo
=========================================================*/
CREATE TABLE NivelEducativo
(
    IdNivelEducativo INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Activo BIT NOT NULL
        DEFAULT 1,
    FechaCreacion DATETIME NOT NULL
        DEFAULT GETDATE(),
    UsuarioCreacion VARCHAR(50) NOT NULL,
    FechaModificacion DATETIME NULL,
    UsuarioModificacion VARCHAR(50) NULL
);
GO

-- CREATE
CREATE PROCEDURE sp_InsertarNivelEducativo
    @Nombre VARCHAR(50),
    @UsuarioCreacion VARCHAR(50),
    @Activo BIT = 1
AS
BEGIN
    INSERT INTO NivelEducativo (Nombre, Activo, FechaCreacion, UsuarioCreacion)
    VALUES (@Nombre, @Activo, GETDATE(), @UsuarioCreacion);
    
    SELECT SCOPE_IDENTITY() AS IdNivelEducativo;
END
GO

-- READ (Todos)
CREATE PROCEDURE sp_ObtenerNivelesEducativos
AS
BEGIN
    SELECT IdNivelEducativo, Nombre, Activo, FechaCreacion, UsuarioCreacion, 
           FechaModificacion, UsuarioModificacion
    FROM NivelEducativo
    WHERE Activo = 1;
END
GO

-- READ (Por ID)
CREATE PROCEDURE sp_ObtenerNivelEducativoPorId
    @IdNivelEducativo INT
AS
BEGIN
    SELECT IdNivelEducativo, Nombre, Activo, FechaCreacion, UsuarioCreacion, 
           FechaModificacion, UsuarioModificacion
    FROM NivelEducativo
    WHERE IdNivelEducativo = @IdNivelEducativo;
END
GO

-- UPDATE
CREATE PROCEDURE sp_ActualizarNivelEducativo
    @IdNivelEducativo INT,
    @Nombre VARCHAR(50),
    @UsuarioModificacion VARCHAR(50),
    @Activo BIT
AS
BEGIN
    UPDATE NivelEducativo
    SET Nombre = @Nombre,
        Activo = @Activo,
        FechaModificacion = GETDATE(),
        UsuarioModificacion = @UsuarioModificacion
    WHERE IdNivelEducativo = @IdNivelEducativo;
    
    SELECT @@ROWCOUNT AS FilasAfectadas;
END
GO

-- DELETE (Lógico)
CREATE PROCEDURE sp_EliminarNivelEducativo
    @IdNivelEducativo INT,
    @UsuarioModificacion VARCHAR(50)
AS
BEGIN
    UPDATE NivelEducativo
    SET Activo = 0,
        FechaModificacion = GETDATE(),
        UsuarioModificacion = @UsuarioModificacion
    WHERE IdNivelEducativo = @IdNivelEducativo;
    
    SELECT @@ROWCOUNT AS FilasAfectadas;
END
GO

/*=========================================================
    TABLA: RangoEdad
=========================================================*/
CREATE TABLE RangoEdad
(
    IdRangoEdad INT IDENTITY(1,1) PRIMARY KEY,
    EdadMinima INT NOT NULL,
    EdadMaxima INT NOT NULL,
    Descripcion VARCHAR(50),
    Activo BIT NOT NULL
        DEFAULT 1,
    FechaCreacion DATETIME NOT NULL
        DEFAULT GETDATE(),
    UsuarioCreacion VARCHAR(50) NOT NULL,
    FechaModificacion DATETIME NULL,
    UsuarioModificacion VARCHAR(50) NULL
);
GO

-- CREATE
CREATE PROCEDURE sp_InsertarRangoEdad
    @EdadMinima INT,
    @EdadMaxima INT,
    @Descripcion VARCHAR(50) = NULL,
    @UsuarioCreacion VARCHAR(50),
    @Activo BIT = 1
AS
BEGIN
    INSERT INTO RangoEdad (EdadMinima, EdadMaxima, Descripcion, Activo, FechaCreacion, UsuarioCreacion)
    VALUES (@EdadMinima, @EdadMaxima, @Descripcion, @Activo, GETDATE(), @UsuarioCreacion);
    
    SELECT SCOPE_IDENTITY() AS IdRangoEdad;
END
GO

-- READ (Todos)
CREATE PROCEDURE sp_ObtenerRangosEdad
AS
BEGIN
    SELECT IdRangoEdad, EdadMinima, EdadMaxima, Descripcion, Activo, 
           FechaCreacion, UsuarioCreacion, FechaModificacion, UsuarioModificacion
    FROM RangoEdad
    WHERE Activo = 1;
END
GO

-- READ (Por ID)
CREATE PROCEDURE sp_ObtenerRangoEdadPorId
    @IdRangoEdad INT
AS
BEGIN
    SELECT IdRangoEdad, EdadMinima, EdadMaxima, Descripcion, Activo, 
           FechaCreacion, UsuarioCreacion, FechaModificacion, UsuarioModificacion
    FROM RangoEdad
    WHERE IdRangoEdad = @IdRangoEdad;
END
GO

-- UPDATE
CREATE PROCEDURE sp_ActualizarRangoEdad
    @IdRangoEdad INT,
    @EdadMinima INT,
    @EdadMaxima INT,
    @Descripcion VARCHAR(50) = NULL,
    @UsuarioModificacion VARCHAR(50),
    @Activo BIT
AS
BEGIN
    UPDATE RangoEdad
    SET EdadMinima = @EdadMinima,
        EdadMaxima = @EdadMaxima,
        Descripcion = @Descripcion,
        Activo = @Activo,
        FechaModificacion = GETDATE(),
        UsuarioModificacion = @UsuarioModificacion
    WHERE IdRangoEdad = @IdRangoEdad;
    
    SELECT @@ROWCOUNT AS FilasAfectadas;
END
GO

-- DELETE (Lógico)
CREATE PROCEDURE sp_EliminarRangoEdad
    @IdRangoEdad INT,
    @UsuarioModificacion VARCHAR(50)
AS
BEGIN
    UPDATE RangoEdad
    SET Activo = 0,
        FechaModificacion = GETDATE(),
        UsuarioModificacion = @UsuarioModificacion
    WHERE IdRangoEdad = @IdRangoEdad;
    
    SELECT @@ROWCOUNT AS FilasAfectadas;
END
GO

/*=========================================================
    TABLA: RangoIngresos
=========================================================*/
CREATE TABLE RangoIngresos
(
    IdRangoIngresos INT IDENTITY(1,1) PRIMARY KEY,
    IngresoMinimo DECIMAL(10,2) NOT NULL,
    IngresoMaximo DECIMAL(10,2) NOT NULL,
    Descripcion VARCHAR(50),
    Activo BIT NOT NULL
        DEFAULT 1,
    FechaCreacion DATETIME NOT NULL
        DEFAULT GETDATE(),
    UsuarioCreacion VARCHAR(50) NOT NULL,
    FechaModificacion DATETIME NULL,
    UsuarioModificacion VARCHAR(50) NULL
);
GO

-- CREATE
CREATE PROCEDURE sp_InsertarRangoIngresos
    @IngresoMinimo DECIMAL(10,2),
    @IngresoMaximo DECIMAL(10,2),
    @Descripcion VARCHAR(50) = NULL,
    @UsuarioCreacion VARCHAR(50),
    @Activo BIT = 1
AS
BEGIN
    INSERT INTO RangoIngresos (IngresoMinimo, IngresoMaximo, Descripcion, Activo, FechaCreacion, UsuarioCreacion)
    VALUES (@IngresoMinimo, @IngresoMaximo, @Descripcion, @Activo, GETDATE(), @UsuarioCreacion);
    
    SELECT SCOPE_IDENTITY() AS IdRangoIngresos;
END
GO

-- READ (Todos)
CREATE PROCEDURE sp_ObtenerRangosIngresos
AS
BEGIN
    SELECT IdRangoIngresos, IngresoMinimo, IngresoMaximo, Descripcion, Activo, 
           FechaCreacion, UsuarioCreacion, FechaModificacion, UsuarioModificacion
    FROM RangoIngresos
    WHERE Activo = 1;
END
GO

-- READ (Por ID)
CREATE PROCEDURE sp_ObtenerRangoIngresosPorId
    @IdRangoIngresos INT
AS
BEGIN
    SELECT IdRangoIngresos, IngresoMinimo, IngresoMaximo, Descripcion, Activo, 
           FechaCreacion, UsuarioCreacion, FechaModificacion, UsuarioModificacion
    FROM RangoIngresos
    WHERE IdRangoIngresos = @IdRangoIngresos;
END
GO

-- UPDATE
CREATE PROCEDURE sp_ActualizarRangoIngresos
    @IdRangoIngresos INT,
    @IngresoMinimo DECIMAL(10,2),
    @IngresoMaximo DECIMAL(10,2),
    @Descripcion VARCHAR(50) = NULL,
    @UsuarioModificacion VARCHAR(50),
    @Activo BIT
AS
BEGIN
    UPDATE RangoIngresos
    SET IngresoMinimo = @IngresoMinimo,
        IngresoMaximo = @IngresoMaximo,
        Descripcion = @Descripcion,
        Activo = @Activo,
        FechaModificacion = GETDATE(),
        UsuarioModificacion = @UsuarioModificacion
    WHERE IdRangoIngresos = @IdRangoIngresos;
    
    SELECT @@ROWCOUNT AS FilasAfectadas;
END
GO

-- DELETE (Lógico)
CREATE PROCEDURE sp_EliminarRangoIngresos
    @IdRangoIngresos INT,
    @UsuarioModificacion VARCHAR(50)
AS
BEGIN
    UPDATE RangoIngresos
    SET Activo = 0,
        FechaModificacion = GETDATE(),
        UsuarioModificacion = @UsuarioModificacion
    WHERE IdRangoIngresos = @IdRangoIngresos;
    
    SELECT @@ROWCOUNT AS FilasAfectadas;
END
GO

/*=========================================================
    TABLA: TipoPrestamo
=========================================================*/
CREATE TABLE TipoPrestamo
(
    IdTipoPrestamo INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Descripcion VARCHAR(150),
    Activo BIT NOT NULL
        DEFAULT 1,
    FechaCreacion DATETIME NOT NULL
        DEFAULT GETDATE(),
    UsuarioCreacion VARCHAR(50) NOT NULL,
    FechaModificacion DATETIME NULL,
    UsuarioModificacion VARCHAR(50) NULL
);
GO

-- CREATE
CREATE PROCEDURE sp_InsertarTipoPrestamo
    @Nombre VARCHAR(50),
    @Descripcion VARCHAR(150) = NULL,
    @UsuarioCreacion VARCHAR(50),
    @Activo BIT = 1
AS
BEGIN
    INSERT INTO TipoPrestamo (Nombre, Descripcion, Activo, FechaCreacion, UsuarioCreacion)
    VALUES (@Nombre, @Descripcion, @Activo, GETDATE(), @UsuarioCreacion);
    
    SELECT SCOPE_IDENTITY() AS IdTipoPrestamo;
END
GO

-- READ (Todos)
CREATE PROCEDURE sp_ObtenerTiposPrestamo
AS
BEGIN
    SELECT IdTipoPrestamo, Nombre, Descripcion, Activo, 
           FechaCreacion, UsuarioCreacion, FechaModificacion, UsuarioModificacion
    FROM TipoPrestamo
    WHERE Activo = 1;
END
GO

-- READ (Por ID)
CREATE PROCEDURE sp_ObtenerTipoPrestamoPorId
    @IdTipoPrestamo INT
AS
BEGIN
    SELECT IdTipoPrestamo, Nombre, Descripcion, Activo, 
           FechaCreacion, UsuarioCreacion, FechaModificacion, UsuarioModificacion
    FROM TipoPrestamo
    WHERE IdTipoPrestamo = @IdTipoPrestamo;
END
GO

-- UPDATE
CREATE PROCEDURE sp_ActualizarTipoPrestamo
    @IdTipoPrestamo INT,
    @Nombre VARCHAR(50),
    @Descripcion VARCHAR(150) = NULL,
    @UsuarioModificacion VARCHAR(50),
    @Activo BIT
AS
BEGIN
    UPDATE TipoPrestamo
    SET Nombre = @Nombre,
        Descripcion = @Descripcion,
        Activo = @Activo,
        FechaModificacion = GETDATE(),
        UsuarioModificacion = @UsuarioModificacion
    WHERE IdTipoPrestamo = @IdTipoPrestamo;
    
    SELECT @@ROWCOUNT AS FilasAfectadas;
END
GO

-- DELETE (Lógico)
CREATE PROCEDURE sp_EliminarTipoPrestamo
    @IdTipoPrestamo INT,
    @UsuarioModificacion VARCHAR(50)
AS
BEGIN
    UPDATE TipoPrestamo
    SET Activo = 0,
        FechaModificacion = GETDATE(),
        UsuarioModificacion = @UsuarioModificacion
    WHERE IdTipoPrestamo = @IdTipoPrestamo;
    
    SELECT @@ROWCOUNT AS FilasAfectadas;
END
GO

/*=========================================================
    TABLA: Plazo
=========================================================*/
CREATE TABLE Plazo
(
    IdPlazo INT IDENTITY(1,1) PRIMARY KEY,
    Meses INT NOT NULL,
    Descripcion VARCHAR(50),
    Activo BIT NOT NULL
        DEFAULT 1,
    FechaCreacion DATETIME NOT NULL
        DEFAULT GETDATE(),
    UsuarioCreacion VARCHAR(50) NOT NULL,
    FechaModificacion DATETIME NULL,
    UsuarioModificacion VARCHAR(50) NULL
);
GO

-- CREATE
CREATE PROCEDURE sp_InsertarPlazo
    @Meses INT,
    @Descripcion VARCHAR(50) = NULL,
    @UsuarioCreacion VARCHAR(50),
    @Activo BIT = 1
AS
BEGIN
    INSERT INTO Plazo (Meses, Descripcion, Activo, FechaCreacion, UsuarioCreacion)
    VALUES (@Meses, @Descripcion, @Activo, GETDATE(), @UsuarioCreacion);
    
    SELECT SCOPE_IDENTITY() AS IdPlazo;
END
GO

-- READ (Todos)
CREATE PROCEDURE sp_ObtenerPlazos
AS
BEGIN
    SELECT IdPlazo, Meses, Descripcion, Activo, 
           FechaCreacion, UsuarioCreacion, FechaModificacion, UsuarioModificacion
    FROM Plazo
    WHERE Activo = 1;
END
GO

-- READ (Por ID)
CREATE PROCEDURE sp_ObtenerPlazoPorId
    @IdPlazo INT
AS
BEGIN
    SELECT IdPlazo, Meses, Descripcion, Activo, 
           FechaCreacion, UsuarioCreacion, FechaModificacion, UsuarioModificacion
    FROM Plazo
    WHERE IdPlazo = @IdPlazo;
END
GO

-- UPDATE
CREATE PROCEDURE sp_ActualizarPlazo
    @IdPlazo INT,
    @Meses INT,
    @Descripcion VARCHAR(50) = NULL,
    @UsuarioModificacion VARCHAR(50),
    @Activo BIT
AS
BEGIN
    UPDATE Plazo
    SET Meses = @Meses,
        Descripcion = @Descripcion,
        Activo = @Activo,
        FechaModificacion = GETDATE(),
        UsuarioModificacion = @UsuarioModificacion
    WHERE IdPlazo = @IdPlazo;
    
    SELECT @@ROWCOUNT AS FilasAfectadas;
END
GO

-- DELETE (Lógico)
CREATE PROCEDURE sp_EliminarPlazo
    @IdPlazo INT,
    @UsuarioModificacion VARCHAR(50)
AS
BEGIN
    UPDATE Plazo
    SET Activo = 0,
        FechaModificacion = GETDATE(),
        UsuarioModificacion = @UsuarioModificacion
    WHERE IdPlazo = @IdPlazo;
    
    SELECT @@ROWCOUNT AS FilasAfectadas;
END
GO

/*=========================================================
    TABLA: TasaInteres
=========================================================*/
CREATE TABLE TasaInteres
(
    IdTasaInteres INT IDENTITY(1,1) PRIMARY KEY,
    TasaMinima DECIMAL(5,2) NOT NULL,
    TasaMaxima DECIMAL(5,2) NOT NULL,
    Descripcion VARCHAR(50),
    Activo BIT NOT NULL
        DEFAULT 1,
    FechaCreacion DATETIME NOT NULL
        DEFAULT GETDATE(),
    UsuarioCreacion VARCHAR(50) NOT NULL,
    FechaModificacion DATETIME NULL,
    UsuarioModificacion VARCHAR(50) NULL
);
GO

-- CREATE
CREATE PROCEDURE sp_InsertarTasaInteres
    @TasaMinima DECIMAL(5,2),
    @TasaMaxima DECIMAL(5,2),
    @Descripcion VARCHAR(50) = NULL,
    @UsuarioCreacion VARCHAR(50),
    @Activo BIT = 1
AS
BEGIN
    INSERT INTO TasaInteres (TasaMinima, TasaMaxima, Descripcion, Activo, FechaCreacion, UsuarioCreacion)
    VALUES (@TasaMinima, @TasaMaxima, @Descripcion, @Activo, GETDATE(), @UsuarioCreacion);
    
    SELECT SCOPE_IDENTITY() AS IdTasaInteres;
END
GO

-- READ (Todos)
CREATE PROCEDURE sp_ObtenerTasasInteres
AS
BEGIN
    SELECT IdTasaInteres, TasaMinima, TasaMaxima, Descripcion, Activo, 
           FechaCreacion, UsuarioCreacion, FechaModificacion, UsuarioModificacion
    FROM TasaInteres
    WHERE Activo = 1;
END
GO

-- READ (Por ID)
CREATE PROCEDURE sp_ObtenerTasaInteresPorId
    @IdTasaInteres INT
AS
BEGIN
    SELECT IdTasaInteres, TasaMinima, TasaMaxima, Descripcion, Activo, 
           FechaCreacion, UsuarioCreacion, FechaModificacion, UsuarioModificacion
    FROM TasaInteres
    WHERE IdTasaInteres = @IdTasaInteres;
END
GO

-- UPDATE
CREATE PROCEDURE sp_ActualizarTasaInteres
    @IdTasaInteres INT,
    @TasaMinima DECIMAL(5,2),
    @TasaMaxima DECIMAL(5,2),
    @Descripcion VARCHAR(50) = NULL,
    @UsuarioModificacion VARCHAR(50),
    @Activo BIT
AS
BEGIN
    UPDATE TasaInteres
    SET TasaMinima = @TasaMinima,
        TasaMaxima = @TasaMaxima,
        Descripcion = @Descripcion,
        Activo = @Activo,
        FechaModificacion = GETDATE(),
        UsuarioModificacion = @UsuarioModificacion
    WHERE IdTasaInteres = @IdTasaInteres;
    
    SELECT @@ROWCOUNT AS FilasAfectadas;
END
GO

-- DELETE (Lógico)
CREATE PROCEDURE sp_EliminarTasaInteres
    @IdTasaInteres INT,
    @UsuarioModificacion VARCHAR(50)
AS
BEGIN
    UPDATE TasaInteres
    SET Activo = 0,
        FechaModificacion = GETDATE(),
        UsuarioModificacion = @UsuarioModificacion
    WHERE IdTasaInteres = @IdTasaInteres;
    
    SELECT @@ROWCOUNT AS FilasAfectadas;
END
GO

/*=========================================================
    TABLA: CapacidadPago
=========================================================*/
CREATE TABLE CapacidadPago
(
    IdCapacidadPago INT IDENTITY(1,1) PRIMARY KEY,
    PagoMinimo DECIMAL(10,2) NOT NULL,
    PagoMaximo DECIMAL(10,2) NOT NULL,
    Descripcion VARCHAR(50),
    Activo BIT NOT NULL
        DEFAULT 1,
    FechaCreacion DATETIME NOT NULL
        DEFAULT GETDATE(),
    UsuarioCreacion VARCHAR(50) NOT NULL,
    FechaModificacion DATETIME NULL,
    UsuarioModificacion VARCHAR(50) NULL
);
GO

-- CREATE
CREATE PROCEDURE sp_InsertarCapacidadPago
    @PagoMinimo DECIMAL(10,2),
    @PagoMaximo DECIMAL(10,2),
    @Descripcion VARCHAR(50) = NULL,
    @UsuarioCreacion VARCHAR(50),
    @Activo BIT = 1
AS
BEGIN
    INSERT INTO CapacidadPago (PagoMinimo, PagoMaximo, Descripcion, Activo, FechaCreacion, UsuarioCreacion)
    VALUES (@PagoMinimo, @PagoMaximo, @Descripcion, @Activo, GETDATE(), @UsuarioCreacion);
    
    SELECT SCOPE_IDENTITY() AS IdCapacidadPago;
END
GO

-- READ (Todos)
CREATE PROCEDURE sp_ObtenerCapacidadesPago
AS
BEGIN
    SELECT IdCapacidadPago, PagoMinimo, PagoMaximo, Descripcion, Activo, 
           FechaCreacion, UsuarioCreacion, FechaModificacion, UsuarioModificacion
    FROM CapacidadPago
    WHERE Activo = 1;
END
GO

-- READ (Por ID)
CREATE PROCEDURE sp_ObtenerCapacidadPagoPorId
    @IdCapacidadPago INT
AS
BEGIN
    SELECT IdCapacidadPago, PagoMinimo, PagoMaximo, Descripcion, Activo, 
           FechaCreacion, UsuarioCreacion, FechaModificacion, UsuarioModificacion
    FROM CapacidadPago
    WHERE IdCapacidadPago = @IdCapacidadPago;
END
GO

-- UPDATE
CREATE PROCEDURE sp_ActualizarCapacidadPago
    @IdCapacidadPago INT,
    @PagoMinimo DECIMAL(10,2),
    @PagoMaximo DECIMAL(10,2),
    @Descripcion VARCHAR(50) = NULL,
    @UsuarioModificacion VARCHAR(50),
    @Activo BIT
AS
BEGIN
    UPDATE CapacidadPago
    SET PagoMinimo = @PagoMinimo,
        PagoMaximo = @PagoMaximo,
        Descripcion = @Descripcion,
        Activo = @Activo,
        FechaModificacion = GETDATE(),
        UsuarioModificacion = @UsuarioModificacion
    WHERE IdCapacidadPago = @IdCapacidadPago;
    
    SELECT @@ROWCOUNT AS FilasAfectadas;
END
GO

-- DELETE (Lógico)
CREATE PROCEDURE sp_EliminarCapacidadPago
    @IdCapacidadPago INT,
    @UsuarioModificacion VARCHAR(50)
AS
BEGIN
    UPDATE CapacidadPago
    SET Activo = 0,
        FechaModificacion = GETDATE(),
        UsuarioModificacion = @UsuarioModificacion
    WHERE IdCapacidadPago = @IdCapacidadPago;
    
    SELECT @@ROWCOUNT AS FilasAfectadas;
END
GO

/*=========================================================
    TABLA: MedioContratacion
=========================================================*/
CREATE TABLE MedioContratacion
(
    IdMedioContratacion INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Descripcion VARCHAR(150),
    Activo BIT NOT NULL
        DEFAULT 1,
    FechaCreacion DATETIME NOT NULL
        DEFAULT GETDATE(),
    UsuarioCreacion VARCHAR(50) NOT NULL,
    FechaModificacion DATETIME NULL,
    UsuarioModificacion VARCHAR(50) NULL
);
GO

-- CREATE
CREATE PROCEDURE sp_InsertarMedioContratacion
    @Nombre VARCHAR(50),
    @Descripcion VARCHAR(150) = NULL,
    @UsuarioCreacion VARCHAR(50),
    @Activo BIT = 1
AS
BEGIN
    INSERT INTO MedioContratacion (Nombre, Descripcion, Activo, FechaCreacion, UsuarioCreacion)
    VALUES (@Nombre, @Descripcion, @Activo, GETDATE(), @UsuarioCreacion);
    
    SELECT SCOPE_IDENTITY() AS IdMedioContratacion;
END
GO

-- READ (Todos)
CREATE PROCEDURE sp_ObtenerMediosContratacion
AS
BEGIN
    SELECT IdMedioContratacion, Nombre, Descripcion, Activo, 
           FechaCreacion, UsuarioCreacion, FechaModificacion, UsuarioModificacion
    FROM MedioContratacion
    WHERE Activo = 1;
END
GO

-- READ (Por ID)
CREATE PROCEDURE sp_ObtenerMedioContratacionPorId
    @IdMedioContratacion INT
AS
BEGIN
    SELECT IdMedioContratacion, Nombre, Descripcion, Activo, 
           FechaCreacion, UsuarioCreacion, FechaModificacion, UsuarioModificacion
    FROM MedioContratacion
    WHERE IdMedioContratacion = @IdMedioContratacion;
END
GO

-- UPDATE
CREATE PROCEDURE sp_ActualizarMedioContratacion
    @IdMedioContratacion INT,
    @Nombre VARCHAR(50),
    @Descripcion VARCHAR(150) = NULL,
    @UsuarioModificacion VARCHAR(50),
    @Activo BIT
AS
BEGIN
    UPDATE MedioContratacion
    SET Nombre = @Nombre,
        Descripcion = @Descripcion,
        Activo = @Activo,
        FechaModificacion = GETDATE(),
        UsuarioModificacion = @UsuarioModificacion
    WHERE IdMedioContratacion = @IdMedioContratacion;
    
    SELECT @@ROWCOUNT AS FilasAfectadas;
END
GO

-- DELETE (Lógico)
CREATE PROCEDURE sp_EliminarMedioContratacion
    @IdMedioContratacion INT,
    @UsuarioModificacion VARCHAR(50)
AS
BEGIN
    UPDATE MedioContratacion
    SET Activo = 0,
        FechaModificacion = GETDATE(),
        UsuarioModificacion = @UsuarioModificacion
    WHERE IdMedioContratacion = @IdMedioContratacion;
    
    SELECT @@ROWCOUNT AS FilasAfectadas;
END
GO

/*=========================================================
    TABLA: Usuario
=========================================================*/
CREATE TABLE Usuario
(
    IdUsuario INT IDENTITY(1,1) PRIMARY KEY,
    IdRol INT NOT NULL,
    Nombre VARCHAR(100) NOT NULL,
    Correo VARCHAR(100) NOT NULL UNIQUE,
    Usuario VARCHAR(50) NOT NULL UNIQUE,
    Contrasena VARCHAR(255) NOT NULL,
    Activo BIT NOT NULL
        DEFAULT 1,
    FechaCreacion DATETIME NOT NULL
        DEFAULT GETDATE(),
    UsuarioCreacion VARCHAR(50) NOT NULL,
    FechaModificacion DATETIME NULL,
    UsuarioModificacion VARCHAR(50) NULL,
    CONSTRAINT FK_Usuario_Rol
        FOREIGN KEY (IdRol)
        REFERENCES Rol(IdRol)
);
GO

-- CREATE
CREATE PROCEDURE sp_InsertarUsuario
    @IdRol INT,
    @Nombre VARCHAR(100),
    @Correo VARCHAR(100),
    @Usuario VARCHAR(50),
    @Contrasena VARCHAR(255),
    @UsuarioCreacion VARCHAR(50),
    @Activo BIT = 1
AS
BEGIN
    INSERT INTO Usuario (IdRol, Nombre, Correo, Usuario, Contrasena, Activo, FechaCreacion, UsuarioCreacion)
    VALUES (@IdRol, @Nombre, @Correo, @Usuario, @Contrasena, @Activo, GETDATE(), @UsuarioCreacion);
    
    SELECT SCOPE_IDENTITY() AS IdUsuario;
END
GO

-- READ (Todos)
CREATE PROCEDURE sp_ObtenerUsuarios
AS
BEGIN
    SELECT u.IdUsuario, u.IdRol, r.Nombre AS NombreRol, u.Nombre, u.Correo, 
           u.Usuario, u.Contrasena, u.Activo, u.FechaCreacion, u.UsuarioCreacion, 
           u.FechaModificacion, u.UsuarioModificacion
    FROM Usuario u
    INNER JOIN Rol r ON u.IdRol = r.IdRol
    WHERE u.Activo = 1;
END
GO

-- READ (Por ID)
CREATE PROCEDURE sp_ObtenerUsuarioPorId
    @IdUsuario INT
AS
BEGIN
    SELECT u.IdUsuario, u.IdRol, r.Nombre AS NombreRol, u.Nombre, u.Correo, 
           u.Usuario, u.Contrasena, u.Activo, u.FechaCreacion, u.UsuarioCreacion, 
           u.FechaModificacion, u.UsuarioModificacion
    FROM Usuario u
    INNER JOIN Rol r ON u.IdRol = r.IdRol
    WHERE u.IdUsuario = @IdUsuario;
END
GO

-- UPDATE
CREATE PROCEDURE sp_ActualizarUsuario
    @IdUsuario INT,
    @IdRol INT,
    @Nombre VARCHAR(100),
    @Correo VARCHAR(100),
    @Usuario VARCHAR(50),
    @Contrasena VARCHAR(255),
    @UsuarioModificacion VARCHAR(50),
    @Activo BIT
AS
BEGIN
    UPDATE Usuario
    SET IdRol = @IdRol,
        Nombre = @Nombre,
        Correo = @Correo,
        Usuario = @Usuario,
        Contrasena = @Contrasena,
        Activo = @Activo,
        FechaModificacion = GETDATE(),
        UsuarioModificacion = @UsuarioModificacion
    WHERE IdUsuario = @IdUsuario;
    
    SELECT @@ROWCOUNT AS FilasAfectadas;
END
GO

-- DELETE (Lógico)
CREATE PROCEDURE sp_EliminarUsuario
    @IdUsuario INT,
    @UsuarioModificacion VARCHAR(50)
AS
BEGIN
    UPDATE Usuario
    SET Activo = 0,
        FechaModificacion = GETDATE(),
        UsuarioModificacion = @UsuarioModificacion
    WHERE IdUsuario = @IdUsuario;
    
    SELECT @@ROWCOUNT AS FilasAfectadas;
END
GO

/*=========================================================
    TABLA: Cliente
=========================================================*/
CREATE TABLE Cliente
(
    IdCliente INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(80) NOT NULL,
    Apellido VARCHAR(80) NOT NULL,
    Correo VARCHAR(100) NOT NULL,
    Telefono VARCHAR(20) NOT NULL,
    IdGenero INT NOT NULL,
    IdNivelEducativo INT NOT NULL,
    IdRangoEdad INT NOT NULL,
    IdRangoIngresos INT NOT NULL,
    Activo BIT NOT NULL
        DEFAULT 1,
    FechaCreacion DATETIME NOT NULL
        DEFAULT GETDATE(),
    UsuarioCreacion VARCHAR(50) NOT NULL,
    FechaModificacion DATETIME NULL,
    UsuarioModificacion VARCHAR(50) NULL,
    CONSTRAINT FK_Cliente_Genero
        FOREIGN KEY (IdGenero)
        REFERENCES Genero(IdGenero),
    CONSTRAINT FK_Cliente_NivelEducativo
        FOREIGN KEY (IdNivelEducativo)
        REFERENCES NivelEducativo(IdNivelEducativo),
    CONSTRAINT FK_Cliente_RangoEdad
        FOREIGN KEY (IdRangoEdad)
        REFERENCES RangoEdad(IdRangoEdad),
    CONSTRAINT FK_Cliente_RangoIngresos
        FOREIGN KEY (IdRangoIngresos)
        REFERENCES RangoIngresos(IdRangoIngresos)
);
GO

-- CREATE
CREATE PROCEDURE sp_InsertarCliente
    @Nombre VARCHAR(80),
    @Apellido VARCHAR(80),
    @Correo VARCHAR(100),
    @Telefono VARCHAR(20),
    @IdGenero INT,
    @IdNivelEducativo INT,
    @IdRangoEdad INT,
    @IdRangoIngresos INT,
    @UsuarioCreacion VARCHAR(50),
    @Activo BIT = 1
AS
BEGIN
    INSERT INTO Cliente (Nombre, Apellido, Correo, Telefono, IdGenero, IdNivelEducativo, 
                         IdRangoEdad, IdRangoIngresos, Activo, FechaCreacion, UsuarioCreacion)
    VALUES (@Nombre, @Apellido, @Correo, @Telefono, @IdGenero, @IdNivelEducativo, 
            @IdRangoEdad, @IdRangoIngresos, @Activo, GETDATE(), @UsuarioCreacion);
    
    SELECT SCOPE_IDENTITY() AS IdCliente;
END
GO

-- READ (Todos)
CREATE PROCEDURE sp_ObtenerClientes
AS
BEGIN
    SELECT c.IdCliente, c.Nombre, c.Apellido, c.Correo, c.Telefono, 
           c.IdGenero, g.Nombre AS NombreGenero,
           c.IdNivelEducativo, ne.Nombre AS NombreNivelEducativo,
           c.IdRangoEdad, re.Descripcion AS DescripcionRangoEdad,
           c.IdRangoIngresos, ri.Descripcion AS DescripcionRangoIngresos,
           c.Activo, c.FechaCreacion, c.UsuarioCreacion, 
           c.FechaModificacion, c.UsuarioModificacion
    FROM Cliente c
    INNER JOIN Genero g ON c.IdGenero = g.IdGenero
    INNER JOIN NivelEducativo ne ON c.IdNivelEducativo = ne.IdNivelEducativo
    INNER JOIN RangoEdad re ON c.IdRangoEdad = re.IdRangoEdad
    INNER JOIN RangoIngresos ri ON c.IdRangoIngresos = ri.IdRangoIngresos
    WHERE c.Activo = 1;
END
GO

-- READ (Por ID)
CREATE PROCEDURE sp_ObtenerClientePorId
    @IdCliente INT
AS
BEGIN
    SELECT c.IdCliente, c.Nombre, c.Apellido, c.Correo, c.Telefono, 
           c.IdGenero, g.Nombre AS NombreGenero,
           c.IdNivelEducativo, ne.Nombre AS NombreNivelEducativo,
           c.IdRangoEdad, re.Descripcion AS DescripcionRangoEdad,
           c.IdRangoIngresos, ri.Descripcion AS DescripcionRangoIngresos,
           c.Activo, c.FechaCreacion, c.UsuarioCreacion, 
           c.FechaModificacion, c.UsuarioModificacion
    FROM Cliente c
    INNER JOIN Genero g ON c.IdGenero = g.IdGenero
    INNER JOIN NivelEducativo ne ON c.IdNivelEducativo = ne.IdNivelEducativo
    INNER JOIN RangoEdad re ON c.IdRangoEdad = re.IdRangoEdad
    INNER JOIN RangoIngresos ri ON c.IdRangoIngresos = ri.IdRangoIngresos
    WHERE c.IdCliente = @IdCliente;
END
GO

-- UPDATE
CREATE PROCEDURE sp_ActualizarCliente
    @IdCliente INT,
    @Nombre VARCHAR(80),
    @Apellido VARCHAR(80),
    @Correo VARCHAR(100),
    @Telefono VARCHAR(20),
    @IdGenero INT,
    @IdNivelEducativo INT,
    @IdRangoEdad INT,
    @IdRangoIngresos INT,
    @UsuarioModificacion VARCHAR(50),
    @Activo BIT
AS
BEGIN
    UPDATE Cliente
    SET Nombre = @Nombre,
        Apellido = @Apellido,
        Correo = @Correo,
        Telefono = @Telefono,
        IdGenero = @IdGenero,
        IdNivelEducativo = @IdNivelEducativo,
        IdRangoEdad = @IdRangoEdad,
        IdRangoIngresos = @IdRangoIngresos,
        Activo = @Activo,
        FechaModificacion = GETDATE(),
        UsuarioModificacion = @UsuarioModificacion
    WHERE IdCliente = @IdCliente;
    
    SELECT @@ROWCOUNT AS FilasAfectadas;
END
GO

-- DELETE (Lógico)
CREATE PROCEDURE sp_EliminarCliente
    @IdCliente INT,
    @UsuarioModificacion VARCHAR(50)
AS
BEGIN
    UPDATE Cliente
    SET Activo = 0,
        FechaModificacion = GETDATE(),
        UsuarioModificacion = @UsuarioModificacion
    WHERE IdCliente = @IdCliente;
    
    SELECT @@ROWCOUNT AS FilasAfectadas;
END
GO

/*=========================================================
    TABLA: Pregunta
=========================================================*/
CREATE TABLE Pregunta
(
    IdPregunta INT IDENTITY(1,1) PRIMARY KEY,
    TextoPregunta VARCHAR(300) NOT NULL,
    Categoria VARCHAR(100) NOT NULL,
    TipoControl VARCHAR(50) NOT NULL,
    Obligatoria BIT NOT NULL
        DEFAULT 1,
    Activo BIT NOT NULL
        DEFAULT 1,
    FechaCreacion DATETIME NOT NULL
        DEFAULT GETDATE(),
    UsuarioCreacion VARCHAR(50) NOT NULL,
    FechaModificacion DATETIME NULL,
    UsuarioModificacion VARCHAR(50) NULL
);
GO

-- CREATE
CREATE PROCEDURE sp_InsertarPregunta
    @TextoPregunta VARCHAR(300),
    @Categoria VARCHAR(100),
    @TipoControl VARCHAR(50),
    @Obligatoria BIT = 1,
    @UsuarioCreacion VARCHAR(50),
    @Activo BIT = 1
AS
BEGIN
    INSERT INTO Pregunta (TextoPregunta, Categoria, TipoControl, Obligatoria, Activo, FechaCreacion, UsuarioCreacion)
    VALUES (@TextoPregunta, @Categoria, @TipoControl, @Obligatoria, @Activo, GETDATE(), @UsuarioCreacion);
    
    SELECT SCOPE_IDENTITY() AS IdPregunta;
END
GO

-- READ (Todos)
CREATE PROCEDURE sp_ObtenerPreguntas
AS
BEGIN
    SELECT IdPregunta, TextoPregunta, Categoria, TipoControl, Obligatoria, Activo, 
           FechaCreacion, UsuarioCreacion, FechaModificacion, UsuarioModificacion
    FROM Pregunta
    WHERE Activo = 1;
END
GO

-- READ (Por ID)
CREATE PROCEDURE sp_ObtenerPreguntaPorId
    @IdPregunta INT
AS
BEGIN
    SELECT IdPregunta, TextoPregunta, Categoria, TipoControl, Obligatoria, Activo, 
           FechaCreacion, UsuarioCreacion, FechaModificacion, UsuarioModificacion
    FROM Pregunta
    WHERE IdPregunta = @IdPregunta;
END
GO

-- UPDATE
CREATE PROCEDURE sp_ActualizarPregunta
    @IdPregunta INT,
    @TextoPregunta VARCHAR(300),
    @Categoria VARCHAR(100),
    @TipoControl VARCHAR(50),
    @Obligatoria BIT,
    @UsuarioModificacion VARCHAR(50),
    @Activo BIT
AS
BEGIN
    UPDATE Pregunta
    SET TextoPregunta = @TextoPregunta,
        Categoria = @Categoria,
        TipoControl = @TipoControl,
        Obligatoria = @Obligatoria,
        Activo = @Activo,
        FechaModificacion = GETDATE(),
        UsuarioModificacion = @UsuarioModificacion
    WHERE IdPregunta = @IdPregunta;
    
    SELECT @@ROWCOUNT AS FilasAfectadas;
END
GO

-- DELETE (Lógico)
CREATE PROCEDURE sp_EliminarPregunta
    @IdPregunta INT,
    @UsuarioModificacion VARCHAR(50)
AS
BEGIN
    UPDATE Pregunta
    SET Activo = 0,
        FechaModificacion = GETDATE(),
        UsuarioModificacion = @UsuarioModificacion
    WHERE IdPregunta = @IdPregunta;
    
    SELECT @@ROWCOUNT AS FilasAfectadas;
END
GO

/*=========================================================
    TABLA: Encuesta
=========================================================*/
CREATE TABLE Encuesta
(
    IdEncuesta INT IDENTITY(1,1) PRIMARY KEY,
    FechaEncuesta DATETIME NOT NULL
        DEFAULT GETDATE(),
    IdCliente INT NOT NULL,
    IdUsuario INT NOT NULL,
    IdTipoPrestamo INT NOT NULL,
    IdPlazo INT NOT NULL,
    IdTasaInteres INT NOT NULL,
    IdCapacidadPago INT NOT NULL,
    IdMedioContratacion INT NOT NULL,
    Activo BIT NOT NULL
        DEFAULT 1,
    FechaCreacion DATETIME NOT NULL
        DEFAULT GETDATE(),
    UsuarioCreacion VARCHAR(50) NOT NULL,
    FechaModificacion DATETIME NULL,
    UsuarioModificacion VARCHAR(50) NULL,
    CONSTRAINT FK_Encuesta_Cliente
        FOREIGN KEY (IdCliente)
        REFERENCES Cliente(IdCliente),
    CONSTRAINT FK_Encuesta_Usuario
        FOREIGN KEY (IdUsuario)
        REFERENCES Usuario(IdUsuario),
    CONSTRAINT FK_Encuesta_TipoPrestamo
        FOREIGN KEY (IdTipoPrestamo)
        REFERENCES TipoPrestamo(IdTipoPrestamo),
    CONSTRAINT FK_Encuesta_Plazo
        FOREIGN KEY (IdPlazo)
        REFERENCES Plazo(IdPlazo),
    CONSTRAINT FK_Encuesta_TasaInteres
        FOREIGN KEY (IdTasaInteres)
        REFERENCES TasaInteres(IdTasaInteres),
    CONSTRAINT FK_Encuesta_CapacidadPago
        FOREIGN KEY (IdCapacidadPago)
        REFERENCES CapacidadPago(IdCapacidadPago),
    CONSTRAINT FK_Encuesta_MedioContratacion
        FOREIGN KEY (IdMedioContratacion)
        REFERENCES MedioContratacion(IdMedioContratacion)
);
GO

-- CREATE
CREATE PROCEDURE sp_InsertarEncuesta
    @IdCliente INT,
    @IdUsuario INT,
    @IdTipoPrestamo INT,
    @IdPlazo INT,
    @IdTasaInteres INT,
    @IdCapacidadPago INT,
    @IdMedioContratacion INT,
    @UsuarioCreacion VARCHAR(50),
    @Activo BIT = 1
AS
BEGIN
    INSERT INTO Encuesta (FechaEncuesta, IdCliente, IdUsuario, IdTipoPrestamo, IdPlazo, 
                          IdTasaInteres, IdCapacidadPago, IdMedioContratacion, Activo, 
                          FechaCreacion, UsuarioCreacion)
    VALUES (GETDATE(), @IdCliente, @IdUsuario, @IdTipoPrestamo, @IdPlazo, 
            @IdTasaInteres, @IdCapacidadPago, @IdMedioContratacion, @Activo, 
            GETDATE(), @UsuarioCreacion);
    
    SELECT SCOPE_IDENTITY() AS IdEncuesta;
END
GO

-- READ (Todos)
CREATE PROCEDURE sp_ObtenerEncuestas
AS
BEGIN
    SELECT e.IdEncuesta, e.FechaEncuesta, e.IdCliente, 
           c.Nombre + ' ' + c.Apellido AS NombreCliente,
           e.IdUsuario, u.Nombre AS NombreUsuario,
           e.IdTipoPrestamo, tp.Nombre AS NombreTipoPrestamo,
           e.IdPlazo, p.Meses AS MesesPlazo,
           e.IdTasaInteres, ti.Descripcion AS DescripcionTasaInteres,
           e.IdCapacidadPago, cp.Descripcion AS DescripcionCapacidadPago,
           e.IdMedioContratacion, mc.Nombre AS NombreMedioContratacion,
           e.Activo, e.FechaCreacion, e.UsuarioCreacion, 
           e.FechaModificacion, e.UsuarioModificacion
    FROM Encuesta e
    INNER JOIN Cliente c ON e.IdCliente = c.IdCliente
    INNER JOIN Usuario u ON e.IdUsuario = u.IdUsuario
    INNER JOIN TipoPrestamo tp ON e.IdTipoPrestamo = tp.IdTipoPrestamo
    INNER JOIN Plazo p ON e.IdPlazo = p.IdPlazo
    INNER JOIN TasaInteres ti ON e.IdTasaInteres = ti.IdTasaInteres
    INNER JOIN CapacidadPago cp ON e.IdCapacidadPago = cp.IdCapacidadPago
    INNER JOIN MedioContratacion mc ON e.IdMedioContratacion = mc.IdMedioContratacion
    WHERE e.Activo = 1;
END
GO

-- READ (Por ID)
CREATE PROCEDURE sp_ObtenerEncuestaPorId
    @IdEncuesta INT
AS
BEGIN
    SELECT e.IdEncuesta, e.FechaEncuesta, e.IdCliente, 
           c.Nombre + ' ' + c.Apellido AS NombreCliente,
           e.IdUsuario, u.Nombre AS NombreUsuario,
           e.IdTipoPrestamo, tp.Nombre AS NombreTipoPrestamo,
           e.IdPlazo, p.Meses AS MesesPlazo,
           e.IdTasaInteres, ti.Descripcion AS DescripcionTasaInteres,
           e.IdCapacidadPago, cp.Descripcion AS DescripcionCapacidadPago,
           e.IdMedioContratacion, mc.Nombre AS NombreMedioContratacion,
           e.Activo, e.FechaCreacion, e.UsuarioCreacion, 
           e.FechaModificacion, e.UsuarioModificacion
    FROM Encuesta e
    INNER JOIN Cliente c ON e.IdCliente = c.IdCliente
    INNER JOIN Usuario u ON e.IdUsuario = u.IdUsuario
    INNER JOIN TipoPrestamo tp ON e.IdTipoPrestamo = tp.IdTipoPrestamo
    INNER JOIN Plazo p ON e.IdPlazo = p.IdPlazo
    INNER JOIN TasaInteres ti ON e.IdTasaInteres = ti.IdTasaInteres
    INNER JOIN CapacidadPago cp ON e.IdCapacidadPago = cp.IdCapacidadPago
    INNER JOIN MedioContratacion mc ON e.IdMedioContratacion = mc.IdMedioContratacion
    WHERE e.IdEncuesta = @IdEncuesta;
END
GO

-- UPDATE
CREATE PROCEDURE sp_ActualizarEncuesta
    @IdEncuesta INT,
    @IdCliente INT,
    @IdUsuario INT,
    @IdTipoPrestamo INT,
    @IdPlazo INT,
    @IdTasaInteres INT,
    @IdCapacidadPago INT,
    @IdMedioContratacion INT,
    @UsuarioModificacion VARCHAR(50),
    @Activo BIT
AS
BEGIN
    UPDATE Encuesta
    SET IdCliente = @IdCliente,
        IdUsuario = @IdUsuario,
        IdTipoPrestamo = @IdTipoPrestamo,
        IdPlazo = @IdPlazo,
        IdTasaInteres = @IdTasaInteres,
        IdCapacidadPago = @IdCapacidadPago,
        IdMedioContratacion = @IdMedioContratacion,
        Activo = @Activo,
        FechaModificacion = GETDATE(),
        UsuarioModificacion = @UsuarioModificacion
    WHERE IdEncuesta = @IdEncuesta;
    
    SELECT @@ROWCOUNT AS FilasAfectadas;
END
GO

-- DELETE (Lógico)
CREATE PROCEDURE sp_EliminarEncuesta
    @IdEncuesta INT,
    @UsuarioModificacion VARCHAR(50)
AS
BEGIN
    UPDATE Encuesta
    SET Activo = 0,
        FechaModificacion = GETDATE(),
        UsuarioModificacion = @UsuarioModificacion
    WHERE IdEncuesta = @IdEncuesta;
    
    SELECT @@ROWCOUNT AS FilasAfectadas;
END
GO

/*=========================================================
    TABLA: Respuesta
=========================================================*/
CREATE TABLE Respuesta
(
    IdRespuesta INT IDENTITY(1,1) PRIMARY KEY,
    IdEncuesta INT NOT NULL,
    IdPregunta INT NOT NULL,
    Valor VARCHAR(500) NOT NULL,
    Activo BIT NOT NULL
        DEFAULT 1,
    FechaCreacion DATETIME NOT NULL
        DEFAULT GETDATE(),
    UsuarioCreacion VARCHAR(50) NOT NULL,
    FechaModificacion DATETIME NULL,
    UsuarioModificacion VARCHAR(50) NULL,
    CONSTRAINT FK_Respuesta_Encuesta
        FOREIGN KEY (IdEncuesta)
        REFERENCES Encuesta(IdEncuesta),
    CONSTRAINT FK_Respuesta_Pregunta
        FOREIGN KEY (IdPregunta)
        REFERENCES Pregunta(IdPregunta)
);
GO

-- CREATE
CREATE PROCEDURE sp_InsertarRespuesta
    @IdEncuesta INT,
    @IdPregunta INT,
    @Valor VARCHAR(500),
    @UsuarioCreacion VARCHAR(50),
    @Activo BIT = 1
AS
BEGIN
    INSERT INTO Respuesta (IdEncuesta, IdPregunta, Valor, Activo, FechaCreacion, UsuarioCreacion)
    VALUES (@IdEncuesta, @IdPregunta, @Valor, @Activo, GETDATE(), @UsuarioCreacion);
    
    SELECT SCOPE_IDENTITY() AS IdRespuesta;
END
GO

-- READ (Todos)
CREATE PROCEDURE sp_ObtenerRespuestas
AS
BEGIN
    SELECT r.IdRespuesta, r.IdEncuesta, r.IdPregunta, 
           p.TextoPregunta, r.Valor, r.Activo, 
           r.FechaCreacion, r.UsuarioCreacion, 
           r.FechaModificacion, r.UsuarioModificacion
    FROM Respuesta r
    INNER JOIN Pregunta p ON r.IdPregunta = p.IdPregunta
    WHERE r.Activo = 1;
END
GO

-- READ (Por ID)
CREATE PROCEDURE sp_ObtenerRespuestaPorId
    @IdRespuesta INT
AS
BEGIN
    SELECT r.IdRespuesta, r.IdEncuesta, r.IdPregunta, 
           p.TextoPregunta, r.Valor, r.Activo, 
           r.FechaCreacion, r.UsuarioCreacion, 
           r.FechaModificacion, r.UsuarioModificacion
    FROM Respuesta r
    INNER JOIN Pregunta p ON r.IdPregunta = p.IdPregunta
    WHERE r.IdRespuesta = @IdRespuesta;
END
GO

-- READ (Por Encuesta)
CREATE PROCEDURE sp_ObtenerRespuestasPorEncuesta
    @IdEncuesta INT
AS
BEGIN
    SELECT r.IdRespuesta, r.IdEncuesta, r.IdPregunta, 
           p.TextoPregunta, p.Categoria, p.TipoControl,
           r.Valor, r.Activo, 
           r.FechaCreacion, r.UsuarioCreacion, 
           r.FechaModificacion, r.UsuarioModificacion
    FROM Respuesta r
    INNER JOIN Pregunta p ON r.IdPregunta = p.IdPregunta
    WHERE r.IdEncuesta = @IdEncuesta AND r.Activo = 1;
END
GO

-- UPDATE
CREATE PROCEDURE sp_ActualizarRespuesta
    @IdRespuesta INT,
    @IdEncuesta INT,
    @IdPregunta INT,
    @Valor VARCHAR(500),
    @UsuarioModificacion VARCHAR(50),
    @Activo BIT
AS
BEGIN
    UPDATE Respuesta
    SET IdEncuesta = @IdEncuesta,
        IdPregunta = @IdPregunta,
        Valor = @Valor,
        Activo = @Activo,
        FechaModificacion = GETDATE(),
        UsuarioModificacion = @UsuarioModificacion
    WHERE IdRespuesta = @IdRespuesta;
    
    SELECT @@ROWCOUNT AS FilasAfectadas;
END
GO

-- DELETE (Lógico)
CREATE PROCEDURE sp_EliminarRespuesta
    @IdRespuesta INT,
    @UsuarioModificacion VARCHAR(50)
AS
BEGIN
    UPDATE Respuesta
    SET Activo = 0,
        FechaModificacion = GETDATE(),
        UsuarioModificacion = @UsuarioModificacion
    WHERE IdRespuesta = @IdRespuesta;
    
    SELECT @@ROWCOUNT AS FilasAfectadas;
END
GO
------------------------
----------------------

CREATE PROCEDURE sp_Login
    @Usuario VARCHAR(50),
    @Contrasena VARCHAR(255)
AS
BEGIN
 
    SELECT
        u.IdUsuario,
        u.Nombre,
        u.Usuario,
        u.IdRol,
        r.Nombre AS Rol
    FROM Usuario u
    INNER JOIN Rol r
        ON u.IdRol = r.IdRol
    WHERE u.Usuario = @Usuario
    AND u.Contrasena = @Contrasena
    AND u.Activo = 1;
 
END
GO

EXEC sp_Login
'admin',
'12345'

--Poblar tabla pregunta

INSERT INTO Pregunta
(TextoPregunta, Categoria, TipoControl, Obligatoria, Activo, FechaCreacion, UsuarioCreacion)
VALUES
('¿Cuál es su género?', 'Datos Generales', 'RadioButtonList', 1, 1, GETDATE(), 'Administrador'),
 
('¿Cuál es su rango de edad?', 'Datos Generales', 'DropDownList', 1, 1, GETDATE(), 'Administrador'),
 
('¿Cuál es su nivel educativo?', 'Datos Generales', 'DropDownList', 1, 1, GETDATE(), 'Administrador'),
 
('¿Cuál es su rango de ingresos mensuales?', 'Datos Generales', 'DropDownList', 1, 1, GETDATE(), 'Administrador'),
 
('¿Qué tipo de préstamo desea solicitar?', 'Tipo Préstamo', 'DropDownList', 1, 1, GETDATE(), 'Administrador'),
 
('¿Qué monto desea solicitar?', 'Monto', 'DropDownList', 1, 1, GETDATE(), 'Administrador'),
 
('¿Qué plazo prefiere?', 'Plazo', 'DropDownList', 1, 1, GETDATE(), 'Administrador'),
 
('¿Qué tasa de interés aceptaría?', 'Tasa', 'DropDownList', 1, 1, GETDATE(), 'Administrador'),
 
('¿Cuál es su capacidad de pago mensual?', 'Capacidad Pago', 'DropDownList', 1, 1, GETDATE(), 'Administrador'),
 
('¿Ha tenido préstamos anteriormente?', 'Historial', 'RadioButtonList', 1, 1, GETDATE(), 'Administrador'),
 
('¿Ha estado en mora anteriormente?', 'Historial', 'RadioButtonList', 1, 1, GETDATE(), 'Administrador'),
 
('¿Cuál es su medio de contratación preferido?', 'Contratación', 'CheckBoxList', 1, 1, GETDATE(), 'Administrador'),
 
('¿Tiene empleo fijo?', 'Laboral', 'RadioButtonList', 1, 1, GETDATE(), 'Administrador'),
 
('¿Cuánto tiempo tiene de laborar?', 'Laboral', 'DropDownList', 1, 1, GETDATE(), 'Administrador'),
 
('¿Posee vivienda propia?', 'Patrimonio', 'RadioButtonList', 1, 1, GETDATE(), 'Administrador'),
 
('¿Tiene otras deudas activas?', 'Finanzas', 'RadioButtonList', 1, 1, GETDATE(), 'Administrador'),
 
('¿Cuántas personas dependen económicamente de usted?', 'Familia', 'DropDownList', 1, 1, GETDATE(), 'Administrador'),
 
('¿Cuenta con un fiador?', 'Garantía', 'RadioButtonList', 1, 1, GETDATE(), 'Administrador'),
 
('¿Acepta recibir promociones por correo?', 'Preferencias', 'RadioButtonList', 1, 1, GETDATE(), 'Administrador'),
 
('¿Desea recibir futuras ofertas de préstamos?', 'Preferencias', 'RadioButtonList', 1, 1, GETDATE(), 'Administrador');


--REPORTES 
USE SistemaCotizacionPrestamos;
GO
 
CREATE PROCEDURE dbo.sp_ReporteTipoPrestamo
AS
BEGIN
    SET NOCOUNT ON;
 
    SELECT
        TP.Nombre AS TipoPrestamo,
        COUNT(*) AS Cantidad
    FROM dbo.Encuesta E
    INNER JOIN dbo.TipoPrestamo TP
        ON E.IdTipoPrestamo = TP.IdTipoPrestamo
    WHERE E.Activo = 1
    GROUP BY TP.Nombre
    ORDER BY Cantidad DESC;
END
GO

CREATE OR ALTER PROCEDURE sp_ReporteGenero
AS
BEGIN
    SET NOCOUNT ON;
 
    SELECT
        G.Nombre AS Genero,
        COUNT(*) AS Cantidad
    FROM Respuesta R
    INNER JOIN Genero G
        ON R.Valor = CAST(G.IdGenero AS VARCHAR(10))
    WHERE R.IdPregunta = 1
    GROUP BY G.Nombre
    ORDER BY Cantidad DESC;
END
GO

CREATE OR ALTER PROCEDURE sp_ReporteNivelEducativo
AS
BEGIN
    SET NOCOUNT ON;
 
    SELECT
        N.Nombre AS NivelEducativo,
        COUNT(*) AS Cantidad
    FROM Respuesta R
        INNER JOIN NivelEducativo N
            ON TRY_CAST(R.Valor AS INT)=N.IdNivelEducativo
    WHERE R.IdPregunta = 3
    GROUP BY N.Nombre
    ORDER BY Cantidad DESC;
END
GO

CREATE OR ALTER PROCEDURE sp_ReporteRangoEdad
AS
BEGIN
    SET NOCOUNT ON;
 
    SELECT
        RE.Descripcion AS RangoEdad,
        COUNT(*) AS Cantidad
    FROM Respuesta R
        INNER JOIN Pregunta P
            ON R.IdPregunta = P.IdPregunta
        INNER JOIN RangoEdad RE
            ON TRY_CAST(R.Valor AS INT) = RE.IdRangoEdad
    WHERE P.IdPregunta = 2
      AND R.Activo = 1
    GROUP BY RE.Descripcion
    ORDER BY Cantidad DESC;
END
GO

CREATE OR ALTER PROCEDURE sp_ReporteRangoIngresos
AS
BEGIN
    SET NOCOUNT ON;
 
    SELECT
        RI.Descripcion AS RangoIngresos,
        COUNT(*) AS Cantidad
    FROM Respuesta R
        INNER JOIN Pregunta P
            ON R.IdPregunta = P.IdPregunta
        INNER JOIN RangoIngresos RI
            ON TRY_CAST(R.Valor AS INT) = RI.IdRangoIngresos
    WHERE P.IdPregunta = 4
      AND R.Activo = 1
    GROUP BY RI.Descripcion
    ORDER BY Cantidad DESC;
END
GO
CREATE OR ALTER PROCEDURE sp_ReporteTasaInteres
AS
BEGIN
    SET NOCOUNT ON;
 
    SELECT
        T.Descripcion AS TasaInteres,
        COUNT(*) AS Cantidad
    FROM Encuesta E
    INNER JOIN TasaInteres T
        ON E.IdTasaInteres = T.IdTasaInteres
    WHERE E.Activo = 1
    GROUP BY T.Descripcion
    ORDER BY Cantidad DESC;
END
GO


CREATE OR ALTER PROCEDURE sp_ReporteCapacidadPago
AS
BEGIN
    SET NOCOUNT ON;
 
    SELECT
        C.Descripcion AS CapacidadPago,
        COUNT(*) AS Cantidad
    FROM Encuesta E
    INNER JOIN CapacidadPago C
        ON E.IdCapacidadPago = C.IdCapacidadPago
    WHERE E.Activo = 1
    GROUP BY C.Descripcion
    ORDER BY Cantidad DESC;
END
GO

CREATE OR ALTER PROCEDURE sp_ReporteMedioContratacion
AS
BEGIN
    SET NOCOUNT ON;
 
    SELECT
        M.Descripcion AS MedioContratacion,
        COUNT(*) AS Cantidad
    FROM Encuesta E
    INNER JOIN MedioContratacion M
        ON E.IdMedioContratacion = M.IdMedioContratacion
    WHERE E.Activo = 1
    GROUP BY M.Descripcion
    ORDER BY Cantidad DESC;
END
GO

CREATE OR ALTER PROCEDURE sp_ReportePlazo
AS
BEGIN
    SET NOCOUNT ON;
 
    SELECT
        P.Descripcion AS Plazo,
        COUNT(*) AS Cantidad
    FROM Encuesta E
    INNER JOIN Plazo P
        ON E.IdPlazo = P.IdPlazo
    WHERE E.Activo = 1
    GROUP BY P.Descripcion
    ORDER BY Cantidad DESC;
END
GO

CREATE OR ALTER PROCEDURE sp_ReporteCliente
AS
BEGIN
    SET NOCOUNT ON;
 
    SELECT
        C.Nombre AS Cliente,
        COUNT(*) AS Cantidad
    FROM Encuesta E
    INNER JOIN Cliente C
        ON E.IdCliente = C.IdCliente
    WHERE E.Activo = 1
    GROUP BY C.Nombre
    ORDER BY Cantidad DESC;
END
GO

CREATE OR ALTER PROCEDURE sp_P1_TipoPrestamoPorRangoEdad
AS
BEGIN
    SET NOCOUNT ON;
 
    SELECT
        RE.Descripcion AS RangoEdad,
        TP.Nombre AS TipoPrestamo,
        COUNT(*) AS Cantidad
    FROM Encuesta E
    INNER JOIN Cliente C
        ON E.IdCliente = C.IdCliente
    INNER JOIN RangoEdad RE
        ON C.IdRangoEdad = RE.IdRangoEdad
    INNER JOIN TipoPrestamo TP
        ON E.IdTipoPrestamo = TP.IdTipoPrestamo
    WHERE E.Activo = 1
    GROUP BY
        RE.Descripcion,
        TP.Nombre
    ORDER BY
        RE.Descripcion,
        Cantidad DESC;
END
GO

CREATE OR ALTER PROCEDURE sp_P2_PlazoIngresosAltos
AS
BEGIN
    SET NOCOUNT ON;
 
    SELECT
        P.Descripcion AS Plazo,
        COUNT(*) AS Cantidad
    FROM Encuesta E
    INNER JOIN Cliente C
        ON E.IdCliente = C.IdCliente
    INNER JOIN RangoIngresos RI
        ON C.IdRangoIngresos = RI.IdRangoIngresos
    INNER JOIN Plazo P
        ON E.IdPlazo = P.IdPlazo
    WHERE RI.IngresoMinimo >= 2000000
    GROUP BY P.Descripcion
    ORDER BY Cantidad DESC;
END
GO

CREATE OR ALTER PROCEDURE sp_P3_PlazosMayores36
AS
BEGIN
    SET NOCOUNT ON;
 
    SELECT
        'Más de 36 meses' AS Categoria,
        CAST(
            SUM(CASE WHEN P.Meses > 36 THEN 1 ELSE 0 END) * 100.0 /
            COUNT(*) AS DECIMAL(10,2)
        ) AS Porcentaje
    FROM Encuesta E
    INNER JOIN Plazo P
        ON E.IdPlazo = P.IdPlazo;
END
GO

CREATE OR ALTER PROCEDURE sp_P5_IngresosBajosTasaAlta
AS
BEGIN
    SET NOCOUNT ON;
 
    SELECT
        RI.Descripcion AS RangoIngresos,
        COUNT(*) AS Cantidad
    FROM Encuesta E
        INNER JOIN Cliente C
            ON E.IdCliente = C.IdCliente
        INNER JOIN RangoIngresos RI
            ON C.IdRangoIngresos = RI.IdRangoIngresos
        INNER JOIN TasaInteres T
            ON E.IdTasaInteres = T.IdTasaInteres
    WHERE
        C.IdRangoIngresos = 1
        AND T.TasaMaxima > 10
    GROUP BY RI.Descripcion;
END
GO

CREATE OR ALTER PROCEDURE sp_P6_NivelEducativoPrestamoEducativo
AS
BEGIN
    SET NOCOUNT ON;
 
    SELECT
        N.Nombre AS NivelEducativo,
        COUNT(*) AS Cantidad
    FROM Encuesta E
        INNER JOIN Cliente C
            ON E.IdCliente = C.IdCliente
        INNER JOIN NivelEducativo N
            ON C.IdNivelEducativo = N.IdNivelEducativo
    WHERE E.IdTipoPrestamo = 4
    GROUP BY N.Nombre
    ORDER BY Cantidad DESC;
END
GO
CREATE OR ALTER PROCEDURE sp_P7_MedioContratacionJovenes
AS
BEGIN
    SET NOCOUNT ON;
 
    SELECT
        M.Descripcion AS MedioContratacion,
        COUNT(*) AS Cantidad
    FROM Encuesta E
        INNER JOIN Cliente C
            ON E.IdCliente = C.IdCliente
        INNER JOIN MedioContratacion M
            ON E.IdMedioContratacion = M.IdMedioContratacion
    WHERE C.IdRangoEdad = 1
    GROUP BY M.Descripcion
    ORDER BY Cantidad DESC;
END
GO

CREATE OR ALTER PROCEDURE sp_P8_ClientesInactivos
AS
BEGIN
    SET NOCOUNT ON;
 
    SELECT
        COUNT(*) AS Cantidad
    FROM Encuesta E
        INNER JOIN Cliente C
            ON E.IdCliente=C.IdCliente
    WHERE C.Activo=0;
END
GO

CREATE OR ALTER PROCEDURE sp_P9_CapacidadPagoEdad
AS
BEGIN
    SET NOCOUNT ON;
 
    SELECT
        RE.Descripcion AS RangoEdad,
        AVG(CP.PagoMaximo) AS PromedioPago
    FROM Encuesta E
        INNER JOIN Cliente C
            ON E.IdCliente=C.IdCliente
        INNER JOIN RangoEdad RE
            ON C.IdRangoEdad=RE.IdRangoEdad
        INNER JOIN CapacidadPago CP
            ON E.IdCapacidadPago=CP.IdCapacidadPago
    GROUP BY RE.Descripcion
    ORDER BY PromedioPago DESC;
END

CREATE OR ALTER PROCEDURE sp_P10_PrestamoPlazo
AS
BEGIN
    SET NOCOUNT ON;
 
    SELECT
        TP.Nombre AS TipoPrestamo,
        P.Descripcion AS Plazo,
        COUNT(*) AS Cantidad
    FROM Encuesta E
        INNER JOIN TipoPrestamo TP
            ON E.IdTipoPrestamo=TP.IdTipoPrestamo
        INNER JOIN Plazo P
            ON E.IdPlazo=P.IdPlazo
    GROUP BY TP.Nombre,P.Descripcion
    ORDER BY Cantidad DESC;
END
GO

CREATE OR ALTER PROCEDURE sp_P11_TasaPromedioIngreso
AS
BEGIN
    SET NOCOUNT ON;
 
    SELECT
        RI.Descripcion AS RangoIngresos,
        AVG((T.TasaMinima + T.TasaMaxima)/2.0) AS PromedioTasa
    FROM Encuesta E
        INNER JOIN Cliente C
            ON E.IdCliente = C.IdCliente
        INNER JOIN RangoIngresos RI
            ON C.IdRangoIngresos = RI.IdRangoIngresos
        INNER JOIN TasaInteres T
            ON E.IdTasaInteres = T.IdTasaInteres
    GROUP BY RI.Descripcion
    ORDER BY PromedioTasa DESC;
END
GO

CREATE OR ALTER PROCEDURE sp_P12_PrestamoUniversitarios
AS
BEGIN
    SET NOCOUNT ON;
 
    SELECT
        TP.Nombre AS TipoPrestamo,
        COUNT(*) AS Cantidad
    FROM Encuesta E
        INNER JOIN Cliente C
            ON E.IdCliente=C.IdCliente
        INNER JOIN TipoPrestamo TP
            ON E.IdTipoPrestamo=TP.IdTipoPrestamo
    WHERE C.IdNivelEducativo=4
    GROUP BY TP.Nombre
    ORDER BY Cantidad DESC;
END
GO

CREATE OR ALTER PROCEDURE sp_P13_CapacidadPagoBaja
AS
BEGIN
    SET NOCOUNT ON;
 
    SELECT
        CP.Descripcion,
        COUNT(*) Cantidad
    FROM Encuesta E
        INNER JOIN CapacidadPago CP
            ON E.IdCapacidadPago=CP.IdCapacidadPago
    WHERE CP.IdCapacidadPago=1
    GROUP BY CP.Descripcion;
END
GO

CREATE OR ALTER PROCEDURE sp_P14_EdadPrestamo
AS
BEGIN
    SET NOCOUNT ON;
 
    SELECT
        RE.Descripcion AS Edad,
        TP.Nombre AS Prestamo,
        COUNT(*) Cantidad
    FROM Encuesta E
        INNER JOIN Cliente C
            ON E.IdCliente=C.IdCliente
        INNER JOIN RangoEdad RE
            ON C.IdRangoEdad=RE.IdRangoEdad
        INNER JOIN TipoPrestamo TP
            ON E.IdTipoPrestamo=TP.IdTipoPrestamo
    GROUP BY RE.Descripcion,TP.Nombre
    ORDER BY Cantidad DESC;
END
GO
 
 CREATE OR ALTER PROCEDURE sp_P15_RangoIngresosSolicitudes
AS
BEGIN
    SET NOCOUNT ON;
 
    SELECT
        RI.Descripcion,
        COUNT(*) Cantidad
    FROM Encuesta E
        INNER JOIN Cliente C
            ON E.IdCliente=C.IdCliente
        INNER JOIN RangoIngresos RI
            ON C.IdRangoIngresos=RI.IdRangoIngresos
    GROUP BY RI.Descripcion
    ORDER BY Cantidad DESC;
END
GO
 
 CREATE OR ALTER PROCEDURE sp_P16_MedioTipoPrestamo
AS
BEGIN
    SET NOCOUNT ON;
 
    SELECT
        M.Descripcion AS Medio,
        TP.Nombre AS Prestamo,
        COUNT(*) Cantidad
    FROM Encuesta E
        INNER JOIN MedioContratacion M
            ON E.IdMedioContratacion=M.IdMedioContratacion
        INNER JOIN TipoPrestamo TP
            ON E.IdTipoPrestamo=TP.IdTipoPrestamo
    GROUP BY M.Descripcion,TP.Nombre
    ORDER BY Cantidad DESC;
END
GO
 
 CREATE OR ALTER PROCEDURE sp_P17_MujeresPrestamoPersonal
AS
BEGIN
    SET NOCOUNT ON;
 
    SELECT
        CAST(
            COUNT(*)*100.0/
            (SELECT COUNT(*)
             FROM Encuesta E2
             INNER JOIN Cliente C2
                 ON E2.IdCliente=C2.IdCliente
             WHERE C2.IdGenero=2)
        AS DECIMAL(10,2)) AS Porcentaje
    FROM Encuesta E
        INNER JOIN Cliente C
            ON E.IdCliente=C.IdCliente
    WHERE
        C.IdGenero=2
        AND E.IdTipoPrestamo=1;
END
GO
 
 CREATE OR ALTER PROCEDURE sp_P18_Plazos24
AS
BEGIN
    SET NOCOUNT ON;
 
    SELECT
        P.Descripcion,
        COUNT(*) Cantidad
    FROM Encuesta E
        INNER JOIN Plazo P
            ON E.IdPlazo=P.IdPlazo
    WHERE P.Meses<=24
    GROUP BY P.Descripcion;
END
GO
 
 CREATE OR ALTER PROCEDURE sp_P19_DistribucionPrestamo
AS
BEGIN
    SET NOCOUNT ON;
 
    SELECT
        TP.Nombre,
        COUNT(*) Cantidad
    FROM Encuesta E
        INNER JOIN TipoPrestamo TP
            ON E.IdTipoPrestamo=TP.IdTipoPrestamo
    GROUP BY TP.Nombre
    ORDER BY Cantidad DESC;
END
GO
 
 CREATE OR ALTER PROCEDURE sp_P20_NivelEducativoSolicitudes
AS
BEGIN
    SET NOCOUNT ON;
 
    SELECT
        N.Nombre,
        COUNT(*) Cantidad
    FROM Encuesta E
        INNER JOIN Cliente C
            ON E.IdCliente=C.IdCliente
        INNER JOIN NivelEducativo N
            ON C.IdNivelEducativo=N.IdNivelEducativo
    GROUP BY N.Nombre
    ORDER BY Cantidad DESC;
END
GO

 CREATE OR ALTER PROCEDURE sp_P21_TasaAltaPlazoLargo
AS
BEGIN
    SET NOCOUNT ON;
 
    SELECT
        T.Descripcion AS Tasa,
        P.Descripcion AS Plazo,
        COUNT(*) AS Cantidad
    FROM Encuesta E
        INNER JOIN TasaInteres T
            ON E.IdTasaInteres = T.IdTasaInteres
        INNER JOIN Plazo P
            ON E.IdPlazo = P.IdPlazo
    WHERE
        T.TasaMaxima > 12
        AND P.Meses > 36
    GROUP BY
        T.Descripcion,
        P.Descripcion
    ORDER BY Cantidad DESC;
END
GO
 
 CREATE OR ALTER PROCEDURE sp_P22_Prestamo36a45
AS
BEGIN
    SET NOCOUNT ON;
 
    SELECT
        TP.Nombre,
        COUNT(*) Cantidad
    FROM Encuesta E
        INNER JOIN Cliente C
            ON E.IdCliente=C.IdCliente
        INNER JOIN TipoPrestamo TP
            ON E.IdTipoPrestamo=TP.IdTipoPrestamo
    WHERE C.IdRangoEdad=3
    GROUP BY TP.Nombre
    ORDER BY Cantidad DESC;
END
GO
 

 CREATE OR ALTER PROCEDURE sp_P23_CapacidadNivel
AS
BEGIN
    SET NOCOUNT ON;
 
    SELECT
        N.Nombre,
        AVG(CP.PagoMaximo) Promedio
    FROM Encuesta E
        INNER JOIN Cliente C
            ON E.IdCliente=C.IdCliente
        INNER JOIN NivelEducativo N
            ON C.IdNivelEducativo=N.IdNivelEducativo
        INNER JOIN CapacidadPago CP
            ON E.IdCapacidadPago=CP.IdCapacidadPago
    GROUP BY N.Nombre
    ORDER BY Promedio DESC;
END
GO
 

 CREATE OR ALTER PROCEDURE sp_P24_PlazoIngresosAltos
AS
BEGIN
    SET NOCOUNT ON;
 
    SELECT
        P.Descripcion,
        COUNT(*) Cantidad
    FROM Encuesta E
        INNER JOIN Cliente C
            ON E.IdCliente=C.IdCliente
        INNER JOIN Plazo P
            ON E.IdPlazo=P.IdPlazo
    WHERE C.IdRangoIngresos=4
    GROUP BY P.Descripcion
    ORDER BY Cantidad DESC;
END
GO
 
 CREATE OR ALTER PROCEDURE sp_P25_VehicularIngresosAltos
AS
BEGIN
    SET NOCOUNT ON;
 
    SELECT
        RI.Descripcion,
        COUNT(*) Cantidad
    FROM Encuesta E
        INNER JOIN Cliente C
            ON E.IdCliente=C.IdCliente
        INNER JOIN RangoIngresos RI
            ON C.IdRangoIngresos=RI.IdRangoIngresos
    WHERE
        C.IdRangoIngresos=4
        AND E.IdTipoPrestamo=3
    GROUP BY RI.Descripcion;
END
GO
 

 CREATE OR ALTER PROCEDURE sp_P26_PrestamoPlazo
AS
BEGIN
    SET NOCOUNT ON;
 
    SELECT
        TP.Nombre,
        P.Descripcion,
        COUNT(*) Cantidad
    FROM Encuesta E
        INNER JOIN TipoPrestamo TP
            ON E.IdTipoPrestamo=TP.IdTipoPrestamo
        INNER JOIN Plazo P
            ON E.IdPlazo=P.IdPlazo
    GROUP BY
        TP.Nombre,
        P.Descripcion
    ORDER BY Cantidad DESC;
END
GO
 

 CREATE OR ALTER PROCEDURE sp_P27_TasaCapacidad
AS
BEGIN
    SET NOCOUNT ON;
 
    SELECT
        T.Descripcion,
        CP.Descripcion,
        COUNT(*) Cantidad
    FROM Encuesta E
        INNER JOIN TasaInteres T
            ON E.IdTasaInteres=T.IdTasaInteres
        INNER JOIN CapacidadPago CP
            ON E.IdCapacidadPago=CP.IdCapacidadPago
    GROUP BY
        T.Descripcion,
        CP.Descripcion
    ORDER BY Cantidad DESC;
END
GO
 
 CREATE OR ALTER PROCEDURE sp_P28_MedioContratacion
AS
BEGIN
    SET NOCOUNT ON;
 
    SELECT
        M.Descripcion,
        COUNT(*) Cantidad
    FROM Encuesta E
        INNER JOIN MedioContratacion M
            ON E.IdMedioContratacion=M.IdMedioContratacion
    GROUP BY M.Descripcion
    ORDER BY Cantidad DESC;
END
GO
 
 CREATE OR ALTER PROCEDURE sp_P29_Plazo12
AS
BEGIN
    SET NOCOUNT ON;
 
    SELECT
        P.Descripcion,
        COUNT(*) Cantidad
    FROM Encuesta E
        INNER JOIN Plazo P
            ON E.IdPlazo=P.IdPlazo
    WHERE P.Meses<=12
    GROUP BY P.Descripcion;
END
GO
 
EXEC sp_P29_Plazo12;

CREATE OR ALTER PROCEDURE sp_P30_PerfilComun
AS
BEGIN
    SET NOCOUNT ON;
 
    SELECT
        RE.Descripcion AS Edad,
        RI.Descripcion AS Ingresos,
        TP.Nombre AS Prestamo,
        COUNT(*) AS Cantidad
    FROM Encuesta E
        INNER JOIN Cliente C
            ON E.IdCliente=C.IdCliente
        INNER JOIN RangoEdad RE
            ON C.IdRangoEdad=RE.IdRangoEdad
        INNER JOIN RangoIngresos RI
            ON C.IdRangoIngresos=RI.IdRangoIngresos
        INNER JOIN TipoPrestamo TP
            ON E.IdTipoPrestamo=TP.IdTipoPrestamo
    GROUP BY
        RE.Descripcion,
        RI.Descripcion,
        TP.Nombre
    ORDER BY Cantidad DESC;
END
GO
 
 CREATE OR ALTER PROCEDURE sp_P3_PlazosMayores36
AS
BEGIN
    SET NOCOUNT ON;
 
    SELECT
        'Más de 36 meses' AS Etiqueta,
        COUNT(*) AS Valor
    FROM Encuesta E
    INNER JOIN Plazo P
        ON E.IdPlazo = P.IdPlazo
    WHERE P.Meses > 36
      AND E.Activo = 1;
END
GO

CREATE OR ALTER PROCEDURE sp_P4_MontoPromedioTipoPrestamo
AS
BEGIN
    SET NOCOUNT ON;
 
    SELECT
        TP.Nombre AS Etiqueta,
        AVG(CP.PagoMaximo) AS Valor
    FROM Encuesta E
    INNER JOIN TipoPrestamo TP
        ON E.IdTipoPrestamo = TP.IdTipoPrestamo
    INNER JOIN CapacidadPago CP
        ON E.IdCapacidadPago = CP.IdCapacidadPago
    WHERE E.Activo = 1
    GROUP BY TP.Nombre;
END
GO

CREATE OR ALTER PROCEDURE sp_P5_IngresosBajosTasaAlta
AS
BEGIN
    SET NOCOUNT ON;
 
    SELECT
        'Ingresos bajos' AS Etiqueta,
        COUNT(*) AS Valor
    FROM Encuesta E
    INNER JOIN Cliente C
        ON E.IdCliente = C.IdCliente
    INNER JOIN RangoIngresos RI
        ON C.IdRangoIngresos = RI.IdRangoIngresos
    INNER JOIN TasaInteres TI
        ON E.IdTasaInteres = TI.IdTasaInteres
    WHERE RI.IngresoMaximo <= 500000
      AND TI.TasaMinima > 10
      AND E.Activo = 1;
END
GO
ALTER PROCEDURE sp_ObtenerUsuarios
AS
BEGIN
    SELECT
        u.IdUsuario,
        u.IdRol,
        r.Nombre AS NombreRol,
        u.Nombre,
        u.Correo,
        u.Usuario,
        u.Contrasena,
        u.Activo,
        u.FechaCreacion,
        u.UsuarioCreacion,
        u.FechaModificacion,
        u.UsuarioModificacion
    FROM Usuario u
        INNER JOIN Rol r
            ON u.IdRol = r.IdRol
    WHERE u.Activo = 1
    ORDER BY u.IdUsuario;
END