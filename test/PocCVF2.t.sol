// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {PocCVF2} from "../src/PocCVF2.sol";

contract PocCVF2Test is Test {
    PocCVF2 public pocCVF2;
    // uint16[] chunkIdDeltas = [0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2];
    uint16[] chunkIdDeltas = [0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2];

    function setUp() public {
        pocCVF2 = new PocCVF2();
    }

    function testBeforeAudit() public view {
        pocCVF2.beforeAudit(chunkIdDeltas);
    }

    function testAfterAudit() public view {
        pocCVF2.afterAudit(chunkIdDeltas);
    }
}
