pragma solidity ^0.7.0;
contract victim{
    mapping(address => uint) public balances;

    function deposit() public payable{
        require(msg.value > 0 , "Insufficient amount to deposit");
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint amount) public payable{
        require(balances[msg.sender] >= amount , "Insufficient balance to withdraw");
        (bool sent, ) = msg.sender.call{value: amount}("");
        require(sent, "failed");
        balances[msg.sender] -= amount;
    }

    function getBalance(address addr) public view returns(uint){
        return balances[addr];
    }
}
