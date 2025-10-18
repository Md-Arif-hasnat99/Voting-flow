🗳️ VotingSystem Smart Contract
=============================

A lightweight on-chain voting contract for decentralized communities, DAOs, or educational use.

📌 Overview
-----------
The VotingSystem smart contract lets the **owner** create proposals and allows **users** to vote on them (one vote per user per proposal). Votes are tallied on-chain, and proposals can be closed by the owner once complete.

This is a simple, transparent way to manage blockchain-based decisions.

🎯 Use Cases
------------
- DAO governance proposals
- Feature request polls
- Decentralized decision making
- On-chain voting tutorial / demo project

🚀 Features
-----------
✅ Create proposals (owner only)  
✅ One vote per user per proposal  
✅ Track vote count & proposal status  
✅ Event logging for UI/backend integration  
✅ View proposal details and totals  

🧠 Tech Details
---------------
- 🛠️ **Solidity Version**: ^0.8.19  
- 📜 **License**: MIT  
- 🔐 **Access Control**: `onlyOwner` modifier  
- 💾 **Storage**:
  - `Proposal[] proposals`
  - `mapping(uint256 => mapping(address => bool)) hasVoted`

📦 Structs & Events
--------------------
📦 `struct Proposal`  
- `string description`  
- `uint256 voteCount`  
- `bool active`  

📢 Events  
- `ProposalCreated(uint256 id, string description)`  
- `Voted(address voter, uint256 proposalId)`  
- `ProposalClosed(uint256 id, uint256 voteCount)`  

🔧 Functions
------------
1. 🏗️ `constructor()`  
   → Sets the deploying address as the contract owner.

2. ✍️ `createProposal(string description)`  
   → Creates a new proposal (owner only).

3. 🗳️ `vote(uint256 proposalId)`  
   → Allows any user to vote once on an active proposal.

4. ❌ `closeProposal(uint256 proposalId)`  
   → Closes a proposal to stop further voting (owner only).

5. 🔎 `getProposal(uint256 proposalId)`  
   → View proposal's details: description, vote count, active status.

6. 📊 `getProposalCount()`  
   → Returns total number of proposals created.

👣 How It Works
---------------
1. 👑 Owner creates a proposal:  
   `createProposal("Should we enable feature X?");`

2. 🙋 Users vote on proposal ID 0:  
   `vote(0);`

3. 🧹 Owner ends the vote:  
   `closeProposal(0);`

4. 🔍 Anyone can check results:  
   `getProposal(0);`

🛡️ Security Notes
-----------------
- Only the owner can create or close proposals.
- No time restrictions (deadlines) on voting — consider adding.
- Public voting — votes are tied to wallet addresses.
- No anti-spam/Sybil protections — integrate token-gated voting if needed.

🛠️ Future Improvements
-----------------------
✨ Add voting deadlines  
✨ Anonymous voting (e.g., with ZK or commit-reveal)  
✨ Token-based weighted voting  
✨ Multiple-choice or ranked proposals  
✨ Role-based permissions for proposals

⚠️ Sourcify Verification Tip
----------------------------
If you get the error:
👉 `Sourcify verification failed: Chain 545 not found`

It means the chain you're deploying to isn't recognized by Sourcify (likely a local or custom chain).  
✅ Use a supported network (e.g., Sepolia, Goerli, Polygon)  
✅ Or verify manually using your chain’s block explorer if available

📜 License
----------
MIT License — use freely, modify, and contribute!

👤 Author
---------
Built by [Your Name or GitHub Profile]  
Feel free to fork, build, and suggest improvements 🚀
