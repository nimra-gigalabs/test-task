const express = require('express');
const sql = require('../database');
const getUSDValue = require('../services')

const router = express.Router();

router.get('/currencies', (req, res, next) => {
  sql.query('CALL getCurrencies()', function(err, rows, fields) {
    if (err) {
        res.status(400).send(err);
    }
    res.status(200).send(rows);
  });
});

router.get('/converted_amount', async (req, res, next) => {
  const { code, amount } = req.query;
  let response = await getUSDValue(code)

  res.status(200).send({ amount_in_usd: (amount/response.data.rates.USD) });
});

module.exports = router;