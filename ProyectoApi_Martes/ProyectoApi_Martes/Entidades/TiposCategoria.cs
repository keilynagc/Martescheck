using ProyectoApi_Martes.Models;
using System.Collections.Generic;

namespace ProyectoApi_Martes.Entidades
{
    public class TiposCategoria
    {
        public int IdCategoria { get; set; }
        public string NombreCategoria { get; set; }
    }

    public class ConfirmacionTiposCategoria
    {
        public int Codigo { get; set; }
        public string Detalle { get; set; }
        public List<ConsultarTiposCategoria_Result> Datos { get; set; }
        public ConsultarTiposCategoria_Result Dato { get; set; }
    }
}