const {Categoria}  = require("../models/categoria")

const getAllCategorias = async () => {
    try {
        const Categorias = await Categoria.findAll();
        return Categorias ;
       } catch (error) {
         throw { status: 500, message: error?.message || error };
    }
};

const getOneCategoria = async (idCategoria) => {
    try {
        const GCategoria = await Categoria.findOne({where:{idCategoria}})
        if (!GCategoria) {
          throw {
            status: 400,
            message: `Can't find Categoria with the id ${idCategoria}`,
          };
        }
        return GCategoria; 
      } catch (error) {
        throw { status: error?.status || 500, message: error?.message || error };
      }
};

const createNewCategoria = async (newCategoria) => {
    try {
        const { descripcion, esActivo, fechaRegistro } = newCategoria;
        const nCategoria = await Categoria.create({descripcion, esActivo, fechaRegistro });
        return nCategoria;
      } catch (error) {
        throw { status: 500, message: error?.message || error };
      }
};

const updateOneCategoria = async (idCategoria,newCategoria) => {
    try {
        const UCategoria = await Categoria.findOne({ where: { idCategoria} });
        if (!UCategoria) {
           throw {
            status: 404,
            message: `Categoria with id '${idCategoria}' not found`,
          };
        }

        UCategoria.descripcion = newCategoria.descripcion;
        UCategoria.esActivo= newCategoria.esActivo; 
        UCategoria.fechaRegistro = newCategoria.fechaRegistro; 
        
        await UCategoria.save();
        return UCategoria;
      } catch (error) {
        throw { status: error?.status || 500, message: error?.message || error };
      }
};

const deleteOneCategoria = async (idCategoria) => {
  try {
    const UCategoria = await Categoria.findOne({ where: { idCategoria} });
    if (!UCategoria) {
       throw {
        status: 404,
        message: `Categoria with id '${idCategoria}' not found`,
      };
    }

    UCategoria.descripcion;
    UCategoria.esActivo=false; 
    UCategoria.fechaRegistro; 
    
    await UCategoria.save();
    return UCategoria.descripcion;
  } catch (error) {
    throw { status: error?.status || 500, message: error?.message || error };
  }
};

module.exports = {
  getAllCategorias,
  getOneCategoria,
  createNewCategoria,
  updateOneCategoria,
  deleteOneCategoria,
};
