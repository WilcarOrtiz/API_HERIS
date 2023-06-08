/**
 * @openapi
 * components:
 *   schemas:
 *     Rol:
 *       type: object
 *       properties:
 *         idRol:
 *           type: integer
 *           example: 1
 *         descripcion:
 *           type: string
 *           example: Admin
 *         esActivo:
 *           type: boolean
 *           example: true
 *         Fecha:
 *           type: string
 *           example: 14/05/2023
 */


/**
 * @openapi
 * components:
 *   schemas:
 *     Rol Entrante:
 *       type: object
 *       properties:
 *         descripcion:
 *           type: string
 *           example: Admin
 *           required: true
 *         esActivo:
 *           type: boolean
 *           example: true
 *           required: true
 *         fechaRegistro:
 *           type: string
 *           example: 14/05/2023
 *           required: true
 */
