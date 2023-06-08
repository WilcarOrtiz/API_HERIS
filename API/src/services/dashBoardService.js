const DashBoard= require("../database/dashBoard");

const getdashBoard = async () => {
  try {
    const dashBoard = await DashBoard.getdashBoard();
    return dashBoard;
  } catch (error) {
    throw error;
  }
};


module.exports = {
    getdashBoard 
  };