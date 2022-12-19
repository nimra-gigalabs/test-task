let cron = require('node-cron');
const sql = require('../database');

const job = cron.schedule("*/10 * * * * *", function() {
  sql.query('CALL markExpired()');
});
