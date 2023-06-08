// In src/v1/routes/workoutRoutes.js
//const middleware= require("../../middlewares/index");
const express = require("express");
const VentaController = require("../../controllers/ventaController");
const router = express.Router();

//#region get

/**
 * @openapi
 * /api/v1/ventas:
 *   get:
 *     tags:
 *       - Ventas
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
 *                     $ref: "#/components/schemas/Venta"
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
router.get("/", VentaController.getAllVentas);

//#endregion

//#region  getOneVenta

/**
 * @openapi
 * /api/v1/ventas/{idVenta}:
 *   get:
 *     tags:
 *       - Ventas
 *     parameters:
 *       - in: path
 *         name: idVenta
 *         schema:
 *           type: string
 *         description: The Id of the rol you want to get.
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
 *                     $ref: "#/components/schemas/Venta"
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
router.get("/:idVenta", VentaController.getOneVenta);

//#endregion

//#region  Post
/**
 * @openapi
 * /api/v1/ventas:
 *   post:
 *     tags:
 *       - Ventas
 *     requestBody:
 *       content:
 *         application/json:
 *           schema:
 *             $ref: "#/components/schemas/Venta Entrante"
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
 *                   $ref: "#/components/schemas/Venta Entrante"
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
 *                       example: Some error message
 */

router.post("/", VentaController.createNewVenta);

//#endregion




module.exports = router;
