const {DetalleVenta}  = require("../models/detalleventa");
const {Producto} = require("../models/producto");
const { Venta } = require("../models/venta");


const getAllVentas = async (req, res) => {
    try {
        const allVenta = await Venta.findAll();
        return allVenta ;
       } catch (error) {
         throw { status: 500, message: error?.message || error };
       }
};

const getOneVenta = async (idVenta) => {
    try {
        const GVenta = await Venta.findOne({where:{idVenta}})
        if (!GVenta) {
          throw {
            status: 400,
            message: `Can't find sale with the id ${idVenta}`,
          };
        }
        return GVenta; 
      } catch (error) {
        throw { status: error?.status || 500, message: error?.message || error };
      }
};

const createNewVenta = async (newVenta) => {

  console.log("entro al db"); 
  console.log(newVenta.newdetalleVenta); 
    let productoId=0;
    try {
        const { 
          numeroDocumento,
          documentoCliente, 
          nombreCliente, 
          tipoPago, total, 
          fechaRegistro, 
          newdetalleVenta} = newVenta;

        const SnewVenta = await Venta.create({
          numeroDocumento,
          documentoCliente, 
          nombreCliente, 
          tipoPago, 
          total, 
          fechaRegistro,});
          
          const nuevoId = SnewVenta.idVenta;
          
          newdetalleVenta.map( async (item )=> {
              
              const foundproducto =  await Producto.findOne({ where: {nombre: item.producto } });
              productoId=foundproducto.idProducto
        
              DetalleVenta.create({
                idVenta:nuevoId,
                producto:item.producto,
                cantidad:item.cantidad,
                precio:item.precio,
                total:item.total,
                idProducto:productoId,
            }); 
        });
        
        return SnewVenta;
      } catch (error) {
        throw { status: 500, message: error?.message || error };
      }
};

module.exports = {
  getAllVentas,
  getOneVenta,
  createNewVenta
};
