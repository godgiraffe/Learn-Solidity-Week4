// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;


contract S {
    string public name;
    
    constructor(string memory _name){
        name = _name;
    }
}

contract T {
    string public text;

    constructor(string memory _text){
        text = _text;
    }
}


// U 繼承了 S 跟 T，直接在繼承的地方，加上 constructor, 所需參數
contract U is S("s"), T("t"){

}


// V 繼承了 S 跟 T，在 V constructor 時, 補上 S、T constructor 時需要的參數
contract V is S, T {
    constructor(string memory _name, string memory _text) S(_name) T(_text){

    }
}

// VV 繼承了 S 跟 T，代入 constructor 的參數，可混用以上兩種作法
contract VV is S("s"), T {
    constructor(string memory _name) T(_name){

    }
}

// 執行順序為 S → T → V0
contract V0 is S, T {
    constructor(string memory _name, string memory _text) S(_name) T(_text){

    }
}


// 執行順序為 S → T → V1
contract V1 is S, T {
    constructor(string memory _name, string memory _text) T(_text) S(_name){

    }
}


// 執行順序為 T → S → V2
contract V2 is T, S {
    constructor(string memory _name, string memory _text) T(_text) S(_name){

    }
}

// 執行順序為 T → S → V3
contract V3 is T, S {
    constructor(string memory _name, string memory _text) S(_text) T(_name){

    }
}

// 結論
// 執行順序會被↓  ↓  的順序給影響，會先執行先繼承到的 
contract R is T, S {                                     // 這邊的順序↓ 怎麼擺都不會影響執行順序
    constructor(string memory _name, string memory _text) S(_text) T(_name){

    }
}