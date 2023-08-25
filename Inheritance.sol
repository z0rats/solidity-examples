// SPDX-License-Identifier: MIT

pragma solidity 0.8.20;

contract Ownable {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "not an owner!");
        _;
    }

    function withdraw(address payable _to) public virtual onlyOwner {
        payable(owner).transfer(address(this).balance);
    }
}

abstract contract Balances is Ownable {
    function getBalance() public view onlyOwner returns(uint) {
        return address(this).balance;
    }

    function withdraw(address payable _to) public override virtual {
        _to.transfer(getBalance());
    }
}

contract MyContract is Ownable, Balances {
    constructor(address _owner) {
        owner = _owner;
    }

    function withdraw(address payable _to) public override(Ownable, Balances) onlyOwner {
        // Balances.withdraw(_to);
        // Ownable.withdraw(_to);
        super.withdraw(_to);
    }
}