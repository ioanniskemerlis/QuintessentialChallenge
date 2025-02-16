// The profile.js file was added as an example of a protected route. Its purpose is
// to demonstrate how to use our requireAuth middleware to secure an endpoint and 
// retrieve information from the verified token (such as the user's id and email).


// routes/profile.js
const express = require('express');
const router = express.Router();
const requireAuth = require('../middlewares/requireAuth');

// Protected route that returns the authenticated user's info
router.get('/', requireAuth, (req, res) => {
  // req.auth contains the payload from the JWT (e.g., { id, email, iat, exp })
  res.json({ success: true, user: req.auth });
});

module.exports = router;
