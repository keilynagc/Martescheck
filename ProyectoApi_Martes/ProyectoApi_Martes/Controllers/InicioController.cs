using ProyectoApi_Martes.Entidades;
using ProyectoApi_Martes.Models;
using System;
using System.Web.Http;

namespace ProyectoApi_Martes.Controllers
{
    public class InicioController : ApiController
    {
        [Route("Inicio/RegistrarUsuario")]
        [HttpPost]
        public int RegistrarUsuario(Usuario entidad)
        {
            try
            {
                using (var db = new martes_dbEntities())
                {
                    return db.RegistrarUsuario(entidad.Identificacion, entidad.Contrasenna, entidad.Nombre, entidad.CorreoElectronico);
                }
            }
            catch (Exception ex)
            {
                return -1;
            }
            
        }

    }
}
