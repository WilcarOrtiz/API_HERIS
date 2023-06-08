
const Categoria = require("../database/categoria");

const getAllCategorias = async () => {
    try {
        const allCategoria = await Categoria.getAllCategorias();
        return allCategoria;
      } catch (error) {
        throw error;
      }
};

const getOneCategoria = async (idCategoria) => {
    try {
        const GCategoria = await Categoria.getOneCategoria(idCategoria);
        return GCategoria;
      } catch (error) {
        throw error;
      }
};

const createNewCategoria = async (newCategoria) => {
    try {
        const createdCategoria = await Categoria.createNewCategoria(newCategoria);
        return createdCategoria; 
      } catch (error) {
        throw error;
      }
};

const updateOneCategoria = async (idCategoria,newCategoria) => {
    try {
        const updatedCategoria = await Categoria.updateOneCategoria(idCategoria,newCategoria);
        return updatedCategoria;
      } catch (error) {
        throw error;
      }
};

const deleteOneCategoria = async (idCategoria) => {
    try {
        const deletedCategoria = await Categoria.deleteOneCategoria(idCategoria);
        return deletedCategoria ;
      } catch (error) {
        throw error;
      }
};

module.exports = {
  getAllCategorias,
  getOneCategoria,
  createNewCategoria,
  updateOneCategoria,
  deleteOneCategoria,
};
