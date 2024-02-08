//SPDX-License-Identifier:MIT

pragma solidity ^0.8.18;

import {Script} from 'forge-std/Script.sol';
import {HelperConfig} from './HelperConfig.s.sol';
import {Fund} from '../src/Fund.sol';

contract DeployFund is Script{
    HelperConfig helperConfig = new HelperConfig();
    address ethUsdPrice = helperConfig.activeNetworkConfig();

    function run() external returns (Fund){
        vm.startBroadcast();
        Fund fund = new Fund(ethUsdPrice);
        vm.stopBroadcast();
        return fund;
    }
}