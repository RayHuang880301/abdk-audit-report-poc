// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;
import "forge-std/console.sol";

contract PocCVF9 {
    error InvalidEvacuBlockPubData(uint256 evacuationRequestNum);

    function beforeAudit() external pure {
        bytes4 errorSelector = InvalidEvacuBlockPubData.selector;
        uint256 mockEvacuationRequestNum = 0;
        bool data = true;
        assembly {
            // if data is not zero, revert
            if data {
                let ptr := mload(0x40)
                mstore(ptr, errorSelector)
                mstore(add(ptr, 0x04), mockEvacuationRequestNum)
                revert(ptr, 0x24)
            }
        }
    }

    
    function afterAudit() external pure {
        bytes4 errorSelector = InvalidEvacuBlockPubData.selector;
        uint256 mockEvacuationRequestNum = 0;
        bool data = true;
        assembly {
            // if data is not zero, revert
            if data {
                mstore(0x00, errorSelector)
                mstore(0x04, mockEvacuationRequestNum)
                revert(0x00, 0x24)
            }
        }
    }
}