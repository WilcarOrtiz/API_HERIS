
const Rol = require("../database/rol");

const getAllRols = async () => {
    try {
        const allRol = await Rol.getAllRols();
        return allRol;
      } catch (error) {
        throw error;
      }
};

const getOneRol = async (idRol) => {
    try {
        const Grol = await Rol.getOneRol(idRol);
        return Grol;
      } catch (error) {
        throw error;
      }
};

const createNewRol = async (rol) => {
    try {
        const createdRol = await Rol.createNewRol(rol);
        return  createdRol ;
      } catch (error) {
        throw error;
      }
};

const updateOneRol = async (idRol,rol) => {
    try {
        const updatedRol = await Rol.updateOneRol(idRol,rol);
        return updatedRol;
      } catch (error) {
        throw error;
      }
};

const deleteOneRol = async (idRol) => {
    try {
        const deletedRol = await Rol.deleteOneRol(idRol);
        return deletedRol ;
      } catch (error) {
        throw error;
      }
};

module.exports = {
  getAllRols,
  getOneRol,
  createNewRol,
  updateOneRol,
  deleteOneRol,
};
