using ProyectoWeb_Martes.Entidades;
using System.Configuration;
using System.Net.Http;
using System.Net.Http.Json;
using System.Web;

namespace ProyectoWeb_Martes.Models
{
    public class UsuarioModel
    {
        public string url = ConfigurationManager.AppSettings["urlWebApi"];

        public Confirmacion RegistrarUsuario(Usuario entidad)
        {
            using (var client = new HttpClient())
            {
                url += "Inicio/RegistrarUsuario";
                JsonContent jsonEntidad = JsonContent.Create(entidad);
                var respuesta = client.PostAsync(url, jsonEntidad).Result;

                if (respuesta.IsSuccessStatusCode)
                    return respuesta.Content.ReadFromJsonAsync<Confirmacion>().Result;
                else
                    return null;
            }
        }

        public ConfirmacionUsuario IniciarSesionUsuario(Usuario entidad)
        {
            using (var client = new HttpClient())
            {
                url += "Inicio/IniciarSesionUsuario";
                JsonContent jsonEntidad = JsonContent.Create(entidad);
                var respuesta = client.PostAsync(url, jsonEntidad).Result;

                if (respuesta.IsSuccessStatusCode)
                    return respuesta.Content.ReadFromJsonAsync<ConfirmacionUsuario>().Result;
                else
                    return null;
            }
        }

        public Confirmacion RecuperarAccesoUsuario(Usuario entidad)
        {
            using (var client = new HttpClient())
            {
                url += "Inicio/RecuperarAccesoUsuario";
                JsonContent jsonEntidad = JsonContent.Create(entidad);
                var respuesta = client.PostAsync(url, jsonEntidad).Result;

                if (respuesta.IsSuccessStatusCode)
                    return respuesta.Content.ReadFromJsonAsync<Confirmacion>().Result;
                else
                    return null;
            }
        }
        
        public ConfirmacionUsuario ConsultarUsuario()
        {
            using (var client = new HttpClient())
            {
                long Consecutivo = long.Parse(HttpContext.Current.Session["Consecutivo"].ToString());
                string url = ConfigurationManager.AppSettings["urlWebApi"] + "Usuario/ConsultarUsuario?Consecutivo=" + Consecutivo;
                var respuesta = client.GetAsync(url).Result;

                if (respuesta.IsSuccessStatusCode)
                    return respuesta.Content.ReadFromJsonAsync<ConfirmacionUsuario>().Result;
                else
                    return null;
            }
        }

        public Confirmacion ActualizarUsuario(Usuario entidad)
        {
            using (var client = new HttpClient())
            {
                entidad.Consecutivo = long.Parse(HttpContext.Current.Session["Consecutivo"].ToString());
                string url = ConfigurationManager.AppSettings["urlWebApi"] + "Usuario/ActualizarUsuario";
                JsonContent jsonEntidad = JsonContent.Create(entidad);
                var respuesta = client.PutAsync(url, jsonEntidad).Result;

                if (respuesta.IsSuccessStatusCode)
                    return respuesta.Content.ReadFromJsonAsync<Confirmacion>().Result;
                else
                    return null;
            }
        }
    }
}