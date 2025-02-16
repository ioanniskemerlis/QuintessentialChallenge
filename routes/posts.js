// routes/posts.js
const express = require('express');
const router = express.Router();
const postsController = require('../controllers/postsController');
const requireAuth = require('../middlewares/requireAuth');

// Protected routes: create, update, delete, and fetch authenticated user's posts
router.post('/', requireAuth, postsController.createPost);
router.put('/:id', requireAuth, postsController.updatePost);
router.delete('/:id', requireAuth, postsController.deletePost);
router.get('/my-posts', requireAuth, postsController.getMyPosts);

// Public routes: fetch posts for a specific user and fetch all posts
router.get('/user/:userId', postsController.getUserPosts);
router.get('/', postsController.getAllPosts);

module.exports = router;
