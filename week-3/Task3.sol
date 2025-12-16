// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

contract Week3Task {

    struct Person {
        string name;
        uint256 favoriteNumber;
    }

    Person[] public people;
    mapping(string => uint256) public nameToFavoriteNumber;

    function addPersonToArray(string memory _name, uint256 _favoriteNumber) public {
        people.push(Person({name: _name, favoriteNumber: _favoriteNumber}));
    }

    function saveToMapping(string calldata _name, uint256 _favoriteNumber) public {
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }

    function updateName(uint256 index, string memory newName) public {
        require(index < people.length, "Index out of bounds");
        Person storage person = people[index];
        person.name = newName;
    }

    function getPerson(uint256 index) public view returns (Person memory) {
        require(index < people.length, "Index out of bounds");
        return people[index];
    }

    function nameExists(string calldata _name) public view returns (bool) {
        return nameToFavoriteNumber[_name] != 0;
    }
}
