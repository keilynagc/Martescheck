using ProyectoWeb_Martes.Models;
using System.Web.Mvc;

namespace ProyectoWeb_Martes.Controllers
{
    public class InicioController : Controller
    {
        UsuarioModel modelo = new UsuarioModel();

        public ActionResult IniciarSesion()
        {
            return View();
        }

        public ActionResult RegistrarUsuario()
        {
            return View();
        }

        public ActionResult PantallaPrincipal()
        {
            return View();
        }

    }
}