// controllers/authController.js
const db = require('../config/db');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const crypto = require('crypto');
const redisClient = require('../config/redis');
require('dotenv').config();

const JWT_SECRET = process.env.JWT_SECRET || 'your_jwt_secret';
const ACCESS_TOKEN_EXPIRY = process.env.ACCESS_TOKEN_EXPIRY || '1h';
const REFRESH_TOKEN_EXPIRY_SECONDS = parseInt(process.env.REFRESH_TOKEN_EXPIRY_SECONDS) || (7 * 24 * 60 * 60); // 7 days

// User Registration
exports.register = async (req, res) => {
  const { email, password } = req.body;
  try {
    // Check if user already exists
    const existingUser = await db.query('SELECT * FROM users WHERE email = $1', [email]);
    if (existingUser.rows.length > 0) {
      return res.status(400).json({ success: false, message: 'Email already exists' });
    }
    // Hash the password
    const hashedPassword = await bcrypt.hash(password, 10);
    // Insert the new user
    const result = await db.query(
      'INSERT INTO users (email, password) VALUES ($1, $2) RETURNING id, email, created_at',
      [email, hashedPassword]
    );
    const user = result.rows[0];
    res.status(201).json({ success: true, user });
  } catch (error) {
    console.error('Registration error:', error);
    res.status(500).json({ success: false, message: 'Registration failed, try again' });
  }
};

// User Login
exports.login = async (req, res) => {
  const { email, password } = req.body;
  try {
    // Find the user by email
    const result = await db.query('SELECT * FROM users WHERE email = $1', [email]);
    if (result.rows.length === 0) {
      return res.status(400).json({ success: false, message: 'Invalid email or password' });
    }
    const user = result.rows[0];
    
    // Compare the provided password with the stored hash
    const validPassword = await bcrypt.compare(password, user.password);
    if (!validPassword) {
      return res.status(400).json({ success: false, message: 'Invalid email or password' });
    }
    
    // Generate an access token (JWT)
    const accessToken = jwt.sign({ id: user.id, email: user.email }, JWT_SECRET, {
      expiresIn: ACCESS_TOKEN_EXPIRY,
    });
    
    // Generate a refresh token as a random string
    const refreshToken = crypto.randomBytes(64).toString('hex');
    
    // Store the refresh token in Redis with an expiration
    await redisClient.set(`refreshToken:${refreshToken}`, user.id.toString(), {
      EX: REFRESH_TOKEN_EXPIRY_SECONDS,
    });
    
    res.json({ success: true, accessToken, refreshToken });
  } catch (error) {
    console.error('Login error:', error);
    res.status(500).json({ success: false, message: 'Login failed' });
  }
};

exports.refreshToken = async (req, res) => {
    const { refreshToken } = req.body;
    if (!refreshToken) {
      return res.status(400).json({ success: false, message: "Refresh token required" });
    }
    
    try {
      // Retrieve the user id associated with the refresh token from Redis
      const userId = await redisClient.get(`refreshToken:${refreshToken}`);
      if (!userId) {
        return res.status(401).json({ success: false, message: "Invalid or expired refresh token" });
      }
      
      // Fetch the user's details from the database
      const result = await db.query('SELECT id, email FROM users WHERE id = $1', [userId]);
      if (result.rows.length === 0) {
        return res.status(404).json({ success: false, message: "User not found" });
      }
      const user = result.rows[0];
      
      // Generate a new access token
      const newAccessToken = jwt.sign(
        { id: user.id, email: user.email },
        process.env.JWT_SECRET,
        { expiresIn: process.env.ACCESS_TOKEN_EXPIRY || '1h' }
      );
      
      res.json({ success: true, accessToken: newAccessToken });
    } catch (error) {
      console.error('Error refreshing token:', error);
      res.status(500).json({ success: false, message: "Failed to refresh token" });
    }
  };