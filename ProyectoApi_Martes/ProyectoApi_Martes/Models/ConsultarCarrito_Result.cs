//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ProyectoApi_Martes.Models
{
    using System;
    
    public partial class ConsultarCarrito_Result
    {
        public long ConsecutivoCarrito { get; set; }
        public long ConsecutivoUsuario { get; set; }
        public long ConsecutivoProducto { get; set; }
        public System.DateTime FechaCarrito { get; set; }
        public int Cantidad { get; set; }
        public Nullable<decimal> SubTotal { get; set; }
    }
}
