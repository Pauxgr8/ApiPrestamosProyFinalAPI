---poblar BD

EXEC sp_InsertarCliente
@Nombre='Carlos',
@Apellido='Mora',
@Correo='carlos1@gmail.com',
@Telefono='88880001',
@IdGenero=1,
@IdNivelEducativo=2,
@IdRangoEdad=1,
@IdRangoIngresos=1,
@UsuarioCreacion='Administrador';
 
EXEC sp_InsertarCliente
@Nombre='María',
@Apellido='Jiménez',
@Correo='maria2@gmail.com',
@Telefono='88880002',
@IdGenero=2,
@IdNivelEducativo=3,
@IdRangoEdad=2,
@IdRangoIngresos=2,
@UsuarioCreacion='Administrador';
 
EXEC sp_InsertarCliente
@Nombre='José',
@Apellido='Rodríguez',
@Correo='jose3@gmail.com',
@Telefono='88880003',
@IdGenero=1,
@IdNivelEducativo=1,
@IdRangoEdad=3,
@IdRangoIngresos=3,
@UsuarioCreacion='Administrador';
 
EXEC sp_InsertarCliente
@Nombre='Ana',
@Apellido='Solís',
@Correo='ana4@gmail.com',
@Telefono='88880004',
@IdGenero=2,
@IdNivelEducativo=4,
@IdRangoEdad=2,
@IdRangoIngresos=4,
@UsuarioCreacion='Administrador';
 
EXEC sp_InsertarCliente
@Nombre='Luis',
@Apellido='Gómez',
@Correo='luis5@gmail.com',
@Telefono='88880005',
@IdGenero=1,
@IdNivelEducativo=2,
@IdRangoEdad=4,
@IdRangoIngresos=5,
@UsuarioCreacion='Administrador';
 
EXEC sp_InsertarCliente
@Nombre='Sofía',
@Apellido='Vargas',
@Correo='sofia6@gmail.com',
@Telefono='88880006',
@IdGenero=2,
@IdNivelEducativo=3,
@IdRangoEdad=3,
@IdRangoIngresos=4,
@UsuarioCreacion='Administrador';
 
EXEC sp_InsertarCliente
@Nombre='Andrés',
@Apellido='Castro',
@Correo='andres7@gmail.com',
@Telefono='88880007',
@IdGenero=1,
@IdNivelEducativo=2,
@IdRangoEdad=5,
@IdRangoIngresos=5,
@UsuarioCreacion='Administrador';
 
EXEC sp_InsertarCliente
@Nombre='Laura',
@Apellido='Ramírez',
@Correo='laura8@gmail.com',
@Telefono='88880008',
@IdGenero=2,
@IdNivelEducativo=1,
@IdRangoEdad=1,
@IdRangoIngresos=2,
@UsuarioCreacion='Administrador';
 
EXEC sp_InsertarCliente
@Nombre='Diego',
@Apellido='Fernández',
@Correo='diego9@gmail.com',
@Telefono='88880009',
@IdGenero=1,
@IdNivelEducativo=4,
@IdRangoEdad=4,
@IdRangoIngresos=5,
@UsuarioCreacion='Administrador';
 
EXEC sp_InsertarCliente
@Nombre='Valeria',
@Apellido='Rojas',
@Correo='valeria10@gmail.com',
@Telefono='88880010',
@IdGenero=2,
@IdNivelEducativo=3,
@IdRangoEdad=2,
@IdRangoIngresos=3,
@UsuarioCreacion='Administrador';

