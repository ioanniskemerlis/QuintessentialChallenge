// app.js
const express = require('express');
const app = express();
const port = process.env.PORT || 3000;

// Middleware to parse JSON bodies
app.use(express.json());

// Import routes
const authRoutes = require('./routes/auth');
const profileRoutes = require('./routes/profile');
const postsRoutes = require('./routes/posts');
const commentsRoutes = require('./routes/comments');

// Use routes
app.use('/auth', authRoutes);
app.use('/profile', profileRoutes);
app.use('/posts', postsRoutes);
app.use('/comments', commentsRoutes);

// Test DB Connection
app.get('/quintessential', async (req, res) => {
  try {
    const result = await db.query('SELECT NOW()');
    res.json({ success: true, data: result.rows });
  } catch (error) {
    console.error('Database connection error:', error);
    res.status(500).json({ success: false, error: 'Database connection failed' });
  }
});

// Τest route
app.get('/', (req, res) => {
  res.send('Hello, World!');
});

// Test Redis connection
app.get('/test-redis', async (req, res) => {
    try {
      await redisClient.set('testKey', 'testValue');
      const value = await redisClient.get('testKey');
      res.json({ success: true, value });
    } catch (error) {
      console.error('Redis error:', error);
      res.status(500).json({ success: false, error: error.message });
    }
  });
  

// Start the server
app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
