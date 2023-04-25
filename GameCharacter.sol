// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GameCharacter {
    //  Owner of the character
    address public owner;

    // Skin ID for the character
    uint public skinId;

    //  constructor that sets the owner and skin ID
    constructor(address _owner, uint _skinId) {
        owner = _owner;
        skinId = _skinId;
    }

    // Allows owner to change Skin ID
    function changeSkin(uint _newSkinId) public {
        require(msg.sender == owner, "Only the owner can change the skin ID");
        skinId = _newSkinId;
    }
}