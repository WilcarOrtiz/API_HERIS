/**
 * @openapi
 * components:
 *   schemas:
 *     DetalleVenta:
 *       type: object
 *       properties:
 *         idDetalleVenta:
 *           type: integer
 *           example: 1
 *         idVenta:
 *           type: integer
 *           example: 1
 *         idProducto:
 *           type: integer
 *           example: 1
 *         producto:
 *           type: string
 *           example: Nombre producto
 *         cantidad:
 *           type: integer
 *           example: 5
 *         precio:
 *           type: number
 *           format: float
 *           example: 10.99
 *         total:
 *           type: number
 *           format: float
 *           example: 54.95
 */


/**
 * @openapi
 * components:
 *   schemas:
 *     DetalleVenta Entrante:
 *       type: object
 *       properties:
 *         producto:
 *           type: string
 *           example: Nombre producto
 *         cantidad:
 *           type: integer
 *           example: 5
 *         precio:
 *           type: number
 *           format: float
 *           example: 10.99
 *         total:
 *           type: number
 *           format: float
 *           example: 54.95
 */