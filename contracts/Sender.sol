// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

contract voting {
    struct proposal {
        uint256 id;
        string description;
        uint256 voteCount;
    }
    // mapping (address => voter) voters;
    mapping(address => bool) hasVoted;
    mapping(uint256 => proposal) public proposals;
    uint256 proposalCount;

    event proposalCreated(uint256 indexed proposalId, string description);
    event voted(address indexed voter, uint256 indexed proposal);

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier isOwner() {
        require(msg.sender == owner, "Only Owner can execute this");
        _;
    }
    modifier canVote() {
        require(hasVoted[msg.sender] == false, "You can only vote once");
        _;
    }

    function createProposal(string memory description) public isOwner {
        proposals[proposalCount] = proposal(proposalCount, description, 0);
        emit proposalCreated(proposalCount, description);
        proposalCount++;
    }

    function vote(uint256 proposalId) public canVote {
        require(proposalId < proposalCount, "Invalid Proposal Id");
        proposals[proposalId].voteCount++;
        hasVoted[msg.sender] = true;
        emit voted(msg.sender, proposalId);
    }

    function getProposal(
        uint256 id
    )
        public view
        returns (
            proposal memory
        )
    {
        return (proposals[id]);
    }

    function getTotalProposals() public view returns (uint256){
        return proposalCount;
    }
}
