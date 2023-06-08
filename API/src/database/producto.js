
const {Producto}  = require("../models/producto")
const {Categoria}  = require("../models/categoria")

const getAllProductos = async () => {   
  try {
    const Productos = await Producto.findAll();
    return Productos ;
   } catch (error) {
     throw { status: 500, message: error?.message || error };
   }
};

const getOneProducto = async () => {
};

const createNewProducto = async (newProducto) => {
    let id=0;
    try {
      const {nombre, descripcion, stock,  precio,esActivo, proCategoria, fechaRegistro}= newProducto;
      if (proCategoria) {
        const foundCategoria  = await Categoria.findOne({ where: { descripcion: proCategoria } });
        id=foundCategoria.idCategoria
      } 

      const SnewProducto = await Producto.create({
        nombre,
        descripcion,
        stock,
        esActivo,
        idCategoria:id,
        fechaRegistro,
        precio
      });

      return SnewProducto;
    } catch (error) {
      throw { status: 500, message: error?.message || error };
    }
};

const updateOneProducto = async (idProducto ,newProducto) => {
    let id=0;
    try {
      const updateProducto = await Producto.findOne({ where: { idProducto} });
      if (!updateProducto) {
         throw {
          status: 404,
          message: `Product with id '${idProducto}' not found`,
        };
      }

      if (newProducto.proCategoria) {
        const foundCategoria = await Categoria.findOne({ where: { descripcion: newProducto.proCategoria} });
        id= foundCategoria.idCategoria
      }


      updateProducto.nombre = newProducto.nombre;
      updateProducto.descripcion = newProducto.descripcion;
      updateProducto.stock= newProducto.stock;
      updateProducto.precio= newProducto.precio;
      updateProducto.esActivo= newProducto.esActivo; 
      updateProducto.fechaRegistro = newProducto.fechaRegistro; 
      updateProducto.idCategoria=id; 

      await updateProducto.save();
      return updateProducto;
    } catch (error) {
      throw { status: error?.status || 500, message: error?.message || error };
    }
};

const deleteOneProducto = async (idProducto) => {
  
  try {
    const updateProducto = await Producto.findOne({ where: { idProducto} });
    if (!updateProducto) {
       throw {
        status: 404,
        message: `Product with id '${idProducto}' not found`,
      };
    }
    
    updateProducto.nombre;
    updateProducto.descripcion;
    updateProducto.stock;
    updateProducto.precio;
    updateProducto.esActivo= false; 
    updateProducto.fechaRegistro; 
    updateProducto.idCategoria; 

    await updateProducto.save();
    return updateProducto.nombre;
  } catch (error) {
    throw { status: error?.status || 500, message: error?.message || error };
  }
};

module.exports = {
  getAllProductos,
  getOneProducto,
  createNewProducto,
  updateOneProducto,
  deleteOneProducto,
};
