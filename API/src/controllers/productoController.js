const productoService = require("../services/productoService");

const getAllProductos = async (req, res) => {
  try {
    const allProducto = await productoService.getAllProductos();
    res.status(200).send({ status: "OK", data:  allProducto });
  } catch (error) {
    res.status(error?.status || 500).send({ status: "FAILED", data: { error: error?.message || error } });
  }
};

const getOneProducto = async (req, res) => {

};

const createNewProducto = async (req, res) => {
    const { body } = req;
  if (!body.nombre || !body.descripcion  
    || !body.stock  || !body.precio 
    || !body.esActivo  || !body.fechaRegistro 
    || !body.Categoria ) {
    res.status(400).send({
      status: "FAILED",data: {error: "The following keys is missing or is empty in request body",},
    });
    return;
  }

  try {
    const newProducto = {nombre:body.nombre, precio:body.precio, descripcion:body.descripcion, stock:body.stock, esActivo:body.esActivo, proCategoria:body.Categoria, fechaRegistro:body.fechaRegistro};
    const createdProducto = await productoService.createNewProducto(newProducto);
    res.status(201).send({ status: "OK", data: createdProducto });
  } catch (error) {
    res.status(error?.status || 500).send({ status: "FAILED", data: { error: error?.message || error } });
  }
};

const updateOneProducto = async (req, res) => {
  const { body, params: { idProducto },} = req;
  if (!body.nombre || !body.descripcion  
    || !body.stock  || !body.precio 
    || !body.esActivo  || !body.fechaRegistro 
    || !body.Categoria ) {
    res.status(400).send({
      status: "FAILED",data: {error: "The following keys is missing or is empty in request body",},
    });
    return;
  }

  try {
    const newProducto = {nombre:body.nombre, precio:body.precio, descripcion:body.descripcion, stock:body.stock, esActivo:body.esActivo, proCategoria:body.Categoria, fechaRegistro:body.fechaRegistro};
    const createdProducto = await productoService.updateOneProducto(idProducto ,newProducto);
    res.status(201).send({ status: "OK", data: createdProducto });
  } catch (error) {
    res.status(error?.status || 500).send({ status: "FAILED", data: { error: error?.message || error } });
  }
};

const deleteOneProducto = async (req, res) => {
  const { params: { idProducto },} = req;
  if (!idProducto) {
      res.status(400).send({
           status: "FAILED", 
           data: { error: "Parameter ':idProducto' can not be empty" },
          });
      }
      try {
          const Producto = await productoService.deleteOneProducto(idProducto);
          res.send({ status: "OK", data:`Deleted product with description: ${Producto}`   });
      } catch (error) {
          res.status(error?.status || 500).send({ status: "FAILED", data: { error: error?.message || error } });
      }
};

module.exports = {
  getAllProductos,
  getOneProducto,
  createNewProducto,
  updateOneProducto,
  deleteOneProducto,
};
