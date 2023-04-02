// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

interface IERC20 {
    // 該 ERC20 的總供應量
    function totalSupply() external view returns (uint256);

    // 讀取 tokenOwner 這個 address 所持有的 Token 數量
    function balanceOf(address tokenOwner) external view returns (uint256 balance);

    // erc20 的 token owner，可以調用 transfer 來轉移他的 erc20 token.
    function transfer(address to, uint256 amount) external returns (bool success);

    // 可以調用 allowance 來查詢 某 token owner 允許 某地址，花他多少 erc20 token，還剩多少扣打
    function allowance(address tokenOwner, address spender) external view returns (uint256 remaining);

    // erc20 的 token owner，可以批准某個地址，來花費他的多少扣打的 erc20 token
    function approve(address spender, uint256 amount) external returns (bool success);

    // 被 token owner 允許的那個人，可以調用 transferFrom 來轉移 token owner 的 erc20 token
    function transferFrom(address from, address to, uint256 amount) external returns (bool success);

    event Transfer(address indexed from, address indexed to, uint256 amount);
    event Approval(address indexed owner, address indexed spender, uint256 amount);
}

contract ERC20 is IERC20 {
    uint256 public totalSupply; // 該 ERC20 token 的總供應量
    mapping(address => uint256) public balanceOf;   // 查詢 address 所持有的 Token 數量
    mapping(address => mapping(address => uint256)) public allowance;   // 查詢 某 token owner 允許 某地址，花他多少 erc20 token，還剩多少扣打
    string public name = "LL Token"; // token name
    string public symbol = "LT"; // token symbol
    uint8 public decimals = 18; // 小數點後有 18 個零

    // erc20 的 token owner，可以調用 transfer 來轉移他的 erc20 token.
    function transfer(address to, uint256 amount)
        external
        returns (bool success)
    {
        balanceOf[msg.sender] -= amount;
        balanceOf[to] += amount;
        emit Transfer(msg.sender, to, amount);
        return true;
    }

    // erc20 的 token owner，可以批准某個地址，來花費他的多少扣打的 erc20 token
    function approve(address spender, uint256 amount)
        external
        returns (bool success)
    {
        allowance[msg.sender][spender] = amount; // msg.sender 允許 spender 花費 amount 個 ERC20 token
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    // 被 token owner 允許的那個人，可以調用 transferFrom 來轉移 token owner 的 erc20 token
    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) external returns (bool success) {
        // 在 solidity 0.8 中，overflow & underflow 都會使程式出錯
        // 所以，如果 msg.sender 沒有被允許使用 erc20 token 的話，這行就會執行失敗
        allowance[from][msg.sender] -= amount;
        balanceOf[from] -= amount;
        balanceOf[to] += amount;
        emit Transfer(from, to, amount);
        return true;
    }

    function mint(uint256 amount) external {
        balanceOf[msg.sender] += amount;
        totalSupply += amount;
        emit Transfer(address(0), msg.sender, amount);
    }

    function burn(uint256 amount) external {
        balanceOf[msg.sender] -= amount;
        totalSupply -= amount;
        emit Transfer(msg.sender, address(0), amount);
    }
}
