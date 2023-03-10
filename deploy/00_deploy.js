require("hardhat-deploy")
require("hardhat-deploy-ethers")

const { networkConfig } = require("../helper-hardhat-config")


const private_key = network.config.accounts[0]
const wallet = new ethers.Wallet(private_key, ethers.provider)


module.exports = async ({ deployments }) => {
    console.log("Wallet Ethereum Address:", wallet.address)
    const chainId = network.config.chainId

    const Spotifil = await ethers.getContractFactory('Spotifil', wallet);
    console.log('Deploying Spotifil...');
    let spotifil = await Spotifil.deploy();
    spotifil = await spotifil.deployed()
    console.log('Spotifil deployed to:', spotifil.address);
}
