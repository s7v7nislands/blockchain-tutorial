// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Sample code, do not use in production!
contract TransparentAdminUpgradeableProxy {
    address implementation;
    address admin;

    fallback() external payable {
        _fallback();
    }

    function _fallback() internal {
        (bool res, ) = implementation.delegatecall(msg.data);
        require(res, "Failed to delegatecall");
    }
    receive() external payable {}

     function upgrade(address newImplementation) external {
        if (msg.sender != admin) _fallback();
        implementation = newImplementation;
    }
}

contract TStore1 {
    address _implementation;
    uint256 public count;

    function add() external {
        count += 1;
    }
}

contract TStore2 {
    address _implementation;
    uint256 public count;

    function add() external {
        count += 100;
    }
}