
const {DataTypes }= require ("sequelize");
const {sequelize }= require("../database/sequelize.database"); 
const {Categoria} = require("./categoria");

const Producto = sequelize.define('Producto', {
    idProducto: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    nombre: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    descripcion: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    stock: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    precio: {
      type: DataTypes.FLOAT,
      allowNull: false,
    },
    esActivo: {
        type: DataTypes.BOOLEAN,
        defaultValue: true,
        require: true
      },
    fechaRegistro: {
        type: DataTypes.STRING,
        require: true
      },
  }, {
    timestamps: false,
  });


  Producto.belongsTo(Categoria, { foreignKey: "idCategoria" });

  module.exports = {Producto};
