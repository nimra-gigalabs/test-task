const express = require('express');
const bodyParser= require('body-parser');

const campaignRoutes = require('./routes/compaign-routes')
const donationRoutes = require('./routes/donation-routes')

const app = express();

app.use(bodyParser.json());

app.use((req, res, next) => {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Authorization, XMLHttpRequest');
  res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PATCH, DELETE, OPTIONS')
  next();
});

app.use(campaignRoutes);
app.use(donationRoutes);

app.listen(5000);
