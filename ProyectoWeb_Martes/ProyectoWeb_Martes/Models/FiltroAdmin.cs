using System.Web.Mvc;
using System.Web.Routing;

namespace ProyectoWeb_Martes.Models
{
    public class FiltroAdmin : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            if (filterContext.HttpContext.Session["RolUsuario"].ToString() != "1")
            {
                filterContext.Result = new RedirectToRouteResult(new RouteValueDictionary
                {
                    { "controller", "Inicio" },
                    { "action", "PantallaPrincipal"}
                });
            }

            base.OnActionExecuting(filterContext);
        }
    }
}