// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;


contract BytesUsage {
    bytes public bs = "12345";
    bytes1 public bs1 = "1";
    bytes2 public bs2 = "12";


    function getBs() external view returns(bytes memory){
        return bs;
    }
    
    function getBs1() external view returns(bytes1){
        return bs1;
    }
    
    function getBs2() external view returns(bytes2){
        return bs2;
    }

    function setBs() external returns(bytes memory, bytes1, bytes2){
        bs = '3345678';
        bs1 = "3";
        bs2 = "33";
        return (bs, bs1, bs2);
    }

    function argIsStorage(bytes1 _bs1) external pure returns(bytes1){
        return _bs1;
    }

    function argIsMemory(bytes1 _bs1) external pure returns(bytes1){
        _bs1 = '3';
        return _bs1;
    }
    
}