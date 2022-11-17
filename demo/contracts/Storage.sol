// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

contract Storage {
    uint public a = 1;
    uint128 internal b = 2;
    uint128 internal _c = 3;
    uint internal _d;
    uint[] public e = [1, 2, 3];
    mapping(uint => uint) public f;
    uint public g = 5;

    constructor() {
        f[1] = 2;
        f[2] = 4;
    }

}
