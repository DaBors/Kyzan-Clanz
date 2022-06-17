// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "./Mintable.sol";


contract KyzanClanz is ERC721, ERC721URIStorage, Mintable {
    address public contractOwner;
    address public starkContractAddress;

    constructor(address _contractOwner, address _starkContractAddress)
        ERC721("Kyzan Clanz", "KZCL")
        Mintable(_contractOwner, _starkContractAddress)
    {
        contractOwner = _contractOwner;
        starkContractAddress = _starkContractAddress;
    }

    function _mintFor(
        address to,
        uint256 id,
        bytes memory blueprint
    ) internal override {
        _safeMint(to, id);
        _setTokenURI(
            id,
            string(abi.encodePacked("https://ipfs.io/ipfs/", blueprint))
        );
    }

    function _burn(uint256 tokenId)
        internal
        override(ERC721, ERC721URIStorage)
    {
        require(
            ownerOf(tokenId) == _msgSender() || ownerOf(tokenId) == owner(),
            "K7CR: You Are Not The Owner Of The Token"
        );
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