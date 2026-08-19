using ApiPrestamos.Models;
using ApiPrestamos.Repositorios;
using Microsoft.AspNetCore.Mvc;

namespace ApiPrestamos.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LoginController : ControllerBase
    {
        private readonly LoginRepository _repository;

        public LoginController(LoginRepository repository)
        {
            _repository = repository;
        }

        [HttpPost]
        public async Task<IActionResult> Login([FromBody] LoginRequest request)
        {
            var usuario = await _repository.Login(
                request.Usuario,
                request.Contrasena);

            if (usuario == null)
                return Unauthorized("Usuario o contraseña incorrectos.");

            return Ok(usuario);
        }
    }
}