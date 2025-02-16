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
