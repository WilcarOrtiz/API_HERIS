const {Usuario} = require("../models/usuario"); 
const {Rol} = require("../models/rol");
const encryptador = require("bcryptjs"); 
const jwt = require("jsonwebtoken");
const dotenv = require("dotenv");
dotenv.config();


const getAllUsuarios = async () => {
  try {
    const Usuarios = await Usuario.findAll();
    return Usuarios ;
   } catch (error) {
     throw { status: 500, message: error?.message || error };
   }
};

const getOneUsuario = async (idUsuario) => {
  try {
    const GUsuario= await Usuario.findOne({where:{idUsuario}})
    if (!GUsuario) {
      throw {
        status: 400,
        message: `Can't find user with the id ${idUsuario}`,
      };
    }
    return GUsuario; 
  } catch (error) {
    throw { status: error?.status || 500, message: error?.message || error };
  }
};

const signin = async (newUser) => {
  console.log("entro al signin:",newUser);
  try {
    const {email, password}= newUser;
 
    //para cargar los datos relacionados del modelo Role para el usuario encontrado.
    const UserFound = await Usuario.findOne({ where: { email },include: Rol });

    if (!UserFound  ) {throw {status: 400,message: ` user with email ('${email}') not found`,};} 
    const macthPassword = await encryptador.compare(password, UserFound.password);
    if (!macthPassword ) {throw {status: 401,message: ` passwaord '${password}' not found`,};}

    const token = jwt.sign({email:email},process.env.JWTSRECRET,{expiresIn: 86000});
    return {token, UserFound };

  } catch (error) {
    throw { status: 500, message: error?.message || error };
  }
};


const createNewUsuario = async (newUser) => {
  let id=0;
    try {
      const {email,password,nombre,esActivo,rol,fechaRegistro}= newUser;
      let password2 = encryptador.hashSync(password,10); 
      if (rol) {
        const foundRol  = await Rol.findOne({ where: { descripcion: rol } });
        id=foundRol.idRol
      } else {
        const foundRol = await Rol.findOne({ where: { descripcion: "user" } });
        id=foundRol.idRol
      }

      const SnewUser = await Usuario.create({
        email:email,
        password: password2,
        nombre:nombre,
        esActivo:esActivo,
        fechaRegistro:fechaRegistro,
        idRol: id
      });
      return SnewUser;
    } catch (error) {
      throw { status: 500, message: error?.message || error };
    }
};

const updateOneUsuario = async (idUsuario,User) => {
  let id=0;
  try {
    const UUsuario = await Usuario.findOne({ where: { idUsuario} });
    if (!UUsuario) {
       throw {
        status: 404,
        message: `User with id '${idUsuario}' not found`,
      };
    }

    let password2 = encryptador.hashSync(User.password,10); 
    UUsuario.email = User.email;
    UUsuario.password = password2;
    UUsuario.nombre = User.nombre;
    UUsuario.esActivo= User.esActivo; 
    UUsuario.fechaRegistro = User.fechaRegistro; 

    if (User.rol) {
      const foundRol  = await Rol.findOne({ where: { descripcion: User.rol} });
      id=foundRol.idRol
    } else {
      const foundRol = await Rol.findOne({ where: { descripcion: "user" } });
      id=foundRol.idRol
    }
    UUsuario.idRol=id; 
    await UUsuario.save();
    return UUsuario;
  } catch (error) {
    throw { status: error?.status || 500, message: error?.message || error };
  }
};

const deleteOneUsuario = async (idUsuario) => {
  try {
    const UUsuario = await Usuario.findOne({ where: { idUsuario} });
    if (!UUsuario) {
       throw {
        status: 404,
        message: `User with id '${idUsuario}' not found`,
      };
    }

    UUsuario.password;
    UUsuario.email;
    UUsuario.password; 
    UUsuario.nombre;
    UUsuario.esActivo= false;
    UUsuario.fechaRegistro; 
    UUsuario.idRol; 

    await UUsuario.save();
    return UUsuario.email;
  } catch (error) {
    throw { status: error?.status || 500, message: error?.message || error };
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
