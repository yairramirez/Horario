const db = require('../config/db');
//módulos de la conexión
const querySql = db.querySql;
const getSqlConnection = db.getSqlConnection;
//manejo de promises node.js
const Promise = require("bluebird");

module.exports.getHorarioProfesor = function (cedulaP) {
    const query = "select * from profesorhorario inner join profesor inner join grupo inner join materia on profesorhorario.cedulaP = profesor.cedulaP and profesorhorario.idgrupo = grupo.idgrupo and profesorhorario.idmateria = materia.idmateria where profesorhorario.cedulaP = ?";
    return querySql(query,[cedulaP]);
}

