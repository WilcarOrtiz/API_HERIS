
const Producto = require("../database/producto");


const getAllProductos = async () => {
  try {
    const allProducto = await Producto.getAllProductos();
    return allProducto;
  } catch (error) {
    throw error;
  }   
};

const getOneProducto = async () => {

};

const createNewProducto = async (newProducto) => {
    try {
        const SnewProducto = await Producto.createNewProducto(newProducto); 
        return SnewProducto;
      } catch (error) {
        throw { error};
      } 
};

const updateOneProducto = async (idProducto ,newProducto) => {
  try {
    const updateProducto = await Producto.updateOneProducto(idProducto ,newProducto); 
    return updateProducto;
  } catch (error) {
    throw { error};
  } 
};

const deleteOneProducto = async (idProducto) => {
  try {
    const deletedProducto = await Producto.deleteOneProducto(idProducto);
    return deletedProducto ;
  } catch (error) {
    throw error;
  } 
};

module.exports = {
  getAllProductos,
  getOneProducto,
  createNewProducto,
  updateOneProducto,
  deleteOneProducto,
};
