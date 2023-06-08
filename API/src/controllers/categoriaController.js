const categoriaService = require("../services/categoriaService");

const getAllCategorias = async (req, res) => {
  try {
    const allCategoria = await categoriaService.getAllCategorias();
    res.status(200).send({ status: "OK", data:  allCategoria });
  } catch (error) {
    res.status(error?.status || 500).send({ status: "FAILED", data: { error: error?.message || error } });
  }
};

const getOneCategoria = async (req, res) => {
    const { params: { idCategoria },} = req;
    if (!idCategoria) {
        res.status(400).send({
             status: "FAILED", 
             data: { error: "Parameter ':idCategoria' can not be empty" },
            });
        }
        try {
            const Categoria = await categoriaService.getOneCategoria(idCategoria);
            res.send({ status: "OK", data: Categoria  });
        } catch (error) {
            res.status(error?.status || 500).send({ status: "FAILED", data: { error: error?.message || error } });
        }
};

const createNewCategoria = async (req, res) => {
    const { descripcion, esActivo, fechaRegistro } = req.body;
    if (!descripcion || !esActivo || !fechaRegistro ) {
        res.status(400).send({
          status: "FAILED", data: { error: "Missing or empty keys in the request body",},
        });
        return;
      }
    const Categoria= { descripcion, esActivo, fechaRegistro, };
    try {
        const createdCategoria = await categoriaService.createNewCategoria(Categoria); 
        res.status(201).send({ status: "OK", data: createdCategoria });
      } catch (error) {
        res.status(error?.status || 500).send({ status: "FAILED", data: { error: error?.message || error } });
      }
};

const updateOneCategoria = async (req, res) => {
    const { body, params: { idCategoria },} = req;
    if (!body.descripcion || !body.esActivo || !body.fechaRegistro ) {
        res.status(400).send({
          status: "FAILED", data: { error: "Missing or empty keys in the request body",},
        });
        return;
      }
    const Categoria= { descripcion:body.descripcion, esActivo:body.esActivo , fechaRegistro:body.fechaRegistro, };
    try {
        const updateCategoria = await categoriaService.updateOneCategoria(idCategoria,Categoria); 
        res.status(201).send({ status: "OK", data: updateCategoria });
      } catch (error) {
        res.status(error?.status || 500).send({ status: "FAILED", data: { error: error?.message || error } });
      }
};

const deleteOneCategoria = async (req, res) => {
    const { params: { idCategoria },} = req;
    if (!idCategoria) {
        res.status(400).send({
             status: "FAILED", 
             data: { error: "Parameter ':idCategoria' can not be empty" },
            });
        }
        try {
            const Categoria = await categoriaService.deleteOneCategoria(idCategoria);
            res.send({ status: "OK", data:`Deleted Categoriaes with description: ${Categoria}`   });
        } catch (error) {
            res.status(error?.status || 500).send({ status: "FAILED", data: { error: error?.message || error } });
        }
};

module.exports = {
  getAllCategorias,
  getOneCategoria,
  createNewCategoria,
  updateOneCategoria,
  deleteOneCategoria,
};
