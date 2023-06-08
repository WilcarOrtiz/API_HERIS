const dashBoardService = require("../services/dashBoardService");

const getdashBoard = async (req, res) => {
  try {
    const dashBoard = await dashBoardService.getdashBoard();
    res.status(200).send({ status: "OK", data:  dashBoard});
  } catch (error) {
    res.status(error?.status || 500).send({ status: "FAILED", data: { error: error?.message || error } });
  }
};

module.exports = {
    getdashBoard 
};