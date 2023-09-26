// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {PocCVF6} from "../src/PocCVF6.sol";

contract PocCVF6Test is Test {
    PocCVF6 public pocCVF6;

    function setUp() public {
        pocCVF6 = new PocCVF6();
    }

    function testBeforeAudit() public view {
        pocCVF6.beforeAudit();
    }

    function testAfterAudit() public view {
        pocCVF6.afterAudit();
    }
}
