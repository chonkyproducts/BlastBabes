require("dotenv").config();
require("@nomicfoundation/hardhat-toolbox");

const SEPOLIA_PRIVATE_KEY = process.env.SEPOLIA_PRIVATE_KEY;

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.20",
  networks: {
    blastsepolia: {
      chainId: 168587773,
      url: "https://sepolia.blast.io",
      accounts: [SEPOLIA_PRIVATE_KEY],
    },
  },
  sourcify: {
    enabled: true,
  },
};
