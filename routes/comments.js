// routes/comments.js
const express = require('express');
const router = express.Router();
const commentsController = require('../controllers/commentsController');
const requireAuth = require('../middlewares/requireAuth');

// Protected routes for creating, updating, and deleting comments
router.post('/', requireAuth, commentsController.createComment);
router.put('/:id', requireAuth, commentsController.updateComment);
router.delete('/:id', requireAuth, commentsController.deleteComment);

// Public route: get comments for a specific post
router.get('/post/:postId', commentsController.getCommentsForPost);

module.exports = router;
