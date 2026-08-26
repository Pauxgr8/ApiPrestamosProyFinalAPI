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
 
EXEC sp_P1_TipoPrestamoPorRangoEdad;

SELECT COUNT(*) AS TotalClientes
FROM Cliente;

SELECT COUNT(*) AS TotalEncuestas
FROM Encuesta;
SELECT * 
FROM Plazo;

SELECT C.IdCliente, C.Nombre, C.Apellido
FROM Cliente C
LEFT JOIN Encuesta E
    ON C.IdCliente = E.IdCliente
WHERE E.IdCliente IS NULL
ORDER BY C.IdCliente;

SELECT * FROM CapacidadPago;

SELECT C.IdCliente
FROM Cliente C
LEFT JOIN Encuesta E
    ON C.IdCliente = E.IdCliente
WHERE E.IdCliente IS NULL;

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
 
EXEC sp_P2_PlazoIngresosAltos;

SELECT * FROM Cliente;
SELECT * FROM Encuesta;
SELECT * FROM Plazo;
SELECT * FROM TipoPrestamo;
SELECT * FROM TasaInteres;
SELECT * FROM CapacidadPago;

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
 
EXEC sp_P3_PlazosMayores36;

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
 
EXEC sp_P5_IngresosBajosTasaAlta;

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
 
EXEC sp_P6_NivelEducativoPrestamoEducativo;

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
 
EXEC sp_P7_MedioContratacionJovenes;

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
 
EXEC sp_P8_ClientesInactivos;

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
GO
 
EXEC sp_P9_CapacidadPagoEdad;

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
 
EXEC sp_P10_PrestamoPlazo;

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
 
EXEC sp_P11_TasaPromedioIngreso;

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
 
EXEC sp_P12_PrestamoUniversitarios;

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
 
EXEC sp_P13_CapacidadPagoBaja;

CREATE PROCEDURE sp_P31_FiltroEdadPrestamo
    @IdRangoEdad INT
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
    WHERE C.IdRangoEdad = @IdRangoEdad
    GROUP BY
        RE.Descripcion,
        TP.Nombre
    ORDER BY
        Cantidad DESC;
END;
GOCREATE PROCEDURE sp_P31_FiltroEdadPrestamo
    @IdRangoEdad INT
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
    WHERE C.IdRangoEdad = @IdRangoEdad
    GROUP BY
        RE.Descripcion,
        TP.Nombre
    ORDER BY
        Cantidad DESC;
END;
GO