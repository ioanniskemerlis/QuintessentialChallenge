const redis = require('redis');
require('dotenv').config();

const client = redis.createClient({
  socket: {
    host: process.env.REDIS_HOST,
    port: process.env.REDIS_PORT,
  }
});

client.on('error', (err) => {
  console.error('Redis Client Error', err);
});

// Connect to Redis
(async () => {
  try {
    await client.connect();
    console.log('Connected to Redis successfully.');
  } catch (error) {
    console.error('Could not connect to Redis:', error);
  }
})();

module.exports = client;
