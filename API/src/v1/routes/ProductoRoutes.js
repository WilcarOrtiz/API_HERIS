// In src/v1/routes/workoutRoutes.js
//const middleware= require("../../middlewares/index");
const express = require("express");
const productoController = require("../../controllers/productoController");
const router = express.Router();



//#region get

/**
 * @openapi
 * /api/v1/productos:
 *   get:
 *     tags:
 *       - Productos
 *     responses:
 *       200:
 *         description: OK
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 status:
 *                   type: string
 *                   example: OK
 *                 data:
 *                   type: array
 *                   items:
 *                     $ref: "#/components/schemas/Producto"
 *       5XX:
 *         description: FAILED
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 status:
 *                   type: string
 *                   example: FAILED
 *                 data:
 *                   type: object
 *                   properties:
 *                     error:
 *                       type: string
 *                       example: "Some error message"
 */
router.get("/", productoController.getAllProductos);

//#endregion

//#region  getOneProducto


router.get("/:idProducto", productoController.getOneProducto);

//#endregion

//#region  Post

/**
 * @openapi
 * /api/v1/productos:
 *   post:
 *     tags:
 *       - Productos
 *     parameters:
 *       - in: header
 *         name: token
 *         schema:
 *           type: string
 *         description: Token de autorización JWT
 *         required: true
 *     requestBody:
 *       content:
 *         application/json:
 *           schema:
 *             $ref: "#/components/schemas/Producto Entrante"
 *     responses:
 *       201:
 *         description: Created
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 status:
 *                   type: string
 *                   example: Created
 *                 data:
 *                   $ref: "#/components/schemas/Producto"
 *       5XX:
 *         description: FAILED
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 status:
 *                   type: string
 *                   example: FAILED
 *                 data:
 *                   type: object
 *                   properties:
 *                     error:
 *                       type: string
 *                       example: "Some error message"
 */
router.post("/", productoController.createNewProducto);

//#endregion

//#region Patch
/**
 * @openapi
 * /api/v1/productos/{idProducto}:
 *   patch:
 *     tags:
 *       - Productos
 *     parameters:
 *       - in: header
 *         name: token
 *         schema:
 *           type: string
 *         description: Token de autorización JWT
 *         required: true
 *       - in: path
 *         name: idProducto
 *         schema:
 *           type: integer
 *         description: ID del producto a modificar
 *         required: true
 *     requestBody:
 *       content:
 *         application/json:
 *           schema:
 *             $ref: "#/components/schemas/Producto Entrante"
 *     responses:
 *       200:
 *         description: OK
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 status:
 *                   type: string
 *                   example: Updated
 *                 data:
 *                   $ref: "#/components/schemas/Producto"
 *       404:
 *         description: Not Found
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 status:
 *                   type: string
 *                   example: Not Found
 *                 data:
 *                   type: object
 *                   properties:
 *                     error:
 *                       type: string
 *                       example: "Product not found"
 *       5XX:
 *         description: FAILED
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 status:
 *                   type: string
 *                   example: FAILED
 *                 data:
 *                   type: object
 *                   properties:
 *                     error:
 *                       type: string
 *                       example: "Some error message"
 */
router.patch("/:idProducto", productoController.updateOneProducto);

//#endregion

//#region Delete
/**
 * @openapi
 * /api/v1/productos/{idProducto}:
 *   delete:
 *     tags:
 *       - Productos
 *     parameters:
 *       - in: path
 *         name: idProducto
 *         schema:
 *           type: string
 *         description: The ID of the product you want to delete.
 *         required: true
 *       - in: header
 *         name: token
 *         schema:
 *           type: string
 *         description: Token de autorización JWT
 *         required: true
 *     responses:
 *       200:
 *         description: OK
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 status:
 *                   type: string
 *                   example: OK
 *                 data:
 *                   type: object
 *                   properties:
 *                     message:
 *                       type: string
 *                       example: "Product removed from the database successfully"
 *       5XX:
 *         description: FAILED
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 status:
 *                   type: string
 *                   example: FAILED
 *                 data:
 *                   type: object
 *                   properties:
 *                     error:
 *                       type: string
 *                       example: "Some error message"
 */
router.delete("/:idProducto",productoController.deleteOneProducto);

//#endregion

module.exports = router;
