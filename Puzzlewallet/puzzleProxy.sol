// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract PuzzleProxy {

    address public pendingAdmin; // slot 0
    address public admin;        // slot 1

    constructor(address _admin, address _implementation) public {
        admin = _admin;
        (bool success, ) = _implementation.delegatecall(
            abi.encodeWithSignature("init(uint256)", 100 ether)
        );
        require(success, "Initialization failed");
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    function proposeNewAdmin(address _newAdmin) external {
        pendingAdmin = _newAdmin;
    }

    function approveNewAdmin(address _expectedAdmin) external onlyAdmin {
        require(pendingAdmin == _expectedAdmin, "Wrong admin");
        admin = pendingAdmin;
    }

    fallback() external payable {
        (bool success, ) = admin.delegatecall(msg.data);
        require(success, "Delegatecall failed");
    }

    receive() external payable {}
}

