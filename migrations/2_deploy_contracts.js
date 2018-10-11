var Token = artifacts.require("./EveryCoin.sol");
var tokenContract;
module.exports = function(deployer) {
    var admin = "0x8F48D450A8Dc6a55D1052EcA8891D6748C596B37"; 
    var totalTokenAmount = 88.8 * 1000000000 * 1000000000000;
    return Token.new(admin, totalTokenAmount).then(function(result) {
        tokenContract = result;
    });
};
