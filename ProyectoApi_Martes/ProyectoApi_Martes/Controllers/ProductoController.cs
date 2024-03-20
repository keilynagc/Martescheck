using ProyectoApi_Martes.Entidades;
using ProyectoApi_Martes.Models;
using System;
using System.Linq;
using System.Web.Http;

namespace ProyectoApi_Martes.Controllers
{
    public class ProductoController : ApiController
    {
        [HttpGet]
        [Route("Producto/ConsultarProductos")]
        public ConfirmacionProducto ConsultarProductos(bool MostrarTodos)
        {
            var respuesta = new ConfirmacionProducto();

            try
            {
                using (var db = new martes_dbEntities())
                {
                    var datos = db.ConsultarProductos(MostrarTodos).ToList();

                    if (datos.Count > 0)
                    {
                        respuesta.Codigo = 0;
                        respuesta.Detalle = string.Empty;
                        respuesta.Datos = datos;
                    }
                    else
                    {
                        respuesta.Codigo = -1;
                        respuesta.Detalle = "No se encontraron resultados";
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

        [HttpGet]
        [Route("Producto/ConsultarProducto")]
        public ConfirmacionProducto ConsultarProducto(long Consecutivo)
        {
            var respuesta = new ConfirmacionProducto();

            try
            {
                using (var db = new martes_dbEntities())
                {
                    var datos = db.ConsultarProducto(Consecutivo).FirstOrDefault();

                    if (datos != null)
                    {
                        respuesta.Codigo = 0;
                        respuesta.Detalle = string.Empty;
                        respuesta.Dato = datos;
                    }
                    else
                    {
                        respuesta.Codigo = -1;
                        respuesta.Detalle = "No se encontraron resultados";
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
        [Route("Producto/RegistrarProducto")]
        public Confirmacion RegistrarProducto(Producto entidad)
        {
            var respuesta = new Confirmacion();

            try
            {
                using (var db = new martes_dbEntities())
                {
                    var resp = db.RegistrarProducto(entidad.NombreProducto, entidad.Precio, entidad.Inventario, entidad.IdCategoria).FirstOrDefault();

                    if (resp > 0)
                    {
                        respuesta.Codigo = 0;
                        respuesta.Detalle = string.Empty;
                        respuesta.ConsecutivoGenerado = resp.Value;
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

        [HttpPut]
        [Route("Producto/ActualizarImagenProducto")]
        public Confirmacion ActualizarImagenProducto(Producto entidad)
        {
            var respuesta = new Confirmacion();

            try
            {
                using (var db = new martes_dbEntities())
                {
                    var resp = db.ActualizarImagenProducto(entidad.Consecutivo, entidad.RutaImagen);

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

        [HttpGet]
        [Route("Producto/ConsultarTiposCategoria")]
        public ConfirmacionTiposCategoria ConsultarTiposCategoria()
        {
            var respuesta = new ConfirmacionTiposCategoria();

            try
            {
                using (var db = new martes_dbEntities())
                {
                    var datos = db.ConsultarTiposCategoria().ToList();

                    if (datos.Count > 0)
                    {
                        respuesta.Codigo = 0;
                        respuesta.Detalle = string.Empty;
                        respuesta.Datos = datos;
                    }
                    else
                    {
                        respuesta.Codigo = -1;
                        respuesta.Detalle = "No se encontraron resultados";
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

        [HttpPut]
        [Route("Producto/ActualizarProducto")]
        public Confirmacion ActualizarProducto(Producto entidad)
        {
            var respuesta = new Confirmacion();

            try
            {
                using (var db = new martes_dbEntities())
                {
                    var resp = db.ActualizarProducto(entidad.Consecutivo, entidad.NombreProducto, entidad.Precio, entidad.Inventario, entidad.IdCategoria);

                    if (resp > 0)
                    {
                        respuesta.Codigo = 0;
                        respuesta.Detalle = string.Empty;
                    }
                    else
                    {
                        respuesta.Codigo = -1;
                        respuesta.Detalle = "El producto no se pudo actualizar";
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

        [HttpDelete]
        [Route("Producto/EliminarProducto")]
        public Confirmacion EliminarProducto(long Consecutivo)
        {
            var respuesta = new Confirmacion();

            try
            {
                using (var db = new martes_dbEntities())
                {
                    var resp = db.EliminarProducto(Consecutivo);

                    if (resp > 0)
                    {
                        respuesta.Codigo = 0;
                        respuesta.Detalle = string.Empty;
                    }
                    else
                    {
                        respuesta.Codigo = -1;
                        respuesta.Detalle = "El producto no se pudo eliminar";
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