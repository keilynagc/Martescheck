using ProyectoWeb_Martes.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProyectoWeb_Martes.Controllers
{
    public class UsuarioController : Controller
    {
        UsuarioModel modelo = new UsuarioModel();

        public ActionResult Index()
        {
            return View();
        }

    }
}