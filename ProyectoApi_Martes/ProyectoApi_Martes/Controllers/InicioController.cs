using ProyectoApi_Martes.Entidades;
using ProyectoApi_Martes.Models;
using System;
using System.Collections.Generic;
using System.Linq;
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

        [Route("Inicio/IniciarSesionUsuario")]
        [HttpPost]
        public List<IniciarSesionUsuario_Result> IniciarSesionUsuario(Usuario entidad)
        {
            try
            {
                using (var db = new martes_dbEntities())
                {
                    var datos = db.IniciarSesionUsuario(entidad.Identificacion, entidad.Contrasenna).ToList();

                    if (datos.Count > 0)
                        return datos;
                    else
                        return null;
                }
            }
            catch (Exception ex)
            {
                return null;
            }
        }

    }
}
