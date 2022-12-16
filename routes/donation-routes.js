const express = require('express');

const router = express.Router();

router.post('/donations', (req, res, next) => {
  const { nickName, amount } = req.body;

  res.json({ message: 'Successfully created!'})
  res.status(201)
});

module.exports = router;