# Ethernaut Level: CoinFlip

## Vulnerability Summary
The contract relies on block variables to generate randomness, making the outcome
predictable and exploitable by an attacker.

---

## Root Cause
The contract derives randomness from `blockhash(block.number - 1)`, which is
deterministic at execution time and can be reproduced by any contract in the same
block.

---

## Exploit Strategy
An attacker contract computes the same value used by the target contract and submits
the correct guess every time. Since both computations occur in the same block, the
result is always known in advance.

---

## Proof of Concept
A minimal helper contract computes the coin flip result using the same logic and calls
the `flip()` function with the correct guess once per block.

```solidity
uint256 blockValue = uint256(blockhash(block.number - 1));
uint256 coinFlip = blockValue / FACTOR;
bool guess = coinFlip == 1;
