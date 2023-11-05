pragma solidity >= 0.4.22 < 0.9.0;

contract Purchase {
    address public owner;

    constructor() payable{
        owner = msg.sender;
    }
    modifier onlyOwner() {
        require (msg.sender == owner,
        "Only owner can call this."
    );

    _;
    }

     function sendMoney() onlyOwner {
         msg.sender.transfer(this.balance);
     }
}
