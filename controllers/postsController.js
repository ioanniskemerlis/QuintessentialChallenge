// controllers/postsController.js
const db = require('../config/db');

// Create a new post
exports.createPost = async (req, res) => {
  const { content } = req.body;
  const userId = req.auth.id; // From JWT middleware

  try {
    const result = await db.query(
      'INSERT INTO posts (user_id, content) VALUES ($1, $2) RETURNING *',
      [userId, content]
    );
    res.status(201).json({ success: true, post: result.rows[0] });
  } catch (error) {
    console.error('Error creating post:', error);
    res.status(500).json({ success: false, message: 'Failed to create post' });
  }
};

// Update a post
exports.updatePost = async (req, res) => {
  const { id } = req.params; // Post ID from URL
  const { content } = req.body;
  const userId = req.auth.id;

  try {
    // Check if post exists and belongs to the current user
    const postResult = await db.query('SELECT * FROM posts WHERE id = $1', [id]);
    if (postResult.rows.length === 0) {
      return res.status(404).json({ success: false, message: 'Post not found' });
    }
    const post = postResult.rows[0];
    if (post.user_id !== userId) {
      return res.status(403).json({ success: false, message: 'Unauthorized' });
    }

    // Update the post
    const updateResult = await db.query(
      'UPDATE posts SET content = $1, updated_at = CURRENT_TIMESTAMP WHERE id = $2 RETURNING *',
      [content, id]
    );
    res.json({ success: true, post: updateResult.rows[0] });
  } catch (error) {
    console.error('Error updating post:', error);
    res.status(500).json({ success: false, message: 'Failed to update post' });
  }
};

// Delete a post
exports.deletePost = async (req, res) => {
  const { id } = req.params;
  const userId = req.auth.id;

  try {
    // Check if post exists and belongs to the current user
    const postResult = await db.query('SELECT * FROM posts WHERE id = $1', [id]);
    if (postResult.rows.length === 0) {
      return res.status(404).json({ success: false, message: 'Post not found' });
    }
    const post = postResult.rows[0];
    if (post.user_id !== userId) {
      return res.status(403).json({ success: false, message: 'Unauthorized' });
    }

    // Delete the post
    await db.query('DELETE FROM posts WHERE id = $1', [id]);
    res.json({ success: true, message: 'Post deleted' });
  } catch (error) {
    console.error('Error deleting post:', error);
    res.status(500).json({ success: false, message: 'Failed to delete post' });
  }
};

// Retrieve the authenticated user's posts (paginated, 5 per page)
exports.getMyPosts = async (req, res) => {
  const userId = req.auth.id;
  const page = parseInt(req.query.page) || 1;
  const limit = 5;
  const offset = (page - 1) * limit;

  try {
    const result = await db.query(
      'SELECT * FROM posts WHERE user_id = $1 ORDER BY created_at DESC LIMIT $2 OFFSET $3',
      [userId, limit, offset]
    );
    res.json({ success: true, posts: result.rows });
  } catch (error) {
    console.error('Error fetching posts:', error);
    res.status(500).json({ success: false, message: 'Failed to retrieve posts' });
  }
};

// Retrieve posts for a given user (paginated, 5 per page)
// Route will have the user ID in the URL (e.g., /posts/user/2)
exports.getUserPosts = async (req, res) => {
  const { userId } = req.params;
  const page = parseInt(req.query.page) || 1;
  const limit = 5;
  const offset = (page - 1) * limit;

  try {
    const result = await db.query(
      'SELECT * FROM posts WHERE user_id = $1 ORDER BY created_at DESC LIMIT $2 OFFSET $3',
      [userId, limit, offset]
    );
    res.json({ success: true, posts: result.rows });
  } catch (error) {
    console.error('Error fetching user posts:', error);
    res.status(500).json({ success: false, message: 'Failed to retrieve posts' });
  }
};

// Retrieve all posts in chronological order (paginated, 10 per page)
exports.getAllPosts = async (req, res) => {
  const page = parseInt(req.query.page) || 1;
  const limit = 10;
  const offset = (page - 1) * limit;

  try {
    const result = await db.query(
      'SELECT * FROM posts ORDER BY created_at DESC LIMIT $1 OFFSET $2',
      [limit, offset]
    );
    res.json({ success: true, posts: result.rows });
  } catch (error) {
    console.error('Error fetching all posts:', error);
    res.status(500).json({ success: false, message: 'Failed to retrieve posts' });
  }
};
