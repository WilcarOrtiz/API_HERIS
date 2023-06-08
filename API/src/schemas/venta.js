
/**
 * @openapi
 * components:
 *   schemas:
 *     Venta:
 *       type: object
 *       properties:
 *         idVenta:
 *           type: integer
 *           example: 1
 *         numeroDocumento:
 *           type: string
 *           example: Nª documento de la venta
 *         documentoCliente:
 *           type: string
 *           example: Documento del cliente
 *         nombreCliente:
 *           type: string
 *           example: Nombre del cliente
 *         tipoPago:
 *           type: string
 *           example: Tipo de pago
 *         total:
 *           type: number
 *           format: float
 *           example: 100.00
 *         fechaRegistro:
 *           type: string
 *           example: 2023-06-07
 *         detalleVenta:
 *           type: array
 *           items:
 *             $ref: '#/components/schemas/DetalleVenta Entrante'
 */


/**
 * @openapi
 * components:
 *   schemas:
 *     Venta Entrante:
 *       type: object
 *       properties:
 *         numeroDocumento:
 *           type: string
 *           example: Nª documento de la venta
 *         documentoCliente:
 *           type: string
 *           example: Documento del cliente
 *         nombreCliente:
 *           type: string
 *           example: Nombre del cliente
 *         tipoPago:
 *           type: string
 *           example: Tipo de pago
 *         total:
 *           type: number
 *           format: float
 *           example: 100.00
 *         fechaRegistro:
 *           type: string
 *           example: 2023-06-07
 *         detalleVenta:
 *           type: array
 *           items:
 *             $ref: '#/components/schemas/DetalleVenta Entrante'
 */
