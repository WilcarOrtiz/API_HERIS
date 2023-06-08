const swaggerJSDoc = require("swagger-jsdoc");
const swaggerUi = require("swagger-ui-express");


const options = {
  definition: {
    openapi: "3.0.0",
    info: { title: "HERIS API", version: "1.0.0" },
  },
apis: [
  "./src/v1/routes/rolRoutes.js","./src/schemas/rol.js",
  "./src/v1/routes/usuarioRoutes.js","./src/schemas/usuario.js",
  "./src/v1/routes/categoriaRoutes.js","./src/schemas/categoria.js",
  "./src/v1/routes/productoRoutes.js","./src/schemas/producto.js",
  "./src/v1/routes/ventaRoutes.js","./src/schemas/venta.js",
  "./src/v1/routes/dashBoardRoutes.js","./src/schemas/dashboard.js",
  "./src/v1/routes/DetallesVentaRoutes.js","./src/schemas/detalleventa.js",
  "./src/v1/routes/menuRoutes.js","./src/schemas/menu.js"
],


};


// Docs in JSON format
const swaggerSpec = swaggerJSDoc(options);

// Function to setup our docs
const swaggerDocs = (app, port) => {
  // Route-Handler to visit our docs
  app.use("/api/v1/docs", swaggerUi.serve, swaggerUi.setup(swaggerSpec));
  // Make our docs in JSON format available
  app.get("/api/v1/docs.json", (req, res) => {
    res.setHeader("Content-Type", "application/json");
    res.send(swaggerSpec);
  });
  console.log(`Version 1 Docs are available on http://localhost:${port}/api/v1/docs`);
};

module.exports = { swaggerDocs };
