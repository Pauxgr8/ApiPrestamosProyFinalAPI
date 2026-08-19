using ApiPrestamos.Models;
using Microsoft.Data.SqlClient;
using System.Data;

namespace ApiPrestamos.Repositorios
{
    public class LoginRepository
    {
        private readonly IConfiguration _configuration;

        public LoginRepository(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public async Task<LoginResult> Login(string usuario, string contrasena)
        {
            LoginResult login = null;

            using (SqlConnection cn = new SqlConnection(
                _configuration.GetConnectionString("DefaultConnection")))
            {
                await cn.OpenAsync();

                using (SqlCommand cmd = new SqlCommand("sp_Login", cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@Usuario", usuario);
                    cmd.Parameters.AddWithValue("@Contrasena", contrasena);

                    using (SqlDataReader dr = await cmd.ExecuteReaderAsync())
                    {
                        if (await dr.ReadAsync())
                        {
                            login = new LoginResult
                            {
                                IdUsuario = Convert.ToInt32(dr["IdUsuario"]),
                                Nombre = dr["Nombre"].ToString(),
                                Usuario = dr["Usuario"].ToString(),
                                IdRol = Convert.ToInt32(dr["IdRol"]),
                                Rol = dr["Rol"].ToString()
                            };
                        }
                    }
                }
            }

            return login;
        }
    }
}