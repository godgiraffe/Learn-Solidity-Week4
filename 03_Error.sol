// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

// 執行 function 中，三種拋出錯誤的方式
// reqire, revert, assert
// 執行交易中，拋出錯誤的話，
// - unused gas 會被返回
// - state update are rverted 任何狀態的更新，會被恢復
// 可使用 custom error ->  save gas
contract Error {
    function testRequire(uint256 _i) public pure {
        require(_i <= 10, "i > 10");
    }

    function testRevert(uint256 _i) public pure {
        if (_i > 10) {
            revert("i > 10");
        }
    }

    function testManyIfRequire(uint256 _i) public pure {
        if (_i > 1{

        })
    }

    function testManyIfRevert(uint256 _i) public pure {
        if (_i > 1){
            // code
            if (_i >2){
                // more code
                if (_i > 10){
                    // 為什麼在這邊使用 revert 會是比較好選擇呢？
                    // 在這邊也可以使用 require 呀
                    revert("i > 10");
                }
            }
        }
    }

    // 用於檢查某個變數的值，有無發生例外狀況 ( 什麼是例外狀況，需自定義 )
    // 以下範例，定義當 num == 123 時，才是正常狀況
    uint256 public num = 123;
    function testAssert() public view {
        assert(num == 123);
    }

    error MyError(address caller, uint256 i);

    function testCustomError(uint256 _i) public view {
        if (_i > 10) {
            revert MyError(msg.sender, _i);
        }
    }
}
