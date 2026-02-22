This repository contains my solutions and security analysis for the
**Ethernaut** smart contract wargame by OpenZeppelin.

The goal of this repo is not just to solve levels, but to document:
- Real-world vulnerability patterns
- Root causes and exploit paths
- Practical prevention strategies

Each level is treated as a **mini audit finding**.

---

## 🎯 Objectives

- Develop strong intuition for smart contract vulnerabilities
- Practice exploit development with minimal helper contracts
- Write clear, reproducible security explanations
- Build a public portfolio aligned with professional audit standards

---

## 🧠 Methodology

For each level, I follow this process:

1. **Read the contract line by line**
2. Identify:
   - Trust assumptions
   - Authority boundaries
   - External calls
3. Build a **minimal exploit or proof-of-concept**
4. Document:
   - Root cause
   - Exploit strategy
   - Impact
   - Mitigation

If a bug is real, it should be exploitable with **one helper contract**.

---


## 📂 Repository Structure

ethernaut- levels/
├── Fallback/
│ └── README.md
├── Fallout/
│ └── README.md
├── CoinFlip/
│ ├── README.md
│ └── CoinFlipAttack.sol
└── Telephone/
└── README.md


Each folder contains:
- A level-specific `README.md`
- Exploit contracts (if applicable)

---

## 🛠 Tools Used

- Solidity
- Remix IDE
- MetaMask (Sepolia)
- Foundry (for PoCs where applicable)

---

## 📌 Notes

- This repository focuses on **learning and documentation**
- No mainnet contracts or real funds are involved
- All exploits are demonstrated in controlled environments

---

## 📫 Contact

- GitHub: https://github.com/Duncan254-u

