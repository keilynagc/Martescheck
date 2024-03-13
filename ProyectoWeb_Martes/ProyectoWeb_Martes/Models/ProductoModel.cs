using ProyectoWeb_Martes.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http.Json;
using System.Net.Http;
using System.Web;
using System.Configuration;

namespace ProyectoWeb_Martes.Models
{
    public class ProductoModel
    {
        public string url = ConfigurationManager.AppSettings["urlWebApi"];

        public ConfirmacionProducto ConsultarProductos(bool MostrarTodos)
        {
            using (var client = new HttpClient())
            {
                url += "Producto/ConsultarProductos?MostrarTodos=" + MostrarTodos;
                var respuesta = client.GetAsync(url).Result;

                if (respuesta.IsSuccessStatusCode)
                    return respuesta.Content.ReadFromJsonAsync<ConfirmacionProducto>().Result;
                else
                    return null;
            }
        }

        public Confirmacion RegistrarProducto(Producto entidad)
        {
            using (var client = new HttpClient())
            {
                url += "Producto/RegistrarProducto";
                JsonContent jsonEntidad = JsonContent.Create(entidad);
                var respuesta = client.PostAsync(url, jsonEntidad).Result;

                if (respuesta.IsSuccessStatusCode)
                    return respuesta.Content.ReadFromJsonAsync<Confirmacion>().Result;
                else
                    return null;
            }
        }

        public Confirmacion ActualizarImagenProducto(Producto entidad)
        {
            using (var client = new HttpClient())
            {
                url += "Producto/ActualizarImagenProducto";
                JsonContent jsonEntidad = JsonContent.Create(entidad);
                var respuesta = client.PutAsync(url, jsonEntidad).Result;

                if (respuesta.IsSuccessStatusCode)
                    return respuesta.Content.ReadFromJsonAsync<Confirmacion>().Result;
                else
                    return null;
            }
        }

        public ConfirmacionTiposCategoria ConsultarTiposCategoria()
        {
            using (var client = new HttpClient())
            {
                url += "Producto/ConsultarTiposCategoria";
                var respuesta = client.GetAsync(url).Result;

                if (respuesta.IsSuccessStatusCode)
                    return respuesta.Content.ReadFromJsonAsync<ConfirmacionTiposCategoria>().Result;
                else
                    return null;
            }
        }
    }
}