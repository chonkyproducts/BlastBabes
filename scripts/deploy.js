const { ethers } = require("hardhat");

async function main() {
  const contractOwner = await ethers.getSigners();
  console.log(`Deploying contract from: ${contractOwner[0].address}`);

  const BlastBabes = await ethers.getContractFactory('BlastBabes');

  //Deploy the contract
  console.log('Deploying BlastBabes...');
  const blastBabes = await BlastBabes.deploy(contractOwner[0].address, { gasLimit: 10000000 });

  console.log('BlastBabes deployed to:', blastBabes.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error('Error deploying contract:', error);
    process.exitCode = 1;
  });