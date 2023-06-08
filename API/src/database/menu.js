
const { MenuRol } = require("../models/menuRol");
const { Menu } = require("../models/menu");
const { Usuario } = require("../models/usuario");

const getMenu= async () => {
    try {
        const menu = await Menu.findAll();
        return menu;
      } catch (error) {
        throw { status: error?.status || 500, message: error?.message || error };
      }
}; 

const getMenuForUser = async (idUsuario) => {
    try {
        
        const foundUsuario = await Usuario.findOne({where: {idUsuario: idUsuario}});
        const foundMenuRol = await MenuRol.findAll({where: {idRol: foundUsuario.idRol}});
        
        const foundMenu = await Menu.findAll({
            where:{
                idMenu: foundMenuRol.map(m => m.idMenu)
            }
        });
        
        return  foundMenu;
      } catch (error) {
        throw { status: error?.status || 500, message: error?.message || error };
      }
}; 

module.exports = {
    getMenu,
    getMenuForUser
};

