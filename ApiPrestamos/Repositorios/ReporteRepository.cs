using ApiPrestamos.Models;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using System.Collections.Generic;
using System.Data;

namespace ApiPrestamos.Repositorios
{
    public class ReporteRepository
    {
        private readonly string _conexion;

        public ReporteRepository(IConfiguration configuration)
        {
            _conexion = configuration.GetConnectionString("DefaultConnection");
        }

        public List<ReportePregunta1> ObtenerReporte1()
        {
            List<ReportePregunta1> lista = new List<ReportePregunta1>();

            using (SqlConnection cn = new SqlConnection(_conexion))
            {
                SqlCommand cmd = new SqlCommand("sp_P1_TipoPrestamoPorRangoEdad", cn);
                cmd.CommandType = CommandType.StoredProcedure;

                cn.Open();

                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    lista.Add(new ReportePregunta1
                    {
                        RangoEdad = dr["RangoEdad"].ToString(),
                        TipoPrestamo = dr["TipoPrestamo"].ToString(),
                        Cantidad = Convert.ToInt32(dr["Cantidad"])
                    });
                }
            }

            return lista;
        }

        public List<ReportePlazo> ObtenerReporte2()
        {
            List<ReportePlazo> lista = new List<ReportePlazo>();

            using (SqlConnection cn = new SqlConnection(_conexion))
            {
                SqlCommand cmd = new SqlCommand("sp_P2_PlazoIngresosAltos", cn);
                cmd.CommandType = CommandType.StoredProcedure;

                cn.Open();

                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    lista.Add(new ReportePlazo
                    {
                        Plazo = dr["Plazo"].ToString(),
                        Cantidad = Convert.ToInt32(dr["Cantidad"])
                    });
                }
            }

