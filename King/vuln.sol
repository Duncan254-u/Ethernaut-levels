address public king;
uint public prize;

receive () external payable {
    require(msg.value >= prize || msg.sender == owner);
    payable (king). transfer (msg.value);
    king = msg.sender;
    prize = msg.value;
}
