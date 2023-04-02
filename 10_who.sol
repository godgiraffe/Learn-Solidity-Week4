// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;


contract who {
    address public msg_sender;
    address public tx_origin;

    function callMe() external {
        msg_sender = msg.sender;
        tx_origin = tx.origin;
    }
}