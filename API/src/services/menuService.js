const Menu = require("../database/menu");

const getMenu= async () => {
    try {
        const menu = await Menu.getMenu();
        return menu;
      } catch (error) {
        throw error;
      }
}; 

const getMenuForUser = async (idUsuario) => {
    try {
        const menu = await Menu.getMenuForUser(idUsuario); 
        return menu;
      } catch (error) {
        throw error;
      }
};

module.exports = {
    getMenu,
    getMenuForUser
};

