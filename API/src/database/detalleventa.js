
const {DetalleVenta}  = require("../models/detalleventa")


const getdetalleVenta  = async (idVenta) => {
    try {
        const detalleVenta = await DetalleVenta.findAll({where:{idVenta: idVenta}})
        if (!detalleVenta) {
          throw {
            status: 400,
            message: `Can't find sale details with the id ${idVenta}`,
          };
        }
        return detalleVenta; 
      } catch (error) {
        throw { status: error?.status || 500, message: error?.message || error };
      }
};

module.exports = {
    getdetalleVenta 
};
