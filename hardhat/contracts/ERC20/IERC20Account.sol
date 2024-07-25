// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IERC20} from '@openzeppelin/contracts/token/ERC20/IERC20.sol';

interface IERC20Account {
    function allowanceERC20(IERC20 tokenContract, address spender) external view returns(uint256);
    function approveERC20(IERC20 tokenContract, address spender, uint256 value) external returns(bool);
    function balanceERC20(IERC20 tokenContract) external view returns(uint256);
    function transferERC20(IERC20 tokenContract, address to, uint256 amount) external returns(bool);
}