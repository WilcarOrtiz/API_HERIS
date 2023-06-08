
const express = require("express");
const bodyParser = require("body-parser");


//#region Ruta
const v1RolRouter = require("./v1/routes/RolRoutes"); 
const v1UsuarioRouter = require("./v1/routes/UsuarioRoutes"); 
const v1CategoriaRouter = require("./v1/routes/CategoriaRoutes"); 
const v1ProductoRouter = require("./v1/routes/ProductoRoutes"); 
const v1VentaRouter = require("./v1/routes/VentaRoutes"); 
const v1DashBoardRouter = require("./v1/routes/DashBoardRoutes");
const v1DetallVentaRouter = require("./v1/routes/DetallesVentaRoutes");
const v1MenuRouter = require("./v1/routes/MenuRoutes");

//#endregion


const { swaggerDocs: V1SwaggerDocs } = require("./v1/swagger");
const {sequelize} = require("./database/sequelize.database");
const cors = require("cors");


async function main() {
  try {
    const app = express();
    const PORT = process.env.PORT || 3000;
    app.use(cors());
    app.use(bodyParser.json());
    
    //AQUI PONES {force:true} PA CAMBIAR LA ESTRUCTURA DE LA BASE (los datos se pierden)
    await sequelize.sync({alter:true});
  
    app.use("/api/v1/rols", v1RolRouter);
    app.use("/api/v1/usuarios", v1UsuarioRouter);
    app.use("/api/v1/categorias", v1CategoriaRouter);
    app.use("/api/v1/productos", v1ProductoRouter);
    app.use("/api/v1/ventas", v1VentaRouter);
    app.use("/api/v1/dashboard",v1DashBoardRouter);
    app.use("/api/v1/detalleventas", v1DetallVentaRouter);
    app.use("/api/v1/menu", v1MenuRouter);
   
   

    app.listen(PORT, () => {
      console.log(`API is listening on port ${PORT}`);
      V1SwaggerDocs(app, PORT);
    });  
  } catch (error) {
      console.error(`hubo un error ${error}`);
  }
}

main();