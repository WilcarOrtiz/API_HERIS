const {Rol}  = require("../models/rol")

const getAllRols = async () => {
    try {
        const Rols = await Rol.findAll();
        return Rols ;
       } catch (error) {
         throw { status: 500, message: error?.message || error };
       }
};

const getOneRol = async (idRol) => {
    try {
        const GRol = await Rol.findOne({where:{idRol}})
        if (!GRol) {
          throw {
            status: 400,
            message: `Can't find rol with the id ${idRol}`,
          };
        }
        return GRol; 
      } catch (error) {
        throw { status: error?.status || 500, message: error?.message || error };
      }
};

const createNewRol = async (rol) => {
    try {
        const { descripcion, esActivo, fechaRegistro } = rol;
        const newRol = await Rol.create({descripcion, esActivo, fechaRegistro });
        return newRol;
      } catch (error) {
        throw { status: 500, message: error?.message || error };
      }
};

const updateOneRol = async (idRol,rol) => {
    try {
        const URol = await Rol.findOne({ where: { idRol} });
        if (!URol) {
           throw {
            status: 404,
            message: `Rol with id '${idRol}' not found`,
          };
        }

        URol.descripcion = rol.descripcion;
        URol.esActivo=rol.esActivo; 
        URol.fechaRegistro = rol.fechaRegistro; 
        
        await URol.save();
        return URol;
      } catch (error) {
        throw { status: error?.status || 500, message: error?.message || error };
      }
};

const deleteOneRol = async (idRol) => {
  try {
    const URol = await Rol.findOne({ where: { idRol} });
    if (!URol) {
       throw {
        status: 404,
        message: `Rol with id '${idRol}' not found`,
      };
    }

    URol.descripcion;
    URol.esActivo=false; 
    URol.fechaRegistro; 
    
    await URol.save();
    return URol.descripcion;
  } catch (error) {
    throw { status: error?.status || 500, message: error?.message || error };
  }
};

module.exports = {
  getAllRols,
  getOneRol,
  createNewRol,
  updateOneRol,
  deleteOneRol,
};
