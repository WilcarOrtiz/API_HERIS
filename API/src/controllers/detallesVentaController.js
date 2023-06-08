const detalleVentaService = require("../services/detallesVentaService");

const getdetalleVenta= async (req, res) => {
    const { params: { idVenta },} = req;
    if (!idVenta) {
        res.status(400).send({
             status: "FAILED", 
             data: { error: "Parameter ':idVenta' can not be empty" },
            });
        }
        try {
            const detalleVenta = await detalleVentaService.getdetalleVenta(idVenta);
            res.send({ status: "OK", data: detalleVenta   });
        } catch (error) {
            res.status(error?.status || 500).send({ status: "FAILED", data: { error: error?.message || error } });
        }
};

module.exports = {
    getdetalleVenta
};
