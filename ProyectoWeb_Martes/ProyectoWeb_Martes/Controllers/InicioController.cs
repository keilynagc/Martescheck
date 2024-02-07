using ProyectoWeb_Martes.Entidades;
using ProyectoWeb_Martes.Models;
using System.Web.Mvc;

namespace ProyectoWeb_Martes.Controllers
{
    public class InicioController : Controller
    {
        UsuarioModel modelo = new UsuarioModel();

        [HttpGet]
        public ActionResult IniciarSesion()
        {
            return View();
        }

        [HttpPost]
        public ActionResult IniciarSesion(Usuario entidad)
        {
            var respuesta = modelo.IniciarSesionUsuario(entidad);

            if (respuesta.Count > 0)
                return RedirectToAction("PantallaPrincipal", "Inicio");

            return View();
        }


        [HttpGet]
        public ActionResult RegistrarUsuario()
        {
            return View();
        }

        [HttpPost]
        public ActionResult RegistrarUsuario(Usuario entidad)
        {
            var respuesta = modelo.RegistrarUsuario(entidad);

            if (respuesta > 0)
                return RedirectToAction("IniciarSesion", "Inicio");

            return View();
        }


        [HttpGet]
        public ActionResult RecuperarAcceso()
        {
            return View();
        }

        [HttpPost]
        public ActionResult RecuperarAcceso(Usuario entidad)
        {
            return View();
        }


        [HttpGet]
        public ActionResult PantallaPrincipal()
        {
            return View();
        }

    }
}