const express = require('express');
const config = require('./utils/config');
const jwt = require('express-jwt');
const app = express();
let passport = require('passport');
<<<<<<< HEAD
//let userQueries = require('./utils/queries').user;
=======
const { port } = require('./utils/config');
let userQueries = require('./utils/queries').user;
>>>>>>> b4cea7e4fa842cf53878f8ad60d2c8528ff70bb0

app.use('/views', express.static(__dirname + '/public'));
app.use(express.json());
app.use(express.urlencoded({
  extended: false
}));
app.use(jwt({
  secret: config.secret
}).unless({
    path: ['/user/registrar', '/user/iniciar','/']
}));;
app.use(passport.initialize());
app.use(passport.session());
passport.serializeUser(function (user, done) {
    done(null, user);
});
passport.deserializeUser(function (user, done) {
    done(null, user);
});
app.use('/', require('./routes'));

app.get('/', function (req, res) {
  res.redirect('views/index.html');
});
app.use(function (err, req, res, next) {
  if (err.name === 'UnauthorizedError') {
    res.status(401).send({
      message: 'invalid token...',
      status:401
    });
  }
});

app.set ('port', process.env.PORT || 3000);

app.listen(app.get('port'), () => {
  console.log(`server on port ${app.get('port')}`);
});
