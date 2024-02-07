using ProyectoWeb_Martes.Entidades;
using System.Collections.Generic;
using System.Net.Http;
using System.Net.Http.Json;

namespace ProyectoWeb_Martes.Models
{
    public class UsuarioModel
    {
        public string url = "https://localhost:44333/";

        public int RegistrarUsuario(Usuario entidad)
        {
            using (var client = new HttpClient())
            {
                url += "Inicio/RegistrarUsuario";
                JsonContent jsonEntidad = JsonContent.Create(entidad);
                var respuesta = client.PostAsync(url, jsonEntidad).Result;

                if (respuesta.IsSuccessStatusCode)
                    return respuesta.Content.ReadFromJsonAsync<int>().Result;

                return 0;
            }
        }

        public List<Usuario> IniciarSesionUsuario(Usuario entidad)
        {
            using (var client = new HttpClient())
            {
                url += "Inicio/IniciarSesionUsuario";
                JsonContent jsonEntidad = JsonContent.Create(entidad);
                var respuesta = client.PostAsync(url, jsonEntidad).Result;

                if (respuesta.IsSuccessStatusCode)
                    return respuesta.Content.ReadFromJsonAsync<List<Usuario>>().Result;

                return null;
            }
        }

    }
}