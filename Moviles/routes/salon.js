const express = require('express');
const router = express.Router();
const config = require('../config/db');
const Promise = require("bluebird");
//const passport = require('passport');
//const jwt = require('jsonwebtoken');
const salonController = require('../controllers/salonController');
//const bcrypt = require('bcryptjs');
const session = require('express-session');

 router.post('/salonesprofesoresvacio', (req, res, next) => {
     
    var dia = req.body.dia;
    var hora = req.body.hora;
    var edificio = req.body.edificio;

    Promise.resolve()
    .then(function () {
        console.log("req",req.body);
        
        return salonController.getSalonesLibres(dia,hora,edificio);
		console.log("traigo la consulta");
    })
  .then(function (data) {
  res.json({success: true, dato:data, msg:"Operacion exitosa"});
  })
  .catch(function (err) {
  res.json({success: false, msg:"Operacion denegada"});
  });
  });
  
  router.get('/NombresProfesores', (req, res, next) => {
    Promise.resolve()
    .then(function () {    
        return salonController.getNombresProfesores();
    })
  .then(function (data) {
  res.json({success: true, dato:data, msg:"Operacion exitosa"});
  })
  .catch(function (err) {
  res.json({success: false, msg:"Operacion denegada"});
  });
  });

  router.post('/HorarioProfesor', (req, res, next) => {
     
    var cedulaP = req.body.cedulaP;

    Promise.resolve()
    .then(function () {
        console.log("req",req.body);
        
        return salonController.getHorarioProfesor(cedulaP);
		console.log("traigo la consulta");
    })
  .then(function (data) {
  res.json({success: true, dato:data, msg:"Operacion exitosa"});
  })
  .catch(function (err) {
  res.json({success: false, msg:"Operacion denegada"});
  });
  });
  
  router.get('/horariosprofesores', (req, res, next) => {
    Promise.resolve()
    .then(function () {    
        return salonController.getHorarios();
    })
  .then(function (data) {
  res.json({success: true, dato:data, msg:"Operacion exitosa"});
  })
  .catch(function (err) {
  res.json({success: false, msg:"Operacion denegada"});
  });
  });

  module.exports = router;