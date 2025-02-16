// routes/auth.js

const express = require('express');
const router = express.Router();
const authController = require('../controllers/authController');

// POST /auth/register
router.post('/register', authController.register);

// POST /auth/login
router.post('/login', authController.login);

// POST /auth/refresh
router.post('/refresh', authController.refreshToken);

module.exports = router;
