const db = require('../config/db');
//módulos de la conexión
const querySql = db.querySql;
const getSqlConnection = db.getSqlConnection;
//manejo de promises node.js
const Promise = require("bluebird");

module.exports.getAlumnoUserPass = function (user,pass) {
    const query = "select * from alumno where usuario = ? and contrasena = ? ";
    return querySql(query,[user,pass]);
}

module.exports.registraAlumno = function (boleta,nombre,apPat,apMat,usuario,contrasena) {
    const query = "insert into alumno (boleta,nombre,apPat,apMat,usuario,contrasena)values(?,?,?,?,?,?)";
    return querySql(query,[boleta,nombre,apPat,apMat,usuario,contrasena]);
}

