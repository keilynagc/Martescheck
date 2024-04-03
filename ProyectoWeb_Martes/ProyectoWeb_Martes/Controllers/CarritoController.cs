using ProyectoWeb_Martes.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProyectoWeb_Martes.Controllers
{
    [FiltroSeguridad]
    [OutputCache(NoStore = true, VaryByParam = "*", Duration = 0)]
    public class CarritoController : Controller
    {
        [HttpGet]
        public ActionResult AgregarCarrito(long idProducto, int cantProducto)
        {
            return Json("OK", JsonRequestBehavior.AllowGet);
        }
    }
}