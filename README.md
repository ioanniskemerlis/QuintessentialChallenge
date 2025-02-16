# Quintessential Challenge

This is a social media API built with Node.js, Express, PostgreSQL, and Redis. The API supports user management, posts, comments, and token-based authentication (JWT). A PostgreSQL database dump is provided in the `database` folder for setting up the schema and dummy data.

## Requirements

- **Node.js** (version 14 or later recommended)
- **PostgreSQL** installed locally
- **Redis** installed locally (or Memurai on Windows)
- **Git**

## Installation

### 1. Clone the Repository

Open your terminal and run:

```bash
git clone https://github.com/ioanniskemerlis/Quintessential.git
cd Quintessential
```

2. Install Dependencies
Install the Node.js dependencies:

```bash
npm install
```

3. Configure Environment Variables
Create a file named .env in the root of the project.  Your .env file should include variables such as:

```bash
Αντιγραφή
PORT=3000
PGUSER=your_pg_username
PGHOST=localhost
PGDATABASE=your_database_name
PGPASSWORD=your_pg_password
PGPORT=5432
REDIS_HOST=127.0.0.1
REDIS_PORT=6379
JWT_SECRET=your_jwt_secret
ACCESS_TOKEN_EXPIRY=1h
REFRESH_TOKEN_EXPIRY_SECONDS=604800
```

Note: Replace the placeholder values with your actual configuration details.

4. Set Up the PostgreSQL Database
Create a Database:

Open pgAdmin or use the command line to create a new database with the name specified in your .env file (PGDATABASE).
Import the Database Dump:

Using pgAdmin:
Open pgAdmin and connect to your PostgreSQL server.
Right-click on your newly created database and select Restore...
Choose the SQL dump file from the database folder and run the restore.


5. Ensure Redis is Running
Make sure that Redis (or Memurai on Windows) is installed and running on the host and port specified in your .env file. You can verify this by connecting to Redis via your preferred client or by using:

```bash

redis-cli ping
It should return PONG.
```

6. Start the Server
Start your application with:

```bash
npm run dev
This command starts the server on the port specified in your .env file (default is 3000).
```

Usage
Authentication Endpoints
Register:

Endpoint: POST /auth/register
Body Example:
```json
{
  "email": "testuser@example.com",
  "password": "password123"
}

Description: Creates a new user account.
Login:

Endpoint: POST /auth/login
Body Example:
```json
{
  "email": "testuser@example.com",
  "password": "password123"
}

Description: Authenticates the user and returns an accessToken and refreshToken.
Refresh Token:

Endpoint: POST /auth/refresh
Body Example:
```json

{
  "refreshToken": "your_refresh_token_here"
}
Description: Generates a new access token using a valid refresh token.
Protected Routes
For endpoints that require authentication, include the access token in the Authorization header:



Authorization: Bearer <your_access_token>
Profile:
Endpoint: GET /profile
Description: Retrieves the authenticated user's profile details.


Posts Endpoints
Create a Post:

Endpoint: POST /posts
Body Example:
json

{
  "content": "This is my first post!"
}
Description: Creates a new post for the authenticated user.
Update a Post:

Endpoint: PUT /posts/{postId}
Body Example:
json

{
  "content": "This is my updated post content."
}
Description: Updates the specified post if it belongs to the authenticated user.
Delete a Post:

Endpoint: DELETE /posts/{postId}
Description: Deletes the specified post if it belongs to the authenticated user.
Fetch My Posts:

Endpoint: GET /posts/my-posts?page=1
Description: Retrieves the authenticated user's posts, paginated (5 posts per page).
Fetch Posts for a Specific User:

Endpoint: GET /posts/user/{userId}?page=1
Description: Retrieves posts for the specified user (paginated, 5 per page).
Fetch All Posts:

Endpoint: GET /posts?page=1
Description: Retrieves all posts in chronological order (paginated, 20 per page).
Comments Endpoints
Create a Comment:

Endpoint: POST /comments
Body Example:


{
  "postId": 1,
  "content": "Great post!"
}
Description: Creates a new comment on a post by the authenticated user.
Update a Comment:

Endpoint: PUT /comments/{commentId}
Body Example:
json
Αντιγραφή
{
  "content": "Updated comment content."
}
Description: Updates the specified comment if it belongs to the authenticated user.
Delete a Comment:

Endpoint: DELETE /comments/{commentId}
Description: Deletes the specified comment if it belongs to the authenticated user.
Fetch Comments for a Specific Post:

Endpoint: GET /comments/post/{postId}?page=1
Description: Retrieves comments for the specified post, paginated (5 comments per page).