// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {PocCVF9} from "../src/PocCVF9.sol";

contract PocCVF9Test is Test {
    PocCVF9 public pocCVF9;

    function setUp() public {
        pocCVF9 = new PocCVF9();
    }

    function testFailBeforeAudit() public view {
        pocCVF9.beforeAudit();
    }

    function testFailAfterAudit() public view {
        pocCVF9.afterAudit();
    }
}
