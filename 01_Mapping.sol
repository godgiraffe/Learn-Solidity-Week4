// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Mapping {
    // 宣告一個 mapping 名為 balances, 結構為 balances[address] = uint
    // 此為 1對1 的關係，1個 address 只會對應到 1個 uint 值
    mapping(address => uint) public balances;

    // mapping 裡面還有 mapping
    // 此為 1對多 的關係, isFriend[address] 拿到的是一個 mapping
    // 該 mapping 的結構為 [address] = bool
    // 要存取該 mapping 的話，要這樣寫： isFriend[mapping 1 address][mapping 2 address]
    mapping(address => mapping(address => bool)) public isFriend;

    function examples() external {
        // set mapping value
        balances[msg.sender] = 123;

        // get mapping value
        uint bal = balances[msg.sender];

        // ### 這邊的 address(1) 不確定是什麼意思 ###
        uint bal2 = balances[address(1)];    // 因為 沒有設置任何值，所以會返回 uint 的預設值 0


        balances[msg.sender] += 456;    // balances[msg.sender] = balances[msg.sender] + 456

        // reset mapping value
        delete balances[msg.sender];    // 刪除後, balances[msg.sender] 值會是 uint 的預設值 0 

        // ### 這邊的 address(this) 不太確定是什麼意思 ###
        isFriend[msg.sender][address(this)] = true; // 將 isFriend[msg.sender][address(this)] 設為 true
    }
}