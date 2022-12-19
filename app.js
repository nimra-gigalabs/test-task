const express = require('express');
const bodyParser = require('body-parser');
const schedule = require('./scheduler/compaign-job')

const campaignRoutes = require('./routes/compaign-routes')
const currencyRoutes = require('./routes/currencies-routes')

const app = express();
const server = require("http").createServer(app);

app.use(bodyParser.json());

app.use((req, res, next) => {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Authorization, XMLHttpRequest');
  res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PATCH, DELETE, OPTIONS')
  next();
});

app.use(campaignRoutes);
app.use(currencyRoutes);

server.listen(5000, function() {
  schedule
});
