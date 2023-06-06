//SPDX-License-Idendifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract Auction{
    address payable public owner;
    uint public startBlock;
    uint public endBlock;
    string public ipfsHash;

    enum State{Started, Running, Ended, Canceled}
    State public auctionState;

    uint bidIncrement;
    uint public highestBindingBid;
    address payable public highestBidder;

    mapping(address => uint) public bids;


    constructor(){
        owner = payable(msg.sender);
        auctionState = State.Running;

        startBlock = block.number;
        endBlock = startBlock + 40320;
        bidIncrement = 100;
        ipfsHash = "";
    }
    
    modifier onlyOwner(){
        require(owner == msg.sender);
        _;
    }

    modifier notOwner(){
        require(owner != msg.sender);
        _;
    }

    modifier afterStart(){
        require(block.number >= startBlock);
        _;
    }

    modifier beforeEnd(){
        require(block.number <= endBlock);
        _;
    }

    function changeOwner(address _owner) onlyOwner public{
        owner == _owner;
    }



    function placeBid() notOwner afterStart beforeEnd public payable{
        require(auctionState == State.Running);
        require(msg.value >= 100);

        uint currentBid = bids[msg.sender] + msg.value;
        require(currentBid > highestBindingBid);

        bids[msg.sender] = currentBid;

        if(currentBid <= bids[highestBidder]){

        }
    }
}