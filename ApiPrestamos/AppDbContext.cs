using ApiPrestamos.Models;
using Microsoft.EntityFrameworkCore;

namespace ApiPrestamos
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options)
            : base(options)
        {
        }

        public DbSet<Rol> Roles { get; set; }
        public DbSet<Genero> Generos { get; set; }
        public DbSet<NivelEducativo> NivelesEducativos { get; set; }
        public DbSet<RangoEdad> RangosEdad { get; set; }
        public DbSet<RangoIngresos> RangosIngresos { get; set; }
        public DbSet<TipoPrestamo> TiposPrestamo { get; set; }
        public DbSet<Plazo> Plazos { get; set; }
        public DbSet<TasaInteres> TasasInteres { get; set; }
        public DbSet<CapacidadPago> CapacidadesPago { get; set; }
        public DbSet<MedioContratacion> MediosContratacion { get; set; }
        public DbSet<Usuarios> Usuarios { get; set; }
        public DbSet<Cliente> Clientes { get; set; }
        public DbSet<Pregunta> Preguntas { get; set; }
        public DbSet<Encuesta> Encuestas { get; set; }
        public DbSet<Respuesta> Respuestas { get; set; }
        public DbSet<MisEncuestas> MisEncuestas { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            // TABLAS

            modelBuilder.Entity<Rol>()
                .ToTable("Rol")
                .HasKey(x => x.IdRol);

            modelBuilder.Entity<Genero>()
                .ToTable("Genero")
                .HasKey(x => x.IdGenero);

            modelBuilder.Entity<NivelEducativo>()
                .ToTable("NivelEducativo")
                .HasKey(x => x.IdNivelEducativo);

            modelBuilder.Entity<RangoEdad>()
                .ToTable("RangoEdad")
                .HasKey(x => x.IdRangoEdad);

            modelBuilder.Entity<RangoIngresos>()
                .ToTable("RangoIngresos")
                .HasKey(x => x.IdRangoIngresos);

            modelBuilder.Entity<TipoPrestamo>()
                .ToTable("TipoPrestamo")
                .HasKey(x => x.IdTipoPrestamo);

            modelBuilder.Entity<Plazo>()
                .ToTable("Plazo")
                .HasKey(x => x.IdPlazo);

            modelBuilder.Entity<TasaInteres>()
                .ToTable("TasaInteres")
                .HasKey(x => x.IdTasaInteres);

            modelBuilder.Entity<CapacidadPago>()
                .ToTable("CapacidadPago")
                .HasKey(x => x.IdCapacidadPago);

            modelBuilder.Entity<MedioContratacion>()
                .ToTable("MedioContratacion")
                .HasKey(x => x.IdMedioContratacion);

            modelBuilder.Entity<Usuarios>()
                .ToTable("Usuario")
                .HasKey(x => x.IdUsuario);

            modelBuilder.Entity<Cliente>()
                .ToTable("Cliente")
                .HasKey(x => x.IdCliente);

            modelBuilder.Entity<Pregunta>()
                .ToTable("Pregunta")
                .HasKey(x => x.IdPregunta);

            modelBuilder.Entity<Encuesta>()
                .ToTable("Encuesta")
                .HasKey(x => x.IdEncuesta);

            modelBuilder.Entity<Respuesta>()
                .ToTable("Respuesta")
                .HasKey(x => x.IdRespuesta);

            // RELACIONES

            modelBuilder.Entity<Usuarios>()
                .HasOne<Rol>()
                .WithMany()
                .HasForeignKey(x => x.IdRol);

            modelBuilder.Entity<Cliente>()
                .HasOne<Genero>()
                .WithMany()
                .HasForeignKey(x => x.IdGenero);

            modelBuilder.Entity<Cliente>()
                .HasOne<NivelEducativo>()
                .WithMany()
                .HasForeignKey(x => x.IdNivelEducativo);

            modelBuilder.Entity<Cliente>()
                .HasOne<RangoEdad>()
                .WithMany()
                .HasForeignKey(x => x.IdRangoEdad);

            modelBuilder.Entity<Cliente>()
                .HasOne<RangoIngresos>()
                .WithMany()
                .HasForeignKey(x => x.IdRangoIngresos);

            modelBuilder.Entity<Encuesta>()
                .HasOne<Cliente>()
                .WithMany()
                .HasForeignKey(x => x.IdCliente);

            modelBuilder.Entity<Encuesta>()
                .HasOne<Usuarios>()
                .WithMany()
                .HasForeignKey(x => x.IdUsuario);

            modelBuilder.Entity<Encuesta>()
                .HasOne<TipoPrestamo>()
                .WithMany()
                .HasForeignKey(x => x.IdTipoPrestamo);

            modelBuilder.Entity<Encuesta>()
                .HasOne<Plazo>()
                .WithMany()
                .HasForeignKey(x => x.IdPlazo);

            modelBuilder.Entity<Encuesta>()
                .HasOne<TasaInteres>()
                .WithMany()
                .HasForeignKey(x => x.IdTasaInteres);

            modelBuilder.Entity<Encuesta>()
                .HasOne<CapacidadPago>()
                .WithMany()
                .HasForeignKey(x => x.IdCapacidadPago);

            modelBuilder.Entity<Encuesta>()
                .HasOne<MedioContratacion>()
                .WithMany()
                .HasForeignKey(x => x.IdMedioContratacion);

            modelBuilder.Entity<Respuesta>()
                .HasOne<Encuesta>()
                .WithMany()
                .HasForeignKey(x => x.IdEncuesta);

            modelBuilder.Entity<Respuesta>()
                .HasOne<Pregunta>()
                .WithMany()
                .HasForeignKey(x => x.IdPregunta);

            base.OnModelCreating(modelBuilder);
            modelBuilder.Entity<MisEncuestas>().HasNoKey();
        }
    }
}