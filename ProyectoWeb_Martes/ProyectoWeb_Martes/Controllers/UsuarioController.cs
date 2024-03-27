using ProyectoWeb_Martes.Entidades;
using ProyectoWeb_Martes.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.Mvc;

namespace ProyectoWeb_Martes.Controllers
{
    [FiltroSeguridad]
    [OutputCache(NoStore = true, VaryByParam = "*", Duration = 0)]
    public class UsuarioController : Controller
    {
        UsuarioModel modelo = new UsuarioModel();

        [HttpGet]
        public ActionResult ActualizarUsuario()
        {
            var resp = modelo.ConsultarUsuario();
            return View(resp.Dato);
        }

        [HttpPost]
        public ActionResult ActualizarUsuario(Usuario entidad)
        {
            var respuesta = modelo.ActualizarUsuario(entidad);

            if (respuesta.Codigo == 0)
            {
                Session["NombreUsuario"] = entidad.Nombre;
                return RedirectToAction("ActualizarUsuario", "Usuario");
            }
            else
            {
                ViewBag.MsjPantalla = respuesta.Detalle;
                return View();
            }
        }
    }
}