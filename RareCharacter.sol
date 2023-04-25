// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract RareCharacter is ERC721, Ownable {
    using SafeMath for uint256;

    // Unique character's name
    string public name;

    // character's image
    string public image;

    // address of the user who currently owns the character
    address public owner;

    // current price 
    uint256 public price;

    // The constructor function sets the name and image for the character and mints the character 
    constructor(string memory _name, string memory _image, uint256 _price) ERC721("Rare Character", "RC") {
        name = _name;
        image = _image;
        owner = msg.sender;
        price = _price;
        _mint(msg.sender, 1);
    }

    // This function allows the owner to transfer ownership of the character to another user
    function transferOwnership(address _newOwner) public onlyOwner {
        owner = _newOwner;
        transferFrom(msg.sender, _newOwner, 1);
    }

    // This function allows the owner to set a new price for the character
    function setPrice(uint256 _price) public onlyOwner {
        price = _price;
    }

    // This function allows anyone to buy the character from the current owner for the current price
    function buy() public payable {
        require(msg.value >= price, "Not enough ETH sent");
        transferFrom(owner, msg.sender, 1);
        owner = msg.sender;
    }

    // This function allows the owner to withdraw the current balance of the contract
    function withdraw() public onlyOwner {
        uint256 balance = address(this).balance;
        payable(owner).transfer(balance);
    }
}