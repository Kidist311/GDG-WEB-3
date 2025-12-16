// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Task2 {
    uint public number;
    string private message = "Hello GDG AASTU!";
    bool public isActive = true;

    function setNumber(uint newNumber) public {
        number = newNumber;
    }

    function getMessage() public view returns (string memory) {
        return message;
    }

    function add(uint a, uint b) public pure returns (uint) {
        return a + b;
    }

    function toggleActive() public {
        isActive = !isActive;
    }

    function isNumberBig() public view returns (bool) {
        return number > 10;
    }
}
