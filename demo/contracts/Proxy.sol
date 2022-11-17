// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Sample code, do not use in production!
contract Proxy {
    address implementation;

    constructor() {
        implementation = address(new Store());
    }
    fallback() external payable {
        (bool res, ) = implementation.delegatecall(msg.data);
        require(res, "Failed to delegatecall");
    }
}

contract Store {
    address _implementation;
    uint256 public count;

    function add() external {
        count += 1;
    }
}