const db = require('../config/db');
//módulos de la conexión
const querySql = db.querySql;
const getSqlConnection = db.getSqlConnection;
//manejo de promises node.js
const Promise = require("bluebird");

module.exports.getProfesorUserPass = function (user,pass) {
    const query = "select * from profesor where usuario = ? and contrasena = ? ";
    return querySql(query,[user,pass]);
}

module.exports.registraProfesor = function (cedulaP,nombre,apPat,apMat,usuario,contrasena) {
    const query = "insert into profesor (cedulaP,nombre,apPat,apMat,usuario,contrasena)values(?,?,?,?,?,?)";
    return querySql(query,[cedulaP,nombre,apPat,apMat,usuario,contrasena]);
}

