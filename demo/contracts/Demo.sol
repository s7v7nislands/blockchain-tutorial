// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

contract Demo {
    string public name;

    constructor(string memory _name) payable {
        name = _name;
    }

    function hello() public view returns (string memory) {
        return name;
    }
}
