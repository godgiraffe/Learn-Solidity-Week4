// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

// Library
library Math {
    // library 內部不能 declare state variables
    function max(uint x, uint y) internal pure returns (uint) {
        return x >=y ? x : y;
    }
}

contract Test {
    function testMax( uint x, uint y) external pure returns (uint) {
        return Math.max(x, y);
    }
}

library ArrayLib {
    function find(uint[] storage arr, uint x) internal view returns(uint) {
        for (uint i = 0; i < arr.length; i++){
            if (arr[i] == x) {
                return i;
            }
        }
        revert("not found");
    }
}

contract TestArray {
    using ArrayLib for uint[];  // 讓 uint[] 型態的變數，能直接使用 ArrayLib 裡的 function
    uint[] public arr = [3, 2, 1];

    function TestFind() external view returns (uint i) {
        // return ArrayLib.find(arr, 2);
        arr.find(2);    // 有寫 using 那行才能這樣用
    }
}