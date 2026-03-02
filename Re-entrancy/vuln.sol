function withdraw(uint _amount) public {
    if(balances[msg.sender] >= _amount) { // Check if the sender has enough to send)
    msg.sender.call{value: _amount} (""); // Send the amount to the sender
    balances{msg.sender} -=_amount;
}
