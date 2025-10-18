🗳️ VotingSystem Smart Contract
=============================

A lightweight, transparent on-chain voting mechanism designed for decentralized communities, DAOs, or blockchain demos.

📌 Project Overview
-------------------
The **VotingSystem** smart contract enables the owner to create proposals while allowing users to vote once per proposal. Each vote is recorded on-chain and can be tallied publicly. Once voting is complete, proposals can be closed by the owner.

🔁 Voting is:
- Transparent ✅
- Immutable ✅
- Permissionless for voters ✅

🌐 Network Info
---------------
🧪 **Built On:** Flow EVM Testnet  
📬 **Contract Address:** `0xf7F4E558180c554522ae3b657C2697aBEf175346`  

You can interact with the contract using your preferred EVM-compatible wallet and tools like Remix, Metamask, or Hardhat on the Flow EVM Testnet RPC.

🧰 Tech Stack Used
-------------------
- 💻 **Solidity** `^0.8.19`
- 🔗 **Flow EVM Testnet** (Ethereum-compatible)
- 🔨 **Remix IDE / Hardhat / Foundry**
- 📦 **OpenZeppelin (optional)** – for access control and utilities
- 🔍 **Sourcify / Blockscout** – for contract verification

🧠 Core Features
----------------
- 👑 Owner can create and close proposals
- 🙋 Public can vote (once per proposal)
- 🧾 Votes and proposals are logged with events
- 📊 Anyone can view proposal status and results
- 🚫 Duplicate voting is prevented

🧱 Smart Contract Architecture
-----------------------------
🗂️ `struct Proposal`:  
- `description`: `string`  
- `voteCount`: `uint256`  
- `active`: `bool`

📌 State Variables:
- `Proposal[] public proposals`
- `mapping(uint256 => mapping(address => bool)) public hasVoted`
- `address public owner`

🔧 Functions:
- `createProposal(string description)`
- `vote(uint256 proposalId)`
- `closeProposal(uint256 proposalId)`
- `getProposal(uint256 proposalId)`
- `getProposalCount()`

📢 Events:
- `ProposalCreated`
- `Voted`
- `ProposalClosed`

🌱 Future Improvements
----------------------
✨ Time-based voting deadlines  
✨ Token-weighted voting (1 token = 1 vote)  
✨ Role-based proposal permissions  
✨ Commit-reveal voting (for privacy)  
✨ UI frontend (React + Ethers.js / Wagmi + Viem)  
✨ IPFS support for decentralized proposal metadata  

📜 License
----------
MIT License — free to use, modify, and distribute.

👤 Author
---------
Created by Md Arif Hasnat  
Contract deployed at:  
🔗 `0xf7F4E558180c554522ae3b657C2697aBEf175346` (Flow EVM Testnet)

---

🚀 Feel free to fork, contribute, or integrate this into your dApp!
