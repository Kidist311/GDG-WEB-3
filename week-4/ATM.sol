// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ATM {
    address public owner;
    bool public paused;

    mapping(address => uint256) private balances;

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    modifier notPaused() {
        require(!paused, "Contract is paused");
        _;
    }

    constructor() {
        owner = msg.sender;
        paused = false;
    }

    // Deposit ETH
    function deposit() public payable notPaused {
        require(msg.value > 0, "Deposit must be > 0");
        balances[msg.sender] += msg.value;
    }

    // Withdraw ETH
    // Withdraw ETH
function withdraw(uint256 amount) public notPaused {
    require(balances[msg.sender] >= amount, "Insufficient balance");
    balances[msg.sender] -= amount;

    // Modern transfer method
    (bool success, ) = msg.sender.call{value: amount}("");
    require(success, "Transfer failed");
}


    // Check user balance
    function getBalance() public view returns (uint256) {
        return balances[msg.sender];
    }

    // Pause contract (owner only)
    function pause() public onlyOwner {
        paused = true;
    }

    // Unpause contract (owner only)
    function unpause() public onlyOwner {
        paused = false;
    }
}
