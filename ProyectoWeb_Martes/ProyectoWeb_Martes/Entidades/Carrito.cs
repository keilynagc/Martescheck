using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProyectoWeb_Martes.Entidades
{
    public class Carrito
    {
        public long ConsecutivoCarrito { get; set; }
        public long ConsecutivoUsuario { get; set; }
        public long ConsecutivoProducto { get; set; }
        public int Cantidad { get; set; }
        public decimal SubTotal { get; set; }
    }

    public class ConfirmacionCarrito
    {
        public int Codigo { get; set; }
        public string Detalle { get; set; }
        public List<Carrito> Datos { get; set; }
        public Carrito Dato { get; set; }
    }
}