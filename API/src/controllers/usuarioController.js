const usuarioService = require("../services/usuarioService");


const getAllUsuarios = async (req, res) => {
  try {
    const allUsuario = await usuarioService.getAllUsuarios(); 
    res.status(200).send({ status: "OK", data:  allUsuario});
  } catch (error) {
    res.status(error?.status || 500).send({ status: "FAILED", data: { error: error?.message || error } });
  }
};

const getOneUsuario = async (req, res) => {
  const { params: { idUsuario },} = req;
  if (!idUsuario) {
      res.status(400).send({
           status: "FAILED", 
           data: { error: "Parameter ':idUsuario' can not be empty" },
          });
      }

      try {
          const usuario = await usuarioService.getOneUsuario(idUsuario);
          res.send({ status: "OK", data: usuario  });
      } catch (error) {
          res.status(error?.status || 500).send({ status: "FAILED", data: { error: error?.message || error } });
      }
};

const createNewUsuario = async (req, res) => {
  const { body } = req;
  if (!body.nombre || !body.email  || !body.password|| !body.esActivo  || !body.fechaRegistro) {
    res.status(400).send({
      status: "FAILED",data: {error: "The following keys is missing or is empty in request body",},
    });
    return;
  }

  try {
    const newUser = {email: body.email,password: body.password,nombre:body.nombre,esActivo:body.esActivo, rol:body.Rol,fechaRegistro:body.fechaRegistro};
    const createdUser = await usuarioService.createNewUsuario(newUser);
    res.status(201).send({ status: "OK", data: createdUser });
  } catch (error) {
    res.status(error?.status || 500).send({ status: "FAILED", data: { error: error?.message || error } });
  }
};

const updateOneUsuario = async (req, res) => {
  const { body, params: { idUsuario },} = req;
  if (!body.nombre || !body.email  || !body.password|| !body.esActivo  || !body.fechaRegistro) {
    res.status(400).send({
      status: "FAILED",data: {error: "The following keys is missing or is empty in request body",},
    });
    return;
  }

  try {
    const User = {email: body.email,password: body.password,nombre:body.nombre,esActivo:body.esActivo, rol:body.Rol,fechaRegistro:body.fechaRegistro};
    const createdUser = await usuarioService.updateOneUsuario(idUsuario,User);
    res.status(201).send({ status: "OK", data: createdUser });
  } catch (error) {
    res.status(error?.status || 500).send({ status: "FAILED", data: { error: error?.message || error } });
  }
};

const deleteOneUsuario = async (req, res) => {
  const { params: { idUsuario },} = req;
    if (!idUsuario ) {
        res.status(400).send({
             status: "FAILED", 
             data: { error: "Parameter ':idUsuario ' can not be empty" },
            });
        }
        try {
            const dUsuario = await usuarioService.deleteOneUsuario(idUsuario );
            res.send({ status: "OK", data:`Deleted user with email : ${ dUsuario}`   });
        } catch (error) {
            res.status(error?.status || 500).send({ status: "FAILED", data: { error: error?.message || error } });
        }
};


const signin = async (req, res) => {
  const { body } = req;
  if (!body.email || !body.password) {
    res.status(400).send({
      status: "FAILED",data: {error: "The following keys is missing or is empty in request body",},
    });
    return;
  }
  try {
    const newUser = {email: body.email,password: body.password,};
    const User = await usuarioService.signin(newUser);
    res.status(201).send({ status: "OK", data: User });
  } catch (error) {
    res.status(error?.status || 500).send({ status: "FAILED", data: { error: error?.message || error } });
  }
  };

module.exports = {
  getAllUsuarios,
  getOneUsuario,
  createNewUsuario,
  updateOneUsuario,
  deleteOneUsuario,
  signin
};
