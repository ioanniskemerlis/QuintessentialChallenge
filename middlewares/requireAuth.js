// middlewares/requireAuth.js
const { expressjwt: jwt } = require('express-jwt');
require('dotenv').config();

const requireAuth = jwt({
  secret: process.env.JWT_SECRET,
  algorithms: ['HS256'],
});

module.exports = requireAuth;
