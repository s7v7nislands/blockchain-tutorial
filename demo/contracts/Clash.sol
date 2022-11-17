// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract Foo {
    function collate_propagate_storage(bytes16) external { }

    // fixme: selector clash
    // function burn(uint256) external { }
}