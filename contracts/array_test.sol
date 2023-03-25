// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract ArrayTest{
    uint[] public myArray;
    constructor(){
        myArray.push(1);
        myArray.push(2);
        myArray.push(3);

    }
    function getMyArray()public view returns(uint[] memory){
        return myArray;
    }
    function getArrayLength() public view returns(uint){
        return myArray.length;
    }
    function getFirstElement() public view returns(uint){
        return myArray[2];
    }
}


