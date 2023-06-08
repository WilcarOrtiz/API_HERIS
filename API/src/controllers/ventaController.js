const ventaService = require("../services/ventaService");

const getAllVentas = async (req, res) => {
  try {
    const allVenta = await ventaService.getAllVentas();
    res.status(200).send({ status: "OK", data:  allVenta });
  } catch (error) {
    res.status(error?.status || 500).send({ status: "FAILED", data: { error: error?.message || error } });
  }
};

const getOneVenta = async (req, res) => {
  const { params: { idVenta },} = req;
  if (!idVenta ) {
      res.status(400).send({
           status: "FAILED", 
           data: { error: "Parameter ':idVenta' can not be empty" },
          });
      }
      try {
          const venta = await ventaService.getOneVenta(idVenta);
          res.send({ status: "OK", data: venta });
      } catch (error) {
          res.status(error?.status || 500).send({ status: "FAILED", data: { error: error?.message || error } });
      }
};

const createNewVenta = async (req, res) => {
    const { body } = req;
    if (!body.documentoCliente 
      || !body.nombreCliente 
      || !body.tipoPago  
      || !body.total 
      || !body.fechaRegistro  
      || !body.detalleVenta
      || !body.numeroDocumento) {
      res.status(400).send({
        status: "FAILED",data: {error: "The following keys is missing or is empty in request body",},
      });
      return;
    }

    console.log("entro al controller");
    try {
      const newVenta = {
        documentoCliente: body.documentoCliente, 
        nombreCliente:body.nombreCliente,
        tipoPago:body.tipoPago, 
        total:body.total, 
        fechaRegistro:body.fechaRegistro, 
        newdetalleVenta:body.detalleVenta,
        numeroDocumento:body.numeroDocumento
      };
        
      const createdVenta = await ventaService.createNewVenta(newVenta);
      res.status(201).send({ status: "OK", data: createdVenta });
    } catch (error) {
      res.status(error?.status || 500).send({ status: "FAILED", data: { error: error?.message || error } });
    }
};


module.exports = {
  getAllVentas,
  getOneVenta,
  createNewVenta
};
