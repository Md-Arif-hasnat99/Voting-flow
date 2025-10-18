// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title Voting System
/// @author 
/// @notice Allows users to create proposals and vote on them
contract VotingSystem {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not authorized");
        _;
    }

    modifier proposalExists(uint256 proposalId) {
        require(proposalId < proposals.length, "Proposal does not exist");
        _;
    }

    struct Proposal {
        string description;
        uint256 voteCount;
        bool active;
    }

    Proposal[] public proposals;

    mapping(uint256 => mapping(address => bool)) public hasVoted;

    /// @notice Emitted when a new proposal is created
    event ProposalCreated(uint256 proposalId, string description);

    /// @notice Emitted when a vote is cast
    event Voted(address indexed voter, uint256 indexed proposalId);

    /// @notice Emitted when a proposal is closed
    event ProposalClosed(uint256 proposalId, uint256 voteCount);

    /// @notice Create a new proposal (only owner)
    /// @param description The text description of the proposal
    function createProposal(string calldata description) external onlyOwner {
        proposals.push(Proposal({
            description: description,
            voteCount: 0,
            active: true
        }));

        emit ProposalCreated(proposals.length - 1, description);
    }

    /// @notice Vote on a proposal
    /// @param proposalId The ID of the proposal to vote on
    function vote(uint256 proposalId) external proposalExists(proposalId) {
        Proposal storage proposal = proposals[proposalId];
        require(proposal.active, "Proposal is not active");
        require(!hasVoted[proposalId][msg.sender], "Already voted");

        proposal.voteCount += 1;
        hasVoted[proposalId][msg.sender] = true;

        emit Voted(msg.sender, proposalId);
    }

    /// @notice Close voting on a proposal (only owner)
    /// @param proposalId The ID of the proposal to close
    function closeProposal(uint256 proposalId) external onlyOwner proposalExists(proposalId) {
        Proposal storage proposal = proposals[proposalId];
        require(proposal.active, "Already closed");

        proposal.active = false;

        emit ProposalClosed(proposalId, proposal.voteCount);
    }

    /// @notice Get number of proposals
    function getProposalCount() external view returns (uint256) {
        return proposals.length;
    }

    /// @notice Get proposal details
    function getProposal(uint256 proposalId)
        external
        view
        proposalExists(proposalId)
        returns (string memory description, uint256 voteCount, bool active)
    {
        Proposal memory p = proposals[proposalId];
        return (p.description, p.voteCount, p.active);
    }
}
