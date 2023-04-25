// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Powerup {
    // owner of this powerup
    address public owner;

    // The type of powerup 
    string public powerupType;

    // Amount of time powerup last in seconds
    uint public duration;

    // Constructor of the powerup  
    constructor(address _owner, string memory _powerupType, uint _duration) {
        owner = _owner;
        powerupType = _powerupType;
        duration = _duration;
    }

    // The function that will allower user to use the powerup 
    function use() public {
        require(msg.sender == owner, "Only the owner can use the powerup");

        // TODO: Implement the logic for using the powerup in the game

        // Destroy the powerup after it's been used
        selfdestruct(payable(owner));
    }
}