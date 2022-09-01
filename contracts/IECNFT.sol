// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract IECNFT is ERC721, ERC721URIStorage, Pausable, Ownable {    
    
    constructor(address tokenaddress) ERC721("IECNFT", "ICN") {
        IECTokens = IERC20(tokenaddress);
    }
    
    IERC20 public IECTokens;
    uint256 fees=500000000000000000;
   
    /** 
    * @dev buyIecCNFT is used to purchase IEC NFT from exsist address.
    * @param from - NFT owner 
    * @param tokenId - id of NFT 
    * after purchase NFT IEC Tokens will be subtract from your IECToken account
    */
    function buyIecNFT(address from, uint256 tokenId) external {
      IECTokens.transferFrom(msg.sender, from , fees); 
     _transfer(from, msg.sender, tokenId);   
    }

    /**
    * @dev withdraw for owner only, 
    * This function withdraw NFT minting feeses that have in smart Contract
    * its modified, function for owner withdraw IEC,NFT.
    */
    function withdraw()external onlyOwner{
    IECTokens.transfer(msg.sender,IECTokens.balanceOf(address(this)));
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function safeMint(address to, uint256 tokenId, string memory uri)
        public
    { 
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uri);
        IECTokens.transferFrom(msg.sender,address(this),fees);  
    }

    function _beforeTokenTransfer(address from, address to, uint256 tokenId)
        internal
        whenNotPaused
        override
    {
        super._beforeTokenTransfer(from, to, tokenId);
    }

    // The following functions are overrides required by Solidity.

    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }
}