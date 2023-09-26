// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;
import "forge-std/console.sol";

contract PocCVF6 {
    uint64 mockExecutedL1RequestNum = 10;
    uint64 mockTotalL1RequestNum = 15;
    MockOpType mockLastOpType = MockOpType.EVACUATION;
    enum MockOpType {
        EVACUATION
    }
    error NotConsumedAllL1Requests(uint64 executedL1RequestNum, uint64 totalL1RequestNum);

    function beforeAudit() external view {
        uint64 executedL1RequestNum = mockExecutedL1RequestNum;
        uint64 totalL1RequestNum = mockTotalL1RequestNum;

        /* ========== Gas Test Start ========== */
        uint256 gas = gasleft();
        bool isExecutedL1RequestNumEqualToTotalL1RequestNum = executedL1RequestNum == totalL1RequestNum;
        bool isLastL1RequestEvacuation = mockLastOpType == MockOpType.EVACUATION;
        if (!isExecutedL1RequestNumEqualToTotalL1RequestNum && !isLastL1RequestEvacuation)
            revert NotConsumedAllL1Requests(executedL1RequestNum, totalL1RequestNum);
        console.log("gas used: %d", gas - gasleft()); // 310 wei
        /* ========== Gas Test End ========== */
    }

    function afterAudit() external view {
        uint64 executedL1RequestNum = mockExecutedL1RequestNum;
        uint64 totalL1RequestNum = mockTotalL1RequestNum;

        /* ========== Gas Test Start ========== */
        uint256 gas = gasleft();
        if (executedL1RequestNum != totalL1RequestNum) {
            bool isLastL1RequestEvacuation = mockLastOpType == MockOpType.EVACUATION;
            if (!isLastL1RequestEvacuation) revert NotConsumedAllL1Requests(executedL1RequestNum, totalL1RequestNum);
        }
        console.log("gas used: %d", gas - gasleft()); // 289 wei
        /* ========== Gas Test End ========== */
    }
}

