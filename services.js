const axios = require('axios');

const getUSDValue = (currencyCode) => (
  new Promise((resolve, reject) => {
    axios
      .get(`https://api.coinbase.com/v2/exchange-rates?currency=${currencyCode}`)
      .then(response => resolve(response.data))
      .catch(error => reject(error))
  })
)

module.exports= getUSDValue