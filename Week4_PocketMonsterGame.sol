// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract PocketMonsterGame {
// gen pocketMonster

    // Pocket Monster
    // name, atk, def
    struct PocketMonster {
        string name;
        int atk;
        int def; 
    }

    //PocketMonster[] public PocketMonsters;
    // 宣告一個 [key] = value 的東東
    mapping(address => PocketMonster[]) public PocketMonsters;

    function genPocketMonster(string memory _name) external {
        PocketMonster memory PM; // = PocketMonster("Toyota", 1990, msg.sender);
        PM.name = _name;
        PM.atk = 1;
        PM.def = 1;

        PocketMonsters[msg.sender].push(PM);
    }

    function payToLevelUp(address _owner) external {

    }
}