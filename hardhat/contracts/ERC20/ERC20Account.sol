// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IERC20Account} from './IERC20Account.sol';
import {IERC20} from '@openzeppelin/contracts/token/ERC20/IERC20.sol';

abstract contract ERC20Account is IERC20Account {
    function allowanceERC20(IERC20 tokenContract, address spender) public view virtual returns(uint256) {
        return tokenContract.allowance(address(this), spender);
    }

    function approveERC20(IERC20 tokenContract, address spender, uint256 value) public virtual returns(bool) {
        return tokenContract.approve(spender, value);
    }

    function balanceERC20(IERC20 tokenContract) public view virtual returns(uint256) {
        return tokenContract.balanceOf(address(this));
    }

    function transferERC20(IERC20 tokenContract, address to, uint256 amount) public virtual returns(bool) {
        return tokenContract.transfer(to, amount);
    }
}
