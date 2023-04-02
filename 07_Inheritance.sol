// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;


contract A {
    function foo() public pure virtual returns (string memory) {
        return "A";
    }

    function baz() public pure virtual returns (string memory) {
        return "A";
    }
}

// 當B 繼承 A 時，自動就會有 A 的所有 function
// 如果想在 子合約，修改父合約的 function 時，父合約的 function 必須帶有 "virtual" 屬性
contract B is A {
    function foo() public pure override returns (string memory) {
        return "B";
    }

    function bar() public pure virtual override returns (string memory) {
        return "B";
    }
}

contract C is B {
    function bar() public pure override returns (string memory){
        return "C";
    }
}