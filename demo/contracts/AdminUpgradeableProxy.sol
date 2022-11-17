// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Sample code, do not use in production!
contract AdminUpgradeableProxy {
    address implementation;
    address admin;

    fallback() external payable {
        (bool res, ) = implementation.delegatecall(msg.data);
        require(res, "Failed to delegatecall");
    }

    receive() external payable {}

     function upgrade(address newImplementation) external {
        require(msg.sender == admin);
        implementation = newImplementation;
    }
}

contract AStore1 {
    address _implementation;
    uint256 public count;

    function add() external {
        count += 1;
    }
}

contract AStore2 {
    address _implementation;
    uint256 public count;

    function add() external {
        count += 100;
    }
}