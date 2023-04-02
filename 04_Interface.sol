// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

// 通常接口名稱為 I + 合約名稱
interface ICounter {
    function count() external view returns (uint);
    function inc() external;
    function dec() external;
}

contract CallInterface {
    uint public count;

    // address = 要調用的合約地址
    function examples(address _counter) external {
        ICounter(_counter).inc();
        count = ICounter(_counter).count();
    }

    function counterInc(address _counterContractAddress) external {
        ICounter(_counterContractAddress).inc();
        // 執行完上面 function 後，要把調用合約的 count, 存至本合約的 count 裡
        // 因為，本合約只能讀到 自己合約內的變數
        count = ICounter(_counterContractAddress).count();
    }

    function counterDec(address _counterContractAddress) external {
        ICounter(_counterContractAddress).dec();
        count = ICounter(_counterContractAddress).count();
    }
}