# BlastBabes

BlastBabes is a profile picture (PFP) collection on the Blast testnet, set to launch on the Blast mainnet in March. The collection features 100 unique waifu-style Blast Babes, created using Leonardo.AI trained on z3us' models.

This project is a free claim drop for wallets on a whitelist, which will be generated from a list of wallets holding any NFT from z3us' collections. It leverages Blast's native yield utility, enabling creators to receive and claim gas fees spent on a contract. This feature is utilized in this collection to enable a form of token-gated, free drop that rewards the creator and incentivizes community engagement and market participation in the Blast ecosystem.

## Directory Structure

- `contracts`: Contains the Solidity contract `blastbabes.sol` for the BlastBabes NFT.
- `metadata`: Contains the metadata for the NFTs.
  - `metadata` metadata files: JSON files containing the metadata for each NFT.
  - `images`: Folder containing the images for each NFT.
  - `metadata.py`: A Python script to generate the metadata JSON files.
- `scripts`: Contains the deployment script `deploy.js` for the BlastBabes contract.
