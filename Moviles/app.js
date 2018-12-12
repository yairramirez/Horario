const express = require('express');
const path = require('path');
const bodyparser = require('body-parser');
const cors = require('cors');
const config = require('./config/db');
const session = require('express-session');
//const passport = require('passport');

const app = express();

const salon = require('./routes/salon');
 const profesor = require('./routes/profesor');
 const alumno = require('./routes/alumno');
// const educacion = require('./routes/educacion');

 const port = process.env.PORT || 3000;
//const port = process.env.PORT || 80;

app.use(cors());

//Static Folder
app.use(express.static(path.join(__dirname, 'public')));

//Body Paerser
app.use(bodyparser.json());

app.use(session({secret:'secreto',resave: true, saveUninitialized: true}));

//passport midleware

//app.use(passport.initialize());
//app.use(passport.session());

//require('./config/passport')(passport);
app.use('/salon',salon);
 app.use('/profesor',profesor);
 app.use('/alumno',alumno);
// app.use('/educacion',educacion);

app.get('/', (req, res)=> {
  res.send("Arriba");
});

// app.get('*', (req,res) => {
//   res.sendFile(path.join(__dirname, 'public/index.html'));
// })

app.listen(port, () => {
  console.log("Server started on " + port);
});
