using ProyectoWeb_Martes.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http.Json;
using System.Net.Http;
using System.Security.Policy;
using System.Web;
using System.Configuration;

namespace ProyectoWeb_Martes.Models
{
    public class CarritoModel
    {
        public string url = ConfigurationManager.AppSettings["urlWebApi"];

        public Confirmacion AgregarCarrito(Carrito entidad)
        {
            using (var client = new HttpClient())
            {
                url += "Carrito/AgregarCarrito";
                JsonContent jsonEntidad = JsonContent.Create(entidad);
                var respuesta = client.PostAsync(url, jsonEntidad).Result;

                if (respuesta.IsSuccessStatusCode)
                    return respuesta.Content.ReadFromJsonAsync<Confirmacion>().Result;
                else
                    return null;
            }
        }

        public ConfirmacionCarrito ConsultarCarrito(long ConsecutivoUsuario)
        {
            using (var client = new HttpClient())
            {
                string url = ConfigurationManager.AppSettings["urlWebApi"] + "Carrito/ConsultarCarrito?ConsecutivoUsuario=" + ConsecutivoUsuario;
                var respuesta = client.GetAsync(url).Result;

                if (respuesta.IsSuccessStatusCode)
                    return respuesta.Content.ReadFromJsonAsync<ConfirmacionCarrito>().Result;
                else
                    return null;
            }
        }

    }
}