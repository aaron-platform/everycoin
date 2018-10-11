module.exports = {
  networks: {
    development: {
      host: "localhost",
      port: 8545,
      network_id: "*" // Match any network id
    },
    mainnet: {
      host: "localhost",
      port: 8545,
      from: "0x8F48D450A8Dc6a55D1052EcA8891D6748C596B37",	    
      gas: 4000,
      network_id: "*" // Match any network id,
    },
    live: {
      host: "localhost",
      port: 8545,
      gas: 500000,
      gasPrice: 18000000000,
      from: "0x8F48D450A8Dc6a55D1052EcA8891D6748C596B37",	    
      network_id: 1        // Ethereum public network
    }

  }
};
