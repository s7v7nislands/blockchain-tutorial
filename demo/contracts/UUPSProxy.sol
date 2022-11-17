// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Sample code, do not use in production!

contract UUPSProxy {
    address implementation;
    fallback() external payable {
        implementation.delegatecall(msg.data);
    }
}
abstract contract UUPSProxiable {
    address implementation;
    address admin;
    function upgrade(address newImplementation) external {
        require(msg.sender == admin);
        implementation = newImplementation;
    }
}

contract UStore1 {
    address _implementation;
    uint256 public count;

    function add() external {
        count += 1;
    }
}

contract UStore2 {
    address _implementation;
    uint256 public count;

    function add() external {
        count += 100;
    }
}