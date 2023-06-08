// In src/v1/routes/workoutRoutes.js
//const middleware= require("../../middlewares/index");
const express = require("express");
const categoriaController = require("../../controllers/categoriaController");
const router = express.Router();



//#region get
/**
 * @openapi
 * /api/v1/categorias:
 *   get:
 *     tags:
 *       - Categorias
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
 *                     $ref: "#/components/schemas/Categoria"
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
router.get("/", categoriaController.getAllCategorias);

//#endregion

//#region  getOneCategoria
/**
 * @openapi
 * /api/v1/categorias/{idCategoria}:
 *   get:
 *     tags:
 *       - Categorias
 *     parameters:
 *       - in: path
 *         name: idCategoria
 *         schema:
 *           type: string
 *         description: The Id of the Categoria you want to get.
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
 *                     $ref: "#/components/schemas/Categoria"
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
router.get("/:idCategoria", categoriaController.getOneCategoria);

//#endregion

//#region  Post
/**
 * @openapi
 * /api/v1/categorias:
 *   post:
 *     tags:
 *       - Categorias
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
 *             $ref: "#/components/schemas/Categoria Entrante"
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
 *                   $ref: "#/components/schemas/Categoria"
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
router.post("/", categoriaController.createNewCategoria);

//#endregion

//#region Patch
/**
 * @openapi
 * /api/v1/categorias/{idCategoria}:
 *   patch:
 *     tags:
 *       - Categorias
 *     parameters:
 *       - in: header
 *         name: token
 *         schema:
 *           type: string
 *         description: Token de autorización JWT
 *         required: true
 *       - in: path
 *         name: idCategoria
 *         schema:
 *           type: integer
 *         description: ID del Categoria a modificar
 *         required: true
 *     requestBody:
 *       content:
 *         application/json:
 *           schema:
 *             $ref: "#/components/schemas/Categoria Entrante"
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
 *                   $ref: "#/components/schemas/Categoria"
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
 *                       example: "Categoriae not found"
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
router.patch("/:idCategoria", categoriaController.updateOneCategoria);

//#endregion

//#region Delete
/**
 * @openapi
 * /api/v1/categorias/{idCategoria}:
 *   delete:
 *     tags:
 *       - Categorias
 *     parameters:
 *       - in: path
 *         name: idCategoria
 *         schema:
 *           type: string
 *         description: The ID of the Categoria you want to delete.
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
 *                       example: "Categoria removed from the database successfully"
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
router.delete("/:idCategoria",categoriaController.deleteOneCategoria );

//#endregion

module.exports = router;
