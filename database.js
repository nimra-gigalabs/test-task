const mysql = require('mysql2');

let connection = mysql.createConnection({
  host: 'localhost',
  database: 'TestTaskDB',
  user: 'root',
  password: '12345678'
})


connection.connect(function(error) {
  if (error) {
    throw error;
  } else {
    console.log('MySQL Database is connected Successfully!')
  }
})

module.exports = connection
