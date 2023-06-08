const {DataTypes }= require ("sequelize");
const {sequelize }= require("../database/sequelize.database"); 
const { Venta } = require("./venta");
const { Producto } = require("./producto");

const DetalleVenta = sequelize.define('DetalleVenta', {
    idDetalleVenta: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    producto: {
        type: DataTypes.STRING,
        allowNull: false,
      },
    cantidad: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    precio: {
        type: DataTypes.FLOAT,
        allowNull: false,
    },
    total: {
        type: DataTypes.FLOAT,
        allowNull: false,
    }
  }, {
    timestamps: false
  });
  
  DetalleVenta.belongsTo(Venta, { foreignKey: "idVenta" });
  DetalleVenta.belongsTo(Producto, { foreignKey: "idProducto" });


  module.exports = {DetalleVenta};

