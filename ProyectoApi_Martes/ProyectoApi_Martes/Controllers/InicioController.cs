using ProyectoApi_Martes.Entidades;
using ProyectoApi_Martes.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net.Mail;
using System.Web.Http;

namespace ProyectoApi_Martes.Controllers
{
    public class InicioController : ApiController
    {
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
                        respuesta.Codigo = 0;
                        respuesta.Detalle = string.Empty;
                        respuesta.Dato = datos;
                    }
                    else
                    {
                        respuesta.Codigo = -1;
                        respuesta.Detalle = "No se pudo validar su información";
                    }
                }
            }
            catch (Exception )
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
                        EnviarCorreo(datos.CorreoElectronico, "Acceso Temporal", datos.Contrasenna);

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

        private void EnviarCorreo(string destino, string asunto, string contenido)
        {
            MailMessage message = new MailMessage();
            message.From = new MailAddress(ConfigurationManager.AppSettings["cuentaCorreo"]);
            message.To.Add(new MailAddress(destino));
            message.Subject = asunto;
            message.Body = contenido;
            message.Priority = MailPriority.Normal;
            message.IsBodyHtml = true;

            SmtpClient client = new SmtpClient("smtp.office365.com", 587);
            client.Credentials = new System.Net.NetworkCredential(ConfigurationManager.AppSettings["cuentaCorreo"], 
                                                                  ConfigurationManager.AppSettings["claveCorreo"]);
            client.EnableSsl = true;
            client.Send(message);
        }

    }
}
