
const menuService = require("../services/menuService");

const getMenu= async (req, res) => {
    try {
        const menu = await menuService.getMenu();
        res.send({ status: "OK", data: menu  });
    } catch (error) {
        res.status(error?.status || 500).send({ status: "FAILED", data: { error: error?.message || error } });
    }
}; 

const  getMenuForUser= async (req, res) => {
    const { params: { idUsuario },} = req;
    if (!idUsuario) {
        res.status(400).send({
             status: "FAILED", 
             data: { error: "Parameter ':idUsuario' can not be empty" },
            });
        }

    try {
        const menu = await menuService.getMenuForUser(idUsuario);
        res.send({ status: "OK", data: menu  });
    } catch (error) {
        res.status(error?.status || 500).send({ status: "FAILED", data: { error: error?.message || error } });
    }
}; 

module.exports = {
    getMenu,
    getMenuForUser
};



