const {DataTypes }= require ("sequelize");
const {sequelize }= require("../database/sequelize.database"); 
const {Rol} = require("./rol");
const {Menu} = require("./menu");

const MenuRol = sequelize.define('MenuRol', {
  idMenuRol: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
}, {
  timestamps: false // Desactiva la generación automática de los campos createdAt y updatedAt
});

MenuRol.belongsTo(Menu, { foreignKey: "idMenu" });
MenuRol.belongsTo(Rol, { foreignKey: "idRol" });

module.exports = { MenuRol};