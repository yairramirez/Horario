const express = require('express');
const router = express.Router();
const config = require('../config/db');
const Promise = require("bluebird");
//const passport = require('passport');
//const jwt = require('jsonwebtoken');
const alumnoController = require('../controllers/alumnoController');
//const bcrypt = require('bcryptjs');
const session = require('express-session');

router.post('/registraalumno', (req, res, next) => {
     
    var boleta = req.body.boleta;
    var nombre = req.body.nombre;
    var apPat = req.body.apPat;
    var apMat = req.body.apMat;
    var usuario = req.body.usuario;
    var contrasena = req.body.contrasena;

    Promise.resolve()
    .then(function () {
        return alumnoController.registraAlumno(boleta,nombre,apPat,apMat,usuario,contrasena);
    })
  .then(function () {
  res.json({success: true, msg:"Operacion exitosa"});
  })
  .catch(function (err) {
  res.json({success: false, msg:"Operacion denegada"});
  });
  });

  router.post('/loginalumno', (req, res, next) => {
    
    req.session.usuario = req.body.usuario;
    req.session.contrasena = req.body.contrasena;
           
    Promise.resolve()
    .then(function(){
        console.log(req.session.usuario);
        console.log(req.session.contrasena);
        return alumnoController.getAlumnoUserPass(req.body.usuario,req.body.contrasena);
    })
    .then(function(data){
        console.log("entra?");
        console.log("USUARIO",data[0].usuario);
        console.log("CONTRASENA",data[0].contrasena);
        
        if(data[0].usuario == req.session.usuario && data[0].contrasena == req.session.contrasena){
            var usr = {
                "boleta":data[0].boleta,
                "nombre":data[0].nombre, 
                "apPat":data[0].apPat,
                "apMat":data[0].apMat
               }
        }
        return usr;
    })
    .then(function (usr) {
    res.json({success: true, data: usr, msg:"Operacion exitosa"});
    })
    .catch(function (err) {
    res.json({success: false, msg:"Operacion denegada"});
    });
});

module.exports = router;