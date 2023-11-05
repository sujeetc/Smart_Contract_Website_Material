function revoke() { // Insecure
    uint256 value = balances[msg.sender];
    require(msg.sender.call.value(value) ());
    balances[msg.sender] = 0;
} 

function revoke() { // Secure
    uint256 value = balances[msg.sender];
    balances[msg.sender] = 0;
    require(msg.sender.call.value(value) ());
}
