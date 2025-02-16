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
Modify the file named .env in the root of the project.  Your .env file should include variables such as:

```bash

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

## API Endpoints

### Authentication Endpoints

- **Register User**
  - **Method:** POST
  - **Endpoint:** `/auth/register`
  - **Description:** Registers a new user.
  - **Body Example:**
    ```json
    {
      "email": "testuser@example.com",
      "password": "password123"
    }
    ```

- **Login User**
  - **Method:** POST
  - **Endpoint:** `/auth/login`
  - **Description:** Authenticates a user and returns an access token and refresh token.
  - **Body Example:**
    ```json
    {
      "email": "testuser@example.com",
      "password": "password123"
    }
    ```

- **Refresh Token**
  - **Method:** POST
  - **Endpoint:** `/auth/refresh`
  - **Description:** Generates a new access token using a valid refresh token.
  - **Body Example:**
    ```json
    {
      "refreshToken": "your_refresh_token_here"
    }
    ```

### Protected Routes

- **Get Profile**
  - **Method:** GET
  - **Endpoint:** `/profile`
  - **Description:** Retrieves the authenticated user's profile details.
  - **Headers:**  
    `Authorization: Bearer <your_access_token>`

### Posts Endpoints

- **Create a Post**
  - **Method:** POST
  - **Endpoint:** `/posts`
  - **Description:** Creates a new post for the authenticated user.
  - **Headers:**  
    `Authorization: Bearer <your_access_token>`
  - **Body Example:**
    ```json
    {
      "content": "This is my first post!"
    }
    ```

- **Update a Post**
  - **Method:** PUT
  - **Endpoint:** `/posts/{postId}`
  - **Description:** Updates an existing post if it belongs to the authenticated user.
  - **Headers:**  
    `Authorization: Bearer <your_access_token>`
  - **Body Example:**
    ```json
    {
      "content": "This is my updated post content."
    }
    ```

- **Delete a Post**
  - **Method:** DELETE
  - **Endpoint:** `/posts/{postId}`
  - **Description:** Deletes a post if it belongs to the authenticated user.
  - **Headers:**  
    `Authorization: Bearer <your_access_token>`

- **Fetch My Posts**
  - **Method:** GET
  - **Endpoint:** `/posts/my-posts?page=1`
  - **Description:** Retrieves posts created by the authenticated user (paginated, 5 per page).
  - **Headers:**  
    `Authorization: Bearer <your_access_token>`

- **Fetch Posts for a Specific User**
  - **Method:** GET
  - **Endpoint:** `/posts/user/{userId}?page=1`
  - **Description:** Retrieves posts for a specified user (paginated, 5 per page).

- **Fetch All Posts**
  - **Method:** GET
  - **Endpoint:** `/posts?page=1`
  - **Description:** Retrieves all posts in chronological order (paginated, 20 per page).

### Comments Endpoints

- **Create a Comment**
  - **Method:** POST
  - **Endpoint:** `/comments`
  - **Description:** Creates a new comment on a post by the authenticated user.
  - **Headers:**  
    `Authorization: Bearer <your_access_token>`
  - **Body Example:**
    ```json
    {
      "postId": 1,
      "content": "Great post!"
    }
    ```

- **Update a Comment**
  - **Method:** PUT
  - **Endpoint:** `/comments/{commentId}`
  - **Description:** Updates a comment if it belongs to the authenticated user.
  - **Headers:**  
    `Authorization: Bearer <your_access_token>`
  - **Body Example:**
    ```json
    {
      "content": "Updated comment content."
    }
    ```

- **Delete a Comment**
  - **Method:** DELETE
  - **Endpoint:** `/comments/{commentId}`
  - **Description:** Deletes a comment if it belongs to the authenticated user.
  - **Headers:**  
    `Authorization: Bearer <your_access_token>`

- **Fetch Comments for a Specific Post**
  - **Method:** GET
  - **Endpoint:** `/comments/post/{postId}?page=1`
  - **Description:** Retrieves comments for a specified post (paginated, 5 comments per page).
