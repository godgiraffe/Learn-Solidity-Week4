// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract DataLocations {
    struct MyStruct {
        uint foo;
        string text;
    }

    mapping(address => MyStruct) public myStructs;

    // function functionName() internal return (型別 儲存位置)

    function examples(uint[] calldata y, string memory s) external returns (uint[] memory) {
        myStructs[msg.sender] = MyStruct({foo: 123, text: "bar"});

        // 宣告一個型別為 MyStruct 的變數，名為 myStruct,
        // 如果該變數的變動，需留存至此 function 外的話，那需要將儲存位置為 storage
        MyStruct storage myStruct = myStructs[msg.sender];
        myStruct.text = "foo";

        // 如果該變數的變動，只需留存在此 function 內，那將儲存位置設為 memory 即可
        MyStruct memory readOnly = myStructs[msg.sender];
        readOnly.foo = 456;
        
        _internal(y);

        // 建立在 memory 的變數，無法定義為動態長度
        // 建立一個存在 memory 的 uint array，固定長度 3
        uint[] memory memArr = new uint[](3);
        memArr[0] = 234;
        return memArr;
    }


    function _internal(uint[] calldata y) private{
        uint x = y[0];
    }
}