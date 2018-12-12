const express = require('express');
const router = express.Router();
const config = require('../config/db');
const Promise = require("bluebird");
//const passport = require('passport');
//const jwt = require('jsonwebtoken');
const profesorController = require('../controllers/profesorController');
//const bcrypt = require('bcryptjs');
const session = require('express-session');

router.post('/loginprofesor', (req, res, next) => {
    
    req.session.usuario = req.body.usuario;
    req.session.contrasena = req.body.contrasena;
           

    
    Promise.resolve()
    .then(function(){
        console.log(req.session.usuario);
        console.log(req.session.contrasena);
        return profesorController.getProfesorUserPass(req.body.usuario,req.body.contrasena);
    })
    .then(function(data){
        console.log("entra?");
        console.log("data[0].usuario",data[0].usuario);
        
        
        if(data[0].usuario == req.session.usuario && data[0].contrasena == req.session.contrasena){
            var usr = {
                "cedulaP":data[0].cedulaP,
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

router.get('/logoutprofesor', (req, res, next) => {
    
req.session.destroy(function(err){
    if(err){
        console.log("error");
        
    }
        console.log("ok");
})
});

router.post('/registraprofesor', (req, res, next) => {
     
    var cedulaP = req.body.cedulaP;
    var nombre = req.body.nombre;
    var apPat = req.body.apPat;
    var apMat = req.body.apMat;
    var usuario = req.body.usuario;
    var contrasena = req.body.contrasena;

    Promise.resolve()
    .then(function () {
        return profesorController.registraProfesor(cedulaP,nombre,apPat,apMat,usuario,contrasena);
    })
  .then(function () {
  res.json({success: true, msg:"Operacion exitosa"});
  })
  .catch(function (err) {
  res.json({success: false, msg:"Operacion denegada"});
  });
  });



module.exports = router;
