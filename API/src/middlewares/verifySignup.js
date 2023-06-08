const {Rol} = require("../models/rol");

const verifySignup= async(req,res,next)=>{
    const {body}= req; 
    if(body.Rol){
         const foundRol = await Rol.findOne({ where: { descripcion:body.Rol } });
         if (!foundRol) {
            return res.status(400).json({message:`Rol ${body.Rol} does not exists`});
         }
    };
    next(); 
};

module.exports = { verifySignup};