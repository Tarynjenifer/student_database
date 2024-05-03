//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentDatabase {
    struct Student {
        string name;
        uint256 age;
        string department;
    }

    mapping(uint256 => Student) public students;

    event StudentAdded(uint256 rollNumber, string name, uint256 age, string department);
    event StudentUpdated(uint256 rollNumber, string name, uint256 age, string department);

    function addStudent(uint256 _rollNumber, string memory _name, uint256 _age, string memory _department) public {
        students[_rollNumber] = Student(_name, _age, _department);
        emit StudentAdded(_rollNumber, _name, _age, _department);
    }

    function getStudent(uint256 _rollNumber) public view returns (string memory, uint256, string memory) {
        Student memory student = students[_rollNumber];
        return (student.name, student.age, student.department);
    }

    function updateStudent(uint256 _rollNumber, string memory _name, uint256 _age, string memory _department) public {
            addStudent(_rollNumber, _name, _age, _department);
        }
}