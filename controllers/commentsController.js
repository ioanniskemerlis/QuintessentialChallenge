const db = require('../config/db');

// Create a new comment
exports.createComment = async (req, res) => {
  const { postId, content } = req.body;
  const userId = req.auth.id;

  try {
    // Optionally: Validate that the post exists before commenting
    const result = await db.query(
      'INSERT INTO comments (post_id, user_id, content) VALUES ($1, $2, $3) RETURNING *',
      [postId, userId, content]
    );
    res.status(201).json({ success: true, comment: result.rows[0] });
  } catch (error) {
    console.error('Error creating comment:', error);
    res.status(500).json({ success: false, message: 'Failed to create comment' });
  }
};

// Update a comment
exports.updateComment = async (req, res) => {
  const { id } = req.params; // Comment ID from URL
  const { content } = req.body;
  const userId = req.auth.id;

  try {
    // Check if comment exists and belongs to the current user
    const result = await db.query('SELECT * FROM comments WHERE id = $1', [id]);
    if (result.rows.length === 0) {
      return res.status(404).json({ success: false, message: 'Comment not found' });
    }
    const comment = result.rows[0];
    if (comment.user_id !== userId) {
      return res.status(403).json({ success: false, message: 'Unauthorized' });
    }

    const updateResult = await db.query(
      'UPDATE comments SET content = $1, updated_at = CURRENT_TIMESTAMP WHERE id = $2 RETURNING *',
      [content, id]
    );
    res.json({ success: true, comment: updateResult.rows[0] });
  } catch (error) {
    console.error('Error updating comment:', error);
    res.status(500).json({ success: false, message: 'Failed to update comment' });
  }
};

// Delete a comment
exports.deleteComment = async (req, res) => {
  const { id } = req.params;
  const userId = req.auth.id;

  try {
    // Check if comment exists and belongs to the current user
    const result = await db.query('SELECT * FROM comments WHERE id = $1', [id]);
    if (result.rows.length === 0) {
      return res.status(404).json({ success: false, message: 'Comment not found' });
    }
    const comment = result.rows[0];
    if (comment.user_id !== userId) {
      return res.status(403).json({ success: false, message: 'Unauthorized' });
    }

    await db.query('DELETE FROM comments WHERE id = $1', [id]);
    res.json({ success: true, message: 'Comment deleted' });
  } catch (error) {
    console.error('Error deleting comment:', error);
    res.status(500).json({ success: false, message: 'Failed to delete comment' });
  }
};

// Retrieve comments for a specific post (paginated, 5 per page)
exports.getCommentsForPost = async (req, res) => {
  const { postId } = req.params;
  const page = parseInt(req.query.page) || 1;
  const limit = 5;
  const offset = (page - 1) * limit;

  try {
    const result = await db.query(
      'SELECT * FROM comments WHERE post_id = $1 ORDER BY created_at ASC LIMIT $2 OFFSET $3',
      [postId, limit, offset]
    );
    res.json({ success: true, comments: result.rows });
  } catch (error) {
    console.error('Error fetching comments:', error);
    res.status(500).json({ success: false, message: 'Failed to retrieve comments' });
  }
};
