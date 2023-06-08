const {DataTypes }= require ("sequelize");
const {sequelize }= require("../database/sequelize.database"); 

const Categoria = sequelize.define('Categoria', {
  idCategoria: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  descripcion: {
    type: DataTypes.STRING,
    allowNull: false,
    require: true
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
}, {
  timestamps: false // Desactiva la generación automática de los campos createdAt y updatedAt
});

module.exports = { Categoria};