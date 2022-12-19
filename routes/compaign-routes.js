const express = require('express');
const sql = require('../database');

const router = express.Router();
const { check } = require('express-validator');
const getUSDValue = require('../services')

router.get('/compaigns', (req, res, next) => {
  sql.query('CALL getAllActiveCompaigns()', function(err, rows, fields) {
    if (err) {
      res.status(400).send(err);
    }
    res.status(200).send(rows);
  });
});

router.post('/compaigns/:id/donations',
  [
    check('nickName')
      .not()
      .isEmpty()
      .matches(/^[a-zA-Z](((?!__)[a-zA-Z0-9_])*[a-zA-Z0-9])?$/)
      .withMessage('Not a valid username'),
    check('amount').isFloat({ min: 1}),
    check('currencyCode').not().isEmpty(),
    check('currencyId').not().isEmpty()
  ],
  (req, res, next) => {
  sql.query('CALL getCompaignStatus(?)', [req.params.id], async function(err, rows, fields) {
    if (err) {
      res.status(400).send(err);
    }
    if (rows[0][0].name === 'active') {
      const { nickName, amount, currencyId, currencyCode } = req.body;
      let response = await getUSDValue(currencyCode);

      sql.query('CALL addDonation(?, ?, ?, ?, ?)',
      [nickName, parseFloat(amount), req.params.id, currencyId, (response.data.rates.USD * amount)],
      function(err, rows, fields) {
        if (err) {
          res.status(400).send(err);
        }
        res.status(200).send(rows);
      });
    } else {
      res.status(400).send(`Compaign Status is ${rows[0][0].name}`);
    }
  });
});

router.post('/compaigns/:id/fraud', (req, res, next) => {
  const status_name = 'fraud'
  sql.query('CALL updateCompaignStatus(?, ?)', [status_name, req.params.id], function(err, rows, fields) {
    if (err) {
      res.status(400).send(err);
    }
    res.status(200).send(rows);
  });
});

module.exports = router;
