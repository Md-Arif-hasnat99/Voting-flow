VotingSystem Smart Contract
===========================

Overview:
---------
The VotingSystem smart contract is a simple yet functional on-chain voting
mechanism that enables decentralized proposal management and decision-making.

It allows a contract owner to create proposals, while community members can vote
once per proposal. The contract handles vote tracking, enforces single-vote rules,
and supports proposal closing when decisions are finalized.

Purpose / Motivation:
---------------------
- Demonstrate Solidity skills: structs, mappings, modifiers, events, access control.
- Provide a foundational framework for on-chain DAO voting mechanisms.
- Encourage community-based decision-making in decentralized applications.

Use Cases:
----------
- DAO proposal voting
- Community polls (e.g., feature requests, governance decisions)
- On-chain voting demos for blockchain education
- Bootstrapping community engagement tools

Key Features:
-------------
✅ Proposal creation by owner  
✅ One address = one vote per proposal  
✅ Track vote count and status (open/closed)  
✅ Prevent duplicate voting  
✅ Transparent event logging for off-chain indexing  
✅ Publicly accessible proposal data  

Smart Contract Details:
-----------------------
- Name: VotingSystem
- Solidity Version: ^0.8.19
- SPDX License: MIT

Storage Structures:
-------------------
Structs:
- Proposal:
  - string description
  - uint256 voteCount
  - bool active

State Variables:
- address public owner
- Proposal[] public proposals
- mapping(uint256 => mapping(address => bool)) public hasVoted

Modifiers:
- onlyOwner: Restricts functions to the contract owner
- proposalExists: Validates proposal ID

Events:
-------
- ProposalCreated(proposalId, description)
- Voted(voter, proposalId)
- ProposalClosed(proposalId, voteCount)

Functions:
----------
1. constructor():
   Initializes the contract owner as the deployer.

2. createProposal(string calldata description):
   Adds a new active proposal. Emits ProposalCreated.
   Only the contract owner can call this function.

3. vote(uint256 proposalId):
   Allows any user to vote on a valid, active proposal.
   Users can vote only once per proposal.
   Emits Voted.

4. closeProposal(uint256 proposalId):
   Closes the proposal, preventing further votes.
   Only the contract owner can call this.
   Emits ProposalClosed.

5. getProposalCount():
   Returns the number of proposals created.

6. getProposal(uint256 proposalId):
   Returns the description, vote count, and active status of a proposal.

Example Workflow:
-----------------
1. Owner creates a proposal:
   -> createProposal("Should we enable staking rewards?");

2. Community members vote:
   -> vote(0);

3. Owner ends voting:
   -> closeProposal(0);

4. Results can be queried:
   -> getProposal(0);

Deployment Instructions:
------------------------
1. Compile the contract using Hardhat, Remix, or Foundry.
2. Deploy to a supported network (e.g., Sepolia, Goerli, Polygon, etc.)
3. For verification, use tools like:
   - Sourcify (if chain is supported)
   - Etherscan/Polygonscan verification UI
   - Hardhat or Foundry’s built-in verification scripts

⚠️ If you see: “Sourcify verification failed: Chain 545 not found”,
then you're likely using an unsupported/custom chain. Use manual verification or switch to a supported testnet.

Security Considerations:
------------------------
- Only the owner can create and close proposals.
- Contract does not include time-based voting limits (can be added).
- Voting is not anonymous—votes are tied to addresses.
- No protection against Sybil attacks (can be mitigated with token-based voting).

Ideas for Improvement:
----------------------
- Add voting deadlines
- Token-weighted voting (1 token = 1 vote)
- Proposal result types (YES/NO or multiple choices)
- Anonymous voting via ZK proofs
- Role-based access control for proposal creation

License:
--------
This project is licensed under the MIT License.

Author:
-------
- [Your Name or GitHub Profile]

