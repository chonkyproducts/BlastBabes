// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";


interface IBlast {
    function configureClaimableGas() external;
    function claimAllGas(address contractAddress, address recipient) external returns (uint256);
    function configureGovernor(address _governor) external;
}

contract BlastBabes is ERC721Enumerable, Ownable {
    IBlast public constant BLAST = IBlast(0x4300000000000000000000000000000000000002);
    mapping(address => bool) public whitelist;

    constructor(address initialOwner) ERC721("BBABE", "BABE") Ownable(initialOwner) {
        BLAST.configureClaimableGas();
    }


    function mint(uint256 tokenId) public {
    require(whitelist[msg.sender], "Not whitelisted");
    _mint(msg.sender, tokenId);
    }

    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
    require(balanceOf(ownerOf(tokenId)) > 0, "ERC721Metadata: URI query for nonexistent token");

    // Convert the tokenId to a string
    string memory tokenIdStr = Strings.toString(tokenId);
    
    // Concatenate the base URI and the tokenId string to create the full URI
    string memory base = "ipfs://QmYZV7iq3UXL8GDPmRHXVDNkyYWtqWYx8T3f1K682FV9uL/";
    string memory json = ".json";
    string memory fullURI = string(abi.encodePacked(base, tokenIdStr, json));

    return fullURI;
    }

    function addToWhitelist(address account) public onlyOwner {
        whitelist[account] = true;
    }

    function removeFromWhitelist(address account) public onlyOwner {
        whitelist[account] = false;
    }

    function claim() public {
        require(whitelist[msg.sender], "Not whitelisted");
        _mint(msg.sender, totalSupply() + 1);
        }

    function claimGasFees() public {
        uint256 amount = BLAST.claimAllGas(address(this), msg.sender);
        // Transfer the claimed amount to the creator wallet
        // This is a simplified example, you might want to implement a more complex logic
        payable(owner()).transfer(amount);
    }

    function setGovernor(address _newGovernor) public onlyOwner {
        BLAST.configureGovernor(_newGovernor);
    }
}

