const {DataTypes }= require ("sequelize");
const {sequelize }= require("../database/sequelize.database"); 

const Venta = sequelize.define('Venta', {
  idVenta: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  numeroDocumento: {
    type: DataTypes.STRING,
    allowNull: false,
    require: true
  },
  documentoCliente: {
    type: DataTypes.STRING,
    allowNull: false,
    require: true
  },
  nombreCliente: {
    type: DataTypes.STRING,
    allowNull: false,
    require: true
  },
  tipoPago: {
    type: DataTypes.STRING,
    allowNull: false,
    require: true
  },
  total: {
    type: DataTypes.FLOAT,
    allowNull: false,
  },
  fechaRegistro: {
    type: DataTypes.STRING,
    require: true
  }
}, {
  timestamps: false // Desactiva la generación automática de los campos createdAt y updatedAt
});

module.exports = { Venta};


