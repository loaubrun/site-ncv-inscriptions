const express = require('express');
const path = require('path');
const mysql = require('mysql2');
const app = express();

app.use(express.static(path.join(__dirname,'dist')));
app.use(express.json());


app.get('/', (request, response) => {
  response.sendFile(path.join(__dirname,'dist','index.html'));
});

const PORT = 3001

// Create a connection to the database
const db = mysql.createConnection({
  host: 'localhost', // Change this to your database host
  user: 'root', // Change this to your MySQL username
  password: 'NCV', // Change this to your MySQL password
  database: 'ncv-inscrits' // Change this to your database name
});

//Connect to the database
db.connect((err) => {
  if (err) {
    console.error('Error connecting to the database:', err);
    return;
  }
  console.log('Connected to MySQL database');
});

// Create a new user

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`)
});