
//const middleware= require("../../middlewares/index");
const express = require("express");
const router = express.Router();
const detalleVentaController = require("../../controllers/detallesVentaController");


/**
 * @openapi
 * /api/v1/detalleventas/{idVenta}:
 *   get:
 *     tags:
 *       - Detalles Venta
 *     parameters:
 *       - in: path
 *         name: idVenta
 *         schema:
 *           type: string
 *         description: The Id of the sale you want to get.
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
 *                     $ref: "#/components/schemas/DetalleVenta"
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

router.get("/:idVenta", detalleVentaController.getdetalleVenta);

module.exports = router;
