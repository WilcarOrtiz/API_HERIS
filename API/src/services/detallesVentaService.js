
const Detalleventa = require("../database/detalleventa");

const getdetalleVenta = async (idVenta) => {
    try {
        const OnedetalleVenta = await Detalleventa.getdetalleVenta(idVenta);
        return OnedetalleVenta;
      } catch (error) {
        throw error;
      }
};

module.exports = {
    getdetalleVenta 
};
