
const Usuario = require("../database/usuario");

const getAllUsuarios = async () => {
  try {
    const allUsuarios = await Usuario.getAllUsuarios();
    return allUsuarios;
  } catch (error) {
    throw error;
  }
};

const getOneUsuario = async (idUsuario) => {
  try {
    const GoUsuario = await Usuario.getOneUsuario(idUsuario);
    return GoUsuario;
  } catch (error) {
    throw error;
  }
};

const createNewUsuario = async (newUser) => {
  try {
    const SnewUser = await Usuario.createNewUsuario(newUser); 
    return SnewUser;
  } catch (error) {
    throw { error};
  }
};

const updateOneUsuario = async (idUsuario,User) => {
  try {
    const updatedUser = await Usuario.updateOneUsuario(idUsuario,User);
    return updatedUser;
  } catch (error) {
    throw error;
  }
};

const deleteOneUsuario = async (idUsuario) => {
  try {
    const deletedUsuario = await Usuario.deleteOneUsuario(idUsuario);
    return deletedUsuario ;
  } catch (error) {
    throw error;
  }
};


const signin = async (newUser) => {
  try {
    const SnewUser = await Usuario.signin(newUser);
    return SnewUser;
  } catch (error) {
    throw { error};
  }
};

module.exports = {
  getAllUsuarios,
  getOneUsuario,
  createNewUsuario,
  updateOneUsuario,
  deleteOneUsuario,
  signin
};
