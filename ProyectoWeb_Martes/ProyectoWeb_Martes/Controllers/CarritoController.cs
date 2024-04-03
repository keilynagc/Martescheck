using ProyectoWeb_Martes.Entidades;
using ProyectoWeb_Martes.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProyectoWeb_Martes.Controllers
{
    [FiltroSeguridad]
    [OutputCache(NoStore = true, VaryByParam = "*", Duration = 0)]
    public class CarritoController : Controller
    {
        CarritoModel modelo = new CarritoModel();

        [HttpPost]
        public ActionResult AgregarCarrito(long idProducto, int cantProducto)
        {
            Carrito entidad = new Carrito();
            entidad.ConsecutivoUsuario = long.Parse(Session["Consecutivo"].ToString());
            entidad.ConsecutivoProducto = idProducto;
            entidad.Cantidad = cantProducto;

            var respuesta = modelo.AgregarCarrito(entidad);

            if (respuesta.Codigo == 0)
            {
                var datos = modelo.ConsultarCarrito(long.Parse(Session["Consecutivo"].ToString()));
                Session["Cantidad"] = datos.Datos.AsEnumerable().Sum(x => x.Cantidad);
                Session["SubTotal"] = datos.Datos.AsEnumerable().Sum(x => x.SubTotal);

                return Json("OK", JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json(respuesta.Detalle, JsonRequestBehavior.AllowGet);
            }            
        }
    }
}