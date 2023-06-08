// In src/v1/routes/workoutRoutes.js
//const middleware= require("../../middlewares/index");
const express = require("express");
const rolController = require("../../controllers/rolController");
const router = express.Router();



//#region get

 
/**
 * @openapi
 * /api/v1/rols:
 *   get:
 *     tags:
 *       - Rols
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
 *                     $ref: "#/components/schemas/Rol"
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
router.get("/", rolController.getAllRols);

//#endregion

//#region  getOneRol

/**
 * @openapi
 * /api/v1/rols/{idRol}:
 *   get:
 *     tags:
 *       - Rols
 *     parameters:
 *       - in: path
 *         name: idRol
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
 *                     $ref: "#/components/schemas/Rol"
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
router.get("/:idRol", rolController.getOneRol);

//#endregion

//#region  Post

/**
 * @openapi
 * /api/v1/rols:
 *   post:
 *     tags:
 *       - Rols
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
 *             $ref: "#/components/schemas/Rol Entrante"
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
 *                   $ref: "#/components/schemas/Rol"
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
router.post("/", rolController.createNewRol);

//#endregion

//#region Patch
/**
 * @openapi
 * /api/v1/rols/{idRol}:
 *   patch:
 *     tags:
 *       - Rols
 *     parameters:
 *       - in: header
 *         name: token
 *         schema:
 *           type: string
 *         description: Token de autorización JWT
 *         required: true
 *       - in: path
 *         name: idRol
 *         schema:
 *           type: integer
 *         description: ID del rol a modificar
 *         required: true
 *     requestBody:
 *       content:
 *         application/json:
 *           schema:
 *             $ref: "#/components/schemas/Rol Entrante"
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
 *                   $ref: "#/components/schemas/Rol"
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
 *                       example: "Role not found"
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
router.patch("/:idRol", rolController.updateOneRol);

//#endregion

//#region Delete
/**
 * @openapi
 * /api/v1/rols/{idRol}:
 *   delete:
 *     tags:
 *       - Rols
 *     parameters:
 *       - in: path
 *         name: idRol
 *         schema:
 *           type: string
 *         description: The ID of the rol you want to delete.
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
 *                       example: "rol removed from the database successfully"
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
router.delete("/:idRol",rolController.deleteOneRol );

//#endregion

module.exports = router;
