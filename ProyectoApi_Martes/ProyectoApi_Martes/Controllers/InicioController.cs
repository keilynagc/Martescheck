using ProyectoApi_Martes.Entidades;
using ProyectoApi_Martes.Models;
using System;
using System.IO;
using System.Linq;
using System.Web.Http;

namespace ProyectoApi_Martes.Controllers
{
    public class InicioController : ApiController
    {
        UtilitariosModel model = new UtilitariosModel();

        [HttpPost]
        [Route("Inicio/RegistrarUsuario")]
        public Confirmacion RegistrarUsuario(Usuario entidad)
        {
            var respuesta = new Confirmacion();

            try
            {
                using (var db = new martes_dbEntities())
                {
                    var resp = db.RegistrarUsuario(entidad.Identificacion, entidad.Contrasenna, entidad.Nombre, entidad.CorreoElectronico);

                    if (resp > 0)
                    {
                        respuesta.Codigo = 0;
                        respuesta.Detalle = string.Empty;
                    }
                    else
                    {
                        respuesta.Codigo = -1;
                        respuesta.Detalle = "Su información ya se encuentra registrada";
                    }
                }
            }
            catch (Exception)
            {
                respuesta.Codigo = -1;
                respuesta.Detalle = "Se presentó un error en el sistema";
            }

            return respuesta;
        }

        [HttpPost]
        [Route("Inicio/IniciarSesionUsuario")]
        public ConfirmacionUsuario IniciarSesionUsuario(Usuario entidad)
        {
            var respuesta = new ConfirmacionUsuario();

            try
            {
                using (var db = new martes_dbEntities())
                {
                    var datos = db.IniciarSesionUsuario(entidad.Identificacion, entidad.Contrasenna).FirstOrDefault();

                    if (datos != null)
                    {
                        if (datos.Temporal && DateTime.Now > datos.Vencimiento)
                        {
                            respuesta.Codigo = -1;
                            respuesta.Detalle = "Su contraseña temporal ha caducado";
                        }
                        else
                        {
                            respuesta.Codigo = 0;
                            respuesta.Detalle = string.Empty;
                            respuesta.Dato = datos;
                        }
                    }
                    else
                    {
                        respuesta.Codigo = -1;
                        respuesta.Detalle = "No se pudo validar su información";
                    }
                }
            }
            catch (Exception)
            {
                respuesta.Codigo = -1;
                respuesta.Detalle = "Se presentó un error en el sistema";
            }

            return respuesta;
        }

        [HttpPost]
        [Route("Inicio/RecuperarAccesoUsuario")]
        public Confirmacion RecuperarAccesoUsuario(Usuario entidad)
        {
            var respuesta = new Confirmacion();

            try
            {
                using (var db = new martes_dbEntities())
                {
                    var datos = db.RecuperarAccesoUsuario(entidad.Identificacion, entidad.CorreoElectronico).FirstOrDefault();

                    if (datos != null)
                    {
                        string ruta = AppDomain.CurrentDomain.BaseDirectory + "Password.html";
                        string contenido = File.ReadAllText(ruta);
                        contenido = contenido.Replace("@@Nombre", datos.Nombre);
                        contenido = contenido.Replace("@@Contrasenna", datos.Contrasenna);
                        contenido = contenido.Replace("@@Vencimiento", datos.Vencimiento.ToString("dd/MM/yyyy hh:mm:ss tt"));
                        model.EnviarCorreo(datos.CorreoElectronico, "Acceso Temporal", contenido);

                        respuesta.Codigo = 0;
                        respuesta.Detalle = string.Empty;
                    }
                    else
                    {
                        respuesta.Codigo = -1;
                        respuesta.Detalle = "No se pudo validar su información";
                    }
                }
            }
            catch (Exception)
            {
                respuesta.Codigo = -1;
                respuesta.Detalle = "Se presentó un error en el sistema";
            }

            return respuesta;
        }
    }
}
