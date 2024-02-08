//SPDX-License-Identifier:MIT

pragma solidity ^0.8.18;

import {Test} from 'forge-std/Test.sol';
import {Fund} from '../../src/Fund.sol';
import {DeployFund} from '../../script/DeployFund.s.sol';

contract FundTest is Test{
    Fund fundme;

    address USER = makeAddr('user');
    uint256 constant SENDVALUE = 0.01 ether;

    function setUp() public{
      DeployFund deployer = new DeployFund();
      fundme = deployer.run();
      vm.deal(USER,10 ether);
    }

    function testCreateCampaign() public{
        vm.prank(USER);
        fundme.createCampaign('Recipe','New Jollof Recipe',100000000,2);
        assertEq(fundme.getCampaignName(USER),'Recipe');
    }

    function testFundCampaign() public{
        vm.prank(USER);
        fundme.createCampaign('Recipe','New Jollof Recipe',100000000,2);
        vm.prank(USER);
        fundme.fundCampaign{value : SENDVALUE}(USER);
        assertEq(fundme.getCampaignBalance(USER),SENDVALUE);
    }
}