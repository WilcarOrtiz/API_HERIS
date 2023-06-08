const jwt = require("jsonwebtoken");
const {Usuario} = require("../models/usuario"); 
const {Rol} = require("../models/rol");

const dotenv = require("dotenv");
dotenv.config();

const verifyToken= async(req,res,next)=>{
   try {
    const token= req.headers["token"];
    if (!token) {
        return res.status(403).json({message:"No token provided",});
    }
    const user = jwt.verify(token,process.env.JWTSRECRET);
    req.email=user.email; 
    if (!user) { res.status(401).json({message:"No user found",});  }
    next();
   } catch (error) {
    res.status(401).json({message:"NO autorizado.."});
   }
};



const isAdmin =async (req,res,next)=>{
    const UserFound = await Usuario.findOne({ where: {  email: req.email } });
    const RolFound = await Rol.findOne({where:{ idRol:UserFound.idRol }});
    if (RolFound.descripcion === "admin") {
            next();
            return;
    }

    res.status(403).json({message:"Requires administrator permissions.."});
}; 

const isUser = async (req,res,next)=>{

};

module.exports = { verifyToken,isAdmin,isUser};