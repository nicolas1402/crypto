// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;


contract TicketManager {
        uint256 price; 
        address owner;
        mapping(address => bool) tickets;

        constructor (uint256 _price){
            price = _price;
            onwer = _owner;
         }
    
        function setPrice(uint256 newPrice) public onlyOwner {
            price = newPrice;
        }

        modifier onlyowner() {
            require(msg.sender == owner, "Unauthorized");
            _;
        }

        function buyTicket() payable public {
            //require the money sent to be the correct value

            require(price == msg.value, "The price is incorrect");
            //set mapping of the person that buys the ticket to true
            tickets[msg.sender]=true;
        }

    function hasTicket(address person) public view returns (bool) {
    return tickets[person];
    }



}