
const middleware= require("../../middlewares/index");
const express = require("express");
const UsuarioController = require("../../controllers/usuarioController");
const router = express.Router();

//#region get

/**
 * @openapi
 * /api/v1/usuarios:
 *   get:
 *     tags:
 *       - Usuarios
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
 *                     $ref: "#/components/schemas/Usuario"
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
router.get("/", UsuarioController.getAllUsuarios);

//#endregion

//#region  getOneUsuario
/**
 * @openapi
 * /api/v1/usuarios/{idUsuario}:
 *   get:
 *     tags:
 *       - Usuarios
 *     parameters:
 *       - in: path
 *         name: idUsuario
 *         schema:
 *           type: string
 *         description: The Id of the user you want to get.
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
 *                     $ref: "#/components/schemas/Usuario"
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
router.get("/:idUsuario", UsuarioController.getOneUsuario);

//#endregion

//#region  Post
/**
 * @openapi
 * /api/v1/usuarios:
 *   post:
 *     tags:
 *       - Usuarios
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
 *             $ref: "#/components/schemas/Usuario Entrante"
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
 *                   $ref: "#/components/schemas/Usuario"
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
router.post("/",[middleware.verifyToken,middleware.verifySignup], UsuarioController.createNewUsuario);

//#endregion

//#region Patch

/**
 * @openapi
 * /api/v1/usuarios/{idUsuario}:
 *   patch:
 *     tags:
 *       - Usuarios
 *     parameters:
 *       - in: header
 *         name: token
 *         schema:
 *           type: string
 *         description: Token de autorización JWT
 *         required: true
 *       - in: path
 *         name: idUsuario
 *         schema:
 *           type: integer
 *         description: ID del user a modificar
 *         required: true
 *     requestBody:
 *       content:
 *         application/json:
 *           schema:
 *             $ref: "#/components/schemas/Usuario Entrante"
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
 *                   $ref: "#/components/schemas/Usuario"
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
 *                       example: "User not found"
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
router.patch("/:idUsuario", UsuarioController.updateOneUsuario);

//#endregion

//#region Delete
/**
 * @openapi
 * /api/v1/usuarios/{idUsuario}:
 *   delete:
 *     tags:
 *       - Usuarios
 *     parameters:
 *       - in: path
 *         name: idUsuario
 *         schema:
 *           type: string
 *         description: The ID of the user you want to delete.
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
 *                       example: "User removed from the database successfully"
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
router.delete("/:idUsuario",UsuarioController.deleteOneUsuario );

//#endregion

//#region  Signin
/**
 * @openapi
 * /api/v1/usuarios/signin:
 *   post:
 *     tags:
 *       - Usuarios
 *     requestBody:
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               email:
 *                 type: string
 *                 example: wilar@
 *               password:
 *                 type: string
 *                 example: Daniel
 *           required:
 *             - email
 *             - password
 *     responses:
 *       201:
 *         description: Ok
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 token:
 *                   type: string
 *                   example: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6IndpbGFyQGV4YW1wbGUuY29tIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c
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
router.post("/signin", UsuarioController.signin);

//#endregion
module.exports = router;
