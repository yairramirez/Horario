const express = require('express');
const router = express.Router();
const config = require('../config/db');
const Promise = require("bluebird");
//const passport = require('passport');
//const jwt = require('jsonwebtoken');
const profesorHorarioController = require('../controllers/profesorHorarioController');
//const bcrypt = require('bcryptjs');
const session = require('express-session');

router.post('/buscarhorarios', (req, res, next) => {
     
    var cedulaP = req.body.cedulaP;

    Promise.resolve()
    .then(function () {
        return profesorHorarioController.getHorarioProfesor(cedulaP);
    })
    .then(function(data){
        var horarioProf = {
            "nombreMateria":data[0].nombreMateria,
            "nombreGrupo":data[0].nombreGrupo, 
            "nombre":data[0].nombre,
            "apPat":data[0].apPat,
            "apMat":data[0].apMat,
            "cedulaP":data[0].cedulaP
            // "":data[0].,
            // "":data[0].,
            // "":data[0].,
            // "":data[0].,
            // "":data[0].,
            // "":data[0].,
            // "":data[0].,
            // "":data[0].,
            // "":data[0].,

        }

        return;
    })
    .then(function () {
  res.json({success: true, msg:"Operacion exitosa"});
  })
  .catch(function (err) {
  res.json({success: false, msg:"Operacion denegada"});
  });
  });

module.exports = router;