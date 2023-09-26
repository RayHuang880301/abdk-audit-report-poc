// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

import "forge-std/console.sol";

contract PocCVF2 {
    uint256 constant EVACUATION_CHUNK_SIZE = 2;
    error InvalidChunkIdDelta(uint16[] chunkIdDeltas);

    function beforeAudit(uint16[] calldata chunkIdDeltas) external view {
        uint256 chunkIdDeltaLength = chunkIdDeltas.length;
        if (chunkIdDeltaLength != 0 && chunkIdDeltas[0] != 0) revert InvalidChunkIdDelta(chunkIdDeltas);

        /* ========== Gas Test Start ========== */
        uint256 gas = gasleft();
        for (uint256 i = 1; i < chunkIdDeltaLength; ++i) {
            if(chunkIdDeltas[i] != EVACUATION_CHUNK_SIZE) revert InvalidChunkIdDelta(chunkIdDeltas);
        }
        console.log("gas used: %d", gas - gasleft());
        /* ========== Gas Test End ========== */
    }

    function afterAudit(uint16[] calldata chunkIdDeltas) external view {
        uint256 chunkIdDeltaLength = chunkIdDeltas.length;
        if (chunkIdDeltaLength != 0 && chunkIdDeltas[0] != 0) revert InvalidChunkIdDelta(chunkIdDeltas);

        /* ========== Gas Test Start ========== */
        uint256 gas = gasleft();
        uint256 andDeltas = EVACUATION_CHUNK_SIZE;
        uint256 orDeltas = EVACUATION_CHUNK_SIZE;
        uint256 chunkIdDelta;
        for (uint256 i = 1; i < chunkIdDeltaLength; ++i) {
            chunkIdDelta = chunkIdDeltas[i];
            andDeltas &= chunkIdDelta;
            orDeltas |= chunkIdDelta;
        }
        if (andDeltas != orDeltas) revert InvalidChunkIdDelta(chunkIdDeltas);
        console.log("gas used: %d", gas - gasleft());
        /* ========== Gas Test End ========== */
    }
}
