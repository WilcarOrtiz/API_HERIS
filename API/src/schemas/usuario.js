
/**
 * @openapi
 * components:
 *   schemas:
 *     Usuario:
 *       type: object
 *       properties:
 *         idUsuario:
 *           type: integer
 *           example: 1
 *         nombre:
 *           type: string
 *           example: John Doe
 *         email:
 *           type: string
 *           example: johndoe@example.com
 *         password:
 *           type: string
 *           example: password123
 *         esActivo:
 *           type: boolean
 *           example: true
 *         fechaRegistro:
 *           type: string
 *           example: 2023-06-06
 *         idRol:
 *           type: integer
 *           example: 1
 */


/**
 * @openapi
 * components:
 *   schemas:
 *     Usuario Entrante:
 *       type: object
 *       properties:
 *         nombre:
 *           type: string
 *           example: John Doe
 *           required: true
 *         email:
 *           type: string
 *           example: johndoe@example.com
 *           required: true
 *         password:
 *           type: string
 *           example: password123
 *           required: true
 *         esActivo:
 *           type: boolean
 *           example: true
 *           required: true
 *         fechaRegistro:
 *           type: string
 *           example: 2023-06-06
 *           required: true
 *         Rol:
 *           type: string
 *           example: user
 *           required: true
 */