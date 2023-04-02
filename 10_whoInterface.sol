// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

interface IWho {
    function msg_sender() external view returns (address);
    function tx_origin() external view returns (address);
    function callMe() external;
}

contract CallWho {
    address public msg_sender;
    address public tx_origin;

    function callMe(address _whoContractAddress) external {
        IWho(_whoContractAddress).callMe();
        // 此交易的發起者
        msg_sender = IWho(_whoContractAddress).msg_sender();    // 0xC3Ba5050Ec45990f76474163c5bA673c244aaECA
        // 此交易發起的源頭者
        tx_origin = IWho(_whoContractAddress).tx_origin();      // 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
    }
}