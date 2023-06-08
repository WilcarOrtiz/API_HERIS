const {DataTypes }= require ("sequelize");
const {sequelize }= require("../database/sequelize.database"); 

const Menu = sequelize.define('Menu', {
  idMenu: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  nombre: {
    type: DataTypes.STRING,
    allowNull: false,
    require: true
  },
  icono: {
    type: DataTypes.STRING,
    allowNull: false,
    require: true
  },
  url: {
    type: DataTypes.STRING,
    allowNull: false,
    require: true
  },
}, {
  timestamps: false // Desactiva la generación automática de los campos createdAt y updatedAt
});

module.exports = { Menu};