// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Buyer {
    function price() external view returns(uint);
}
contract shop {
    uint public price = 100;
    bool public isSold;

    function buy() public {
        Buyer buyer = Buyer (msg.sender);

        if (buyer.price() >= price && isSold){
            isSold = true;
            price = buyer.price ();

        }
    }
}