            return lista;
        }
        public List<ReportePlazosMayores36> ObtenerReporte3()
        {
            List<ReportePlazosMayores36> lista = new List<ReportePlazosMayores36>();

            using (SqlConnection cn = new SqlConnection(_conexion))
            {
                SqlCommand cmd = new SqlCommand("sp_P3_PlazosMayores36", cn);
                cmd.CommandType = CommandType.StoredProcedure;

                cn.Open();

                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    lista.Add(new ReportePlazosMayores36
                    {
                        Etiqueta = dr["Etiqueta"].ToString(),
                        Valor = Convert.ToInt32(dr["Valor"])
                    });
                }
            }

            return lista;
        }

        public List<ReporteMontoPromedio> ObtenerReporte4()
        {
            List<ReporteMontoPromedio> lista = new List<ReporteMontoPromedio>();

            using (SqlConnection cn = new SqlConnection(_conexion))
            {
                SqlCommand cmd = new SqlCommand("sp_P4_MontoPromedioTipoPrestamo", cn);
                cmd.CommandType = CommandType.StoredProcedure;

                cn.Open();

                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    lista.Add(new ReporteMontoPromedio
                    {
                        Etiqueta = dr["Etiqueta"].ToString(),
                        Valor = Convert.ToDecimal(dr["Valor"])
                    });
                }
            }

            return lista;
        }

        public List<ReporteIngresosBajos> ObtenerReporte5()
        {
            List<ReporteIngresosBajos> lista = new List<ReporteIngresosBajos>();

            using (SqlConnection cn = new SqlConnection(_conexion))
            {
                SqlCommand cmd = new SqlCommand("sp_P5_IngresosBajosTasaAlta", cn);
                cmd.CommandType = CommandType.StoredProcedure;

                cn.Open();

                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    lista.Add(new ReporteIngresosBajos
                    {
                        Etiqueta = dr["Etiqueta"].ToString(),
                        Valor = Convert.ToInt32(dr["Valor"])
                    });
                }
            }

            return lista;
        }
        public List<ReporteNivelEducativo> ObtenerReporte6()
        {
            List<ReporteNivelEducativo> lista = new List<ReporteNivelEducativo>();

            using (SqlConnection cn = new SqlConnection(_conexion))
            {
                SqlCommand cmd = new SqlCommand("sp_P6_NivelEducativoPrestamoEducativo", cn);
                cmd.CommandType = CommandType.StoredProcedure;

                cn.Open();

                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    lista.Add(new ReporteNivelEducativo
                    {
                        NivelEducativo = dr["NivelEducativo"].ToString(),
                        Cantidad = Convert.ToInt32(dr["Cantidad"])
                    });
                }
            }

            return lista;
        }
        public List<ReporteMedioContratacion> ObtenerReporte7()
        {
            List<ReporteMedioContratacion> lista = new();

            using (SqlConnection cn = new SqlConnection(_conexion))
            {
                SqlCommand cmd = new SqlCommand("sp_P7_MedioContratacionJovenes", cn);
                cmd.CommandType = CommandType.StoredProcedure;

                cn.Open();

                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    lista.Add(new ReporteMedioContratacion
                    {
                        MedioContratacion = dr["MedioContratacion"].ToString(),
                        Cantidad = Convert.ToInt32(dr["Cantidad"])
                    });
                }
            }

            return lista;
        }
        public List<ReporteClientesInactivos> ObtenerReporte8()
        {
            List<ReporteClientesInactivos> lista = new();

            using (SqlConnection cn = new SqlConnection(_conexion))
            {
                SqlCommand cmd = new SqlCommand("sp_P8_ClientesInactivos", cn);
                cmd.CommandType = CommandType.StoredProcedure;

                cn.Open();

                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    lista.Add(new ReporteClientesInactivos
                    {
                        Cantidad = Convert.ToInt32(dr["Cantidad"])
                    });
                }
            }

            return lista;
        }
        public List<ReporteCapacidadPago> ObtenerReporte9()
        {
            List<ReporteCapacidadPago> lista = new();

            using (SqlConnection cn = new SqlConnection(_conexion))
            {
                SqlCommand cmd = new SqlCommand("sp_P9_CapacidadPagoEdad", cn);
                cmd.CommandType = CommandType.StoredProcedure;

                cn.Open();

                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    lista.Add(new ReporteCapacidadPago
                    {
                        RangoEdad = dr["RangoEdad"].ToString(),
                        PromedioPago = Convert.ToDecimal(dr["PromedioPago"])
                    });
                }
            }

            return lista;
        }
        public List<ReportePlazo> ObtenerReporte10()
        {
            List<ReportePlazo> lista = new();

            using (SqlConnection cn = new SqlConnection(_conexion))
            {
                SqlCommand cmd = new SqlCommand("sp_P10_PrestamoPlazo", cn);
                cmd.CommandType = CommandType.StoredProcedure;

                cn.Open();

                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    lista.Add(new ReportePlazo
                    {
                        TipoPrestamo = dr["TipoPrestamo"].ToString(),
                        Plazo = dr["Plazo"].ToString(),
                        Cantidad = Convert.ToInt32(dr["Cantidad"])
                    });
                }
            }

            return lista;
        }
        public List<ReporteTasaPromedio> ObtenerReporte11()
        {
            List<ReporteTasaPromedio> lista = new();

            using (SqlConnection cn = new SqlConnection(_conexion))
            {
                SqlCommand cmd = new SqlCommand("sp_P11_TasaPromedioIngreso", cn);
                cmd.CommandType = CommandType.StoredProcedure;

                cn.Open();

                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    lista.Add(new ReporteTasaPromedio
                    {
                        RangoIngresos = dr["RangoIngresos"].ToString(),
                        PromedioTasa = Convert.ToDecimal(dr["PromedioTasa"])
                    });
                }
            }

            return lista;
        }
        public List<ReportePrestamoUniversitarios> ObtenerReporte12()
        {
            List<ReportePrestamoUniversitarios> lista = new();

            using (SqlConnection cn = new SqlConnection(_conexion))
            {
                SqlCommand cmd = new SqlCommand("sp_P12_PrestamoUniversitarios", cn);
                cmd.CommandType = CommandType.StoredProcedure;

                cn.Open();

                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    lista.Add(new ReportePrestamoUniversitarios
                    {
                        TipoPrestamo = dr["TipoPrestamo"].ToString(),
                        Cantidad = Convert.ToInt32(dr["Cantidad"])
                    });
                }
            }

            return lista;
        }
        public List<ReporteDescripcion> ObtenerReporte13()
        {
            List<ReporteDescripcion> lista = new();

            using (SqlConnection cn = new SqlConnection(_conexion))
            {
                SqlCommand cmd = new SqlCommand("sp_P13_CapacidadPagoBaja", cn);
                cmd.CommandType = CommandType.StoredProcedure;

                cn.Open();

                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    lista.Add(new ReporteDescripcion
                    {
                        Descripcion = dr["Descripcion"].ToString(),
                        Cantidad = Convert.ToInt32(dr["Cantidad"])
                    });
                }
            }

            return lista;
        }
        public List<ReporteEdadPrestamo> ObtenerReporte14()
        {
            List<ReporteEdadPrestamo> lista = new();

            using (SqlConnection cn = new SqlConnection(_conexion))
            {
                SqlCommand cmd = new SqlCommand("sp_P14_EdadPrestamo", cn);
                cmd.CommandType = CommandType.StoredProcedure;

                cn.Open();

                SqlDataReader dr = cmd.ExecuteReader();
              
                while (dr.Read())
                {
                    lista.Add(new ReporteEdadPrestamo
                    {
                        Edad = dr["Edad"].ToString(),
                        Prestamo = dr["Prestamo"].ToString(),
                        Cantidad = Convert.ToInt32(dr["Cantidad"])
                    });
                }
            }

            return lista;
        }
        public List<ReporteDescripcion> ObtenerReporte15()
        {
            List<ReporteDescripcion> lista = new();

            using (SqlConnection cn = new SqlConnection(_conexion))
            {
                SqlCommand cmd = new SqlCommand("sp_P15_RangoIngresosSolicitudes", cn);
                cmd.CommandType = CommandType.StoredProcedure;

                cn.Open();

                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    lista.Add(new ReporteDescripcion
                    {
                        Descripcion = dr["Descripcion"].ToString(),
                        Cantidad = Convert.ToInt32(dr["Cantidad"])
                    });
                }
            }

            return lista;
        }
        public List<ReportePregunta1> ObtenerReporte31(int idRangoEdad)
        {
            List<ReportePregunta1> lista = new();

            using (SqlConnection cn = new SqlConnection(_conexion))
            {
                SqlCommand cmd = new SqlCommand("sp_P31_FiltroEdadPrestamo", cn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@IdRangoEdad", idRangoEdad);

                cn.Open();

                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    lista.Add(new ReportePregunta1
                    {
                        RangoEdad = dr["RangoEdad"].ToString(),
                        TipoPrestamo = dr["TipoPrestamo"].ToString(),
                        Cantidad = Convert.ToInt32(dr["Cantidad"])
                    });
                }
            }

            return lista;
        }
    }
}