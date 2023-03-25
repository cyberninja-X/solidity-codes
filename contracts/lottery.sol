// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Lottery {
    address public manager;
    address payable[] public players;

    constructor () {
        manager = msg.sender;
    }

    function enter() public payable {
        require(msg.value >= 0.1 ether);
        players.push(payable(msg.sender));
    }
    function random() public view returns (uint) {
        uint blockNumber = block.number - 1;
        bytes32 blockHash = blockhash(blockNumber);
        return uint(keccak256(abi.encodePacked(blockHash, players, block.timestamp, block.prevrandao)));
    }


    function pickWinner() public manager_allowed{
        
        require(players.length > 0);
        uint index = random() % players.length;
        players[index].transfer(address(this).balance);
        players = new address payable [](0); // Reset the player array
    }
    modifier manager_allowed()
    {
        require(msg.sender==manager);
        _;
    }
}
