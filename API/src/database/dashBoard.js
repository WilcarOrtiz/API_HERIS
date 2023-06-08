const {Categoria}  = require("../models/categoria");
const {Producto}  = require("../models/producto"); 
const {Venta}  = require("../models/venta");
const {Usuario}  = require("../models/usuario"); 

const getdashBoard = async () => {
    try {
        const NumProductos = await Producto.count();
        const NumCategoria = await Categoria.count();
        const NumUsuario = await Usuario.count();
        const NumVenta = await Venta.count();

        const Ventas = await Venta.findAll();
        const totalVentas = Ventas.map(item => item.total).reduce((total, current) => total + current, 0);

        const dashBoard={NumProductos, NumCategoria,NumUsuario,NumVenta,totalVentas}; 
        return dashBoard; 

       } catch (error) {
         throw { status: 500, message: error?.message || error };
    }
};

module.exports = {
    getdashBoard 
  };