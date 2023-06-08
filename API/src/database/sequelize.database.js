//import Sequelize  from "sequelize";
const {Sequelize } = require("sequelize");

/*PORT=3300
DBHOST=127.0.0.1
DBUSER=root
DBPASS=''
DBNAME=nodedb */


const sequelize = new Sequelize('heris','root','',{
    host:'127.0.0.1',
    dialect: 'mysql'
});

module.exports = {
    sequelize
  };