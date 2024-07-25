// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {ERC20Account} from './ERC20/ERC20Account.sol';
import {ERC721Account} from './ERC721/ERC721Account.sol';
import {IERC20} from '@openzeppelin/contracts/token/ERC20/IERC20.sol';
import {IERC721} from '@openzeppelin/contracts/token/ERC721/IERC721.sol';
import {Ownable} from '@openzeppelin/contracts/access/Ownable.sol';

contract Account is ERC20Account, ERC721Account, Ownable {
    constructor(address owner) Ownable(owner) {
    }

    function approveERC20(IERC20 tokenContract, address spender, uint256 value) public override onlyOwner returns(bool) {
        return ERC20Account.approveERC20(tokenContract, spender, value);
    }

    function transferERC20(IERC20 tokenContract, address to, uint256 amount) public override onlyOwner returns(bool) {
        return ERC20Account.transferERC20(tokenContract, to, amount);
    }

    function approveERC721(IERC721 tokenContract, address spender, uint256 tokenId) public override onlyOwner {
        ERC721Account.approveERC721(tokenContract, spender, tokenId);
    }

    function approveAllERC721(IERC721 tokenContract, address spender) public override onlyOwner {
        ERC721Account.approveAllERC721(tokenContract, spender);
    }

    function removeApproveAllERC721(IERC721 tokenContract, address spender) public override onlyOwner {
        ERC721Account.removeApproveAllERC721(tokenContract, spender);
    }

    function transferERC721(IERC721 tokenContract, address to, uint256 tokenId) public override onlyOwner {
        ERC721Account.transferERC721(tokenContract, to, tokenId);
    }
}