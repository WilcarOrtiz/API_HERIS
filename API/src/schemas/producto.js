/**
 * @openapi
 * components:
 *   schemas:
 *     Producto:
 *       type: object
 *       properties:
 *         idProducto:
 *           type: integer
 *           example: 1
 *         nombre:
 *           type: string
 *           example: Iphone xs
 *         descripcion:
 *           type: string
 *           example: Product description
 *         stock:
 *           type: integer
 *           example: 10
 *         precio:
 *           type: float
 *           example: 1000000
 *         esActivo:
 *           type: boolean
 *           example: true
 *         idCategoria:
 *           type: integer
 *           example: 1
 *         fechaRegistro:
 *           type: string
 *           format: date
 *           example: '2023-05-14'
 */



/**
 * @openapi
 * components:
 *   schemas:
 *     Producto Entrante:
 *       type: object
 *       properties:
 *         nombre:
 *           type: string
 *           example: Iphone xs
 *         descripcion:
 *           type: string
 *           example: Product description
 *         stock:
 *           type: integer
 *           example: 10
 *         precio:
 *           type: float
 *           example: 1000000
 *         esActivo:
 *           type: boolean
 *           example: true
 *         Categoria:
 *           type: string
 *           example: Celulares
 *         fechaRegistro:
 *           type: string
 *           format: date
 *           example: '2023-05-14'
 */
