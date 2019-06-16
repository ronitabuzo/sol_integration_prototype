App = {
  web3Provider: null,
  contracts: {},

  init: async function() {

    return await App.initWeb3();
  },

  initWeb3: async function() {
    // Modern dapp browsers...
    if (window.ethereum) {
      App.web3Provider = window.ethereum;
      try {
        // Request account access
        await window.ethereum.enable();
      } catch (error) {
        // User denied account access...
        console.error("User denied account access")
      }
    }
    // Legacy dapp browsers...
    else if (window.web3) {
      App.web3Provider = window.web3.currentProvider;
    }
    // If no injected web3 instance is detected, fall back to Ganache
    else {
      App.web3Provider = new Web3.providers.HttpProvider('http://localhost:7545');
    }
    web3 = new Web3(App.web3Provider);

    return App.initContract();
  },

  initContract: function() {

    $.getJSON("Claim.json", function(claim) {
      // Instantiate a new truffle contract from the artifact
      App.contracts.Claim = TruffleContract(claim);
      // Connect provider to interact with contract
      App.contracts.Claim.setProvider(App.web3Provider);

      App.listenForEvents();

    });
  },

  //Listen for events emitted from the contract
  listenForEvents: function() {
    App.contracts.Claim.deployed().then(function(instance) {
      instance.recordClaimApplicationEvent({}, {
        fromBlock: 0,
        toBlock: 'latest'
      }
     ).watch(function(error, event) {
        console.log("event triggered", event)
        App.callExternalAPI();
      });
    });
  },

  callExternalAPI: function(){
    const https = require('https')

      const data = JSON.stringify({
        todo: 'test'
      })

      const options = {
        hostname: '',
        port: 443,
        path: '/todos',
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'Content-Length': data.length
        }
      }
  }


};

$(function() {
  $(window).load(function() {
    App.init();
  });
});
