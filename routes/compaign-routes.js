const express = require('express');

const router = express.Router();

const DUMMY_DATA = [
  {
    uid: 'abcd123',
    name: 'Compaign 1',
    description: 'this is for collecting data',
    goal_amount: 1000,
    currency: 'usd',
    expiration_date: '23-12-2023',
    status: 'active'
  },
  {
    uid: 'abd234',
    name: 'Compaign 2',
    description: 'this is for collecting data',
    goal_amount: 2000,
    currency: 'usd',
    expiration_date: '23-12-2022',
    status: 'active'
  },
  {
    uid: 'abce1124',
    name: 'Compaign 3',
    description: 'this is for collecting data',
    goal_amount: 1000,
    currency: 'usd',
    expiration_date: '31-12-2023',
    status: 'active'
  },
  {
    uid: 'qwer123',
    name: 'Compaign 4',
    description: 'this is for collecting data',
    goal_amount: 3000,
    currency: 'usd',
    expiration_date: '23-12-2023',
    status: 'active'
  },
  {
    uid: 'ghjk1123',
    name: 'Compaign 5',
    description: 'this is for collecting data',
    goal_amount: 1000,
    currency: 'usd',
    expiration_date: '25-12-2023',
    status: 'active'
  },
  {
    uid: 'tyui132',
    name: 'Compaign 6',
    description: 'this is for collecting data',
    goal_amount: 2000,
    currency: 'usd',
    expiration_date: '23-12-2023',
    status: 'active'
  },
  {
    uid: 'cfghvbn123',
    name: 'Compaign 7',
    description: 'this is for collecting data',
    goal_amount: 3000,
    currency: 'usd',
    expiration_date: '25-12-2023',
    status: 'active'
  },
  {
    uid: 'asdfg678',
    name: 'Compaign 8',
    description: 'this is for collecting data',
    goal_amount: 2000,
    currency: 'usd',
    expiration_date: '23-9-2023',
    status: 'active'
  },
  {
    uid: 'dfgfhgmn123',
    name: 'Compaign 9',
    description: 'this is for collecting data',
    goal_amount: 4000,
    currency: 'usd',
    expiration_date: '23-10-2023',
    status: 'active'
  },
  {
    uid: 'admnsd1234',
    name: 'Compaign 10',
    description: 'this is for collecting data',
    goal_amount: 4000,
    currency: 'usd',
    expiration_date: '29-12-2023',
    status: 'active'
  }

]

router.get('/compaigns', (req, res, next) => {
  res.json({data: DUMMY_DATA})
});

module.exports = router;
