const {DataTypes }= require ("sequelize");
const {sequelize }= require("../database/sequelize.database"); 
const {Rol} = require("./rol");


 const Usuario = sequelize.define('Usuario',{
    idUsuario:{
        type: DataTypes.INTEGER,
        primaryKey:true,
        autoIncrement:true
    },
    nombre: {
        type: DataTypes.STRING,
        require:true
    },
    email:{
        type: DataTypes.STRING,
        
    },
    password:{
        type: DataTypes.STRING,
        require:true
    },  
    esActivo: {
        type: DataTypes.BOOLEAN,
        defaultValue: true,
        require: true
      },
    fechaRegistro: {
        type: DataTypes.STRING,
        require: true
      }
},{
    timestamps:false,
});

Usuario.belongsTo(Rol, { foreignKey: "idRol" });

module.exports = {Usuario};