EXEC sp_InsertarCliente 'Ana','Mora','ana1@gmail.com','88880001',2,4,1,1,'Administrador',1;
EXEC sp_InsertarCliente 'Carlos','Perez','carlos1@gmail.com','88880002',1,3,2,2,'Administrador',1;
EXEC sp_InsertarCliente 'Lucia','Ramirez','lucia1@gmail.com','88880003',2,5,3,3,'Administrador',1;
EXEC sp_InsertarCliente 'Daniel','Rojas','daniel1@gmail.com','88880004',1,2,4,4,'Administrador',1;
EXEC sp_InsertarCliente 'Sofia','Vargas','sofia1@gmail.com','88880005',2,1,5,2,'Administrador',1;
EXEC sp_InsertarCliente 'Jorge','Alvarado','jorge1@gmail.com','88880006',1,4,2,3,'Administrador',1;
EXEC sp_InsertarCliente 'Maria','Campos','maria2@gmail.com','88880007',2,3,1,1,'Administrador',1;
EXEC sp_InsertarCliente 'Andres','Castro','andres1@gmail.com','88880008',1,5,3,4,'Administrador',1;
EXEC sp_InsertarCliente 'Valeria','Salas','valeria1@gmail.com','88880009',2,2,4,2,'Administrador',1;
EXEC sp_InsertarCliente 'Kevin','Murillo','kevin1@gmail.com','88880010',1,1,5,3,'Administrador',1;

---	Encuestas
EXEC sp_InsertarEncuesta 2,2,1,1,1,1,1,'Administrador',1;
EXEC sp_InsertarEncuesta 3,2,2,2,2,2,2,'Administrador',1;
EXEC sp_InsertarEncuesta 4,2,3,3,3,3,1,'Administrador',1;
EXEC sp_InsertarEncuesta 5,2,4,4,1,4,2,'Administrador',1;
EXEC sp_InsertarEncuesta 6,2,1,5,2,5,1,'Administrador',1;
 
EXEC sp_InsertarEncuesta 7,2,2,1,3,2,2,'Administrador',1;
EXEC sp_InsertarEncuesta 8,2,3,2,1,3,1,'Administrador',1;
EXEC sp_InsertarEncuesta 9,2,4,3,2,4,2,'Administrador',1;
EXEC sp_InsertarEncuesta 10,2,1,4,3,5,1,'Administrador',1;
EXEC sp_InsertarEncuesta 11,2,2,5,1,1,2,'Administrador',1;
 
EXEC sp_InsertarEncuesta 12,2,3,1,2,2,1,'Administrador',1;
EXEC sp_InsertarEncuesta 13,2,4,2,3,3,2,'Administrador',1;
EXEC sp_InsertarEncuesta 14,2,1,3,1,4,1,'Administrador',1;
EXEC sp_InsertarEncuesta 15,2,2,4,2,5,2,'Administrador',1;
EXEC sp_InsertarEncuesta 16,2,3,5,3,1,1,'Administrador',1;
 
EXEC sp_InsertarEncuesta 17,2,4,1,1,2,2,'Administrador',1;
EXEC sp_InsertarEncuesta 18,2,1,2,2,3,1,'Administrador',1;
EXEC sp_InsertarEncuesta 19,2,2,3,3,4,2,'Administrador',1;

EXEC sp_InsertarEncuesta 6,2,2,3,2,2,1,'Administrador',1;
 
EXEC sp_InsertarEncuesta 15,2,1,4,1,5,2,'Administrador',1;
 
EXEC sp_InsertarEncuesta 20,2,4,5,3,4,1,'Administrador',1;
 
EXEC sp_InsertarEncuesta 21,2,3,2,2,3,2,'Administrador',1;
 
EXEC sp_InsertarEncuesta 22,2,2,1,1,2,1,'Administrador',1;
 
EXEC sp_InsertarEncuesta 23,2,1,5,3,5,2,'Administrador',1;

EXEC sp_InsertarEncuesta
    @IdCliente = 15,
    @IdUsuario = 2,
    @IdTipoPrestamo = 1,
    @IdPlazo = 4,
    @IdTasaInteres = 1,
    @IdCapacidadPago = 4,
    @IdMedioContratacion = 2,
    @UsuarioCreacion = 'Administrador',
    @Activo = 1;


	EXEC sp_InsertarEncuesta

    @IdCliente = 23,

    @IdUsuario = 2,

    @IdTipoPrestamo = 1,

    @IdPlazo = 5,

    @IdTasaInteres = 3,

    @IdCapacidadPago = 4,

    @IdMedioContratacion = 2,

    @UsuarioCreacion = 'Administrador',

    @Activo = 1;
 
