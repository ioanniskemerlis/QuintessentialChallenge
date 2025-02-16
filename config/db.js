
const { Pool } = require('pg');
require('dotenv').config(); // Load environment variables

const pool = new Pool({
  user: process.env.PGUSER,
  host: process.env.PGHOST,
  database: process.env.PGDATABASE,
  password: process.env.PGPASSWORD,
  port: process.env.PGPORT,
});

// Export a query function for executing SQL queries
module.exports = {
  query: (text, params, callback) => pool.query(text, params, callback),
  pool, // in case you need direct access to the pool
};
