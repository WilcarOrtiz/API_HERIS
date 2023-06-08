
const Venta = require("../database/venta");

const getAllVentas = async () => {
  try {
    const allVenta = await Venta.getAllVentas();
    return allVenta;
  } catch (error) {
    throw error;
  }
};

const getOneVenta = async (idVenta) => {
  try {
    const GVenta = await Venta.getOneVenta(idVenta);
    return GVenta;
  } catch (error) {
    throw error;
  }
};

const createNewVenta = async (newVenta) => {
    try {
        const createdVenta = await Venta.createNewVenta(newVenta);
        return createdVenta; 
      } catch (error) {
        throw error;
      } 
};




module.exports = {
  getAllVentas,
  getOneVenta,
  createNewVenta
};
