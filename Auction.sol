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
}