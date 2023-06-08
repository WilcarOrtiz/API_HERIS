const rolService = require("../services/rolService");

const getAllRols = async (req, res) => {
    try {
        const allRol = await rolService.getAllRols();
        res.status(200).send({ status: "OK", data:  allRol });
      } catch (error) {
        res.status(error?.status || 500).send({ status: "FAILED", data: { error: error?.message || error } });
      }
};

const getOneRol = async (req, res) => {
    const { params: { idRol },} = req;
    if (!idRol) {
        res.status(400).send({
             status: "FAILED", 
             data: { error: "Parameter ':idRol' can not be empty" },
            });
        }
        try {
            const rol = await rolService.getOneRol(idRol);
            res.send({ status: "OK", data: rol  });
        } catch (error) {
            res.status(error?.status || 500).send({ status: "FAILED", data: { error: error?.message || error } });
        }
};

const createNewRol = async (req, res) => {
    const { descripcion, esActivo, fechaRegistro } = req.body;
    if (!descripcion || !esActivo || !fechaRegistro ) {
        res.status(400).send({
          status: "FAILED", data: { error: "Missing or empty keys in the request body",},
        });
        return;
      }
    const rol= { descripcion, esActivo, fechaRegistro, };
    try {
        const createdRol = await rolService.createNewRol(rol); 
        res.status(201).send({ status: "OK", data: createdRol });
      } catch (error) {
        res.status(error?.status || 500).send({ status: "FAILED", data: { error: error?.message || error } });
      }
};

const updateOneRol = async (req, res) => {
    const { body, params: { idRol },} = req;
    if (!body.descripcion || !body.esActivo || !body.fechaRegistro ) {
        res.status(400).send({
          status: "FAILED", data: { error: "Missing or empty keys in the request body",},
        });
        return;
      }
    const rol= { descripcion:body.descripcion, esActivo:body.esActivo , fechaRegistro:body.fechaRegistro, };
    try {
        const updateRol = await rolService.updateOneRol(idRol,rol); 
        res.status(201).send({ status: "OK", data: updateRol });
      } catch (error) {
        res.status(error?.status || 500).send({ status: "FAILED", data: { error: error?.message || error } });
      }
};

const deleteOneRol = async (req, res) => {
    const { params: { idRol },} = req;
    if (!idRol) {
        res.status(400).send({
             status: "FAILED", 
             data: { error: "Parameter ':idRol' can not be empty" },
            });
        }
        try {
            const rol = await rolService.deleteOneRol(idRol);
            res.send({ status: "OK", data:`Deleted roles with description: ${rol}`   });
        } catch (error) {
            res.status(error?.status || 500).send({ status: "FAILED", data: { error: error?.message || error } });
        }
};

module.exports = {
  getAllRols,
  getOneRol,
  createNewRol,
  updateOneRol,
  deleteOneRol,
};
