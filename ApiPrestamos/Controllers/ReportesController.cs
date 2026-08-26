using ApiPrestamos.Repositorios;
using Microsoft.AspNetCore.Mvc;

namespace ApiPrestamos.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class ReportesController : ControllerBase
    {
        private readonly ReporteRepository _repository;

        public ReportesController(ReporteRepository repository)
        {
            _repository = repository;
        }

        [HttpGet("1")]
        public IActionResult Reporte1()
        {
            return Ok(_repository.ObtenerReporte1());
        }
        [HttpGet("2")]
        public IActionResult Reporte2()
        {
            return Ok(_repository.ObtenerReporte2());
        }
        [HttpGet("3")]
        public IActionResult Reporte3()
        {
            return Ok(_repository.ObtenerReporte3());
        }
        [HttpGet("4")]
        public IActionResult Reporte4()
        {
            return Ok(_repository.ObtenerReporte4());
        }

        [HttpGet("5")]
        public IActionResult Reporte5()
        {
            return Ok(_repository.ObtenerReporte5());
        }
        [HttpGet("6")]
        public IActionResult Reporte6()
        {
            return Ok(_repository.ObtenerReporte6());
        }
        [HttpGet("7")]
        public IActionResult Reporte7()
        {
            return Ok(_repository.ObtenerReporte7());
        }
        [HttpGet("8")]
        public IActionResult Reporte8()
        {
            return Ok(_repository.ObtenerReporte8());
        }
        [HttpGet("9")]
        public IActionResult Reporte9()
        {
            return Ok(_repository.ObtenerReporte9());
        }
        [HttpGet("10")]
        public IActionResult Reporte10()
        {
            return Ok(_repository.ObtenerReporte10());
        }
        [HttpGet("11")]
        public IActionResult Reporte11()
        {
            return Ok(_repository.ObtenerReporte11());
        }
        [HttpGet("12")]
        public IActionResult Reporte12()
        {
            return Ok(_repository.ObtenerReporte12());
        }
        [HttpGet("13")]
        public IActionResult Reporte13()
        {
            return Ok(_repository.ObtenerReporte13());
        }
        [HttpGet("14")]
        public IActionResult Reporte14()
        {
            return Ok(_repository.ObtenerReporte14());
        }
        [HttpGet("15")]
        public IActionResult Reporte15()
        {
            return Ok(_repository.ObtenerReporte15());
        }
        [HttpGet("31/idRangoEdad")]
        public IActionResult Reporte31(int idRangoEdad)
        {
            return Ok(_repository.ObtenerReporte31(idRangoEdad));
        }
    }
}