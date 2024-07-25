// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IERC721Account} from './IERC721Account.sol';
import {ERC721Holder} from '@openzeppelin/contracts/token/ERC721/utils/ERC721Holder.sol';
import {IERC721} from '@openzeppelin/contracts/token/ERC721/IERC721.sol';

abstract contract ERC721Account is ERC721Holder, IERC721Account {
    function approveERC721(IERC721 tokenContract, address spender, uint256 tokenId) public virtual {
        tokenContract.approve(spender, tokenId);
    }

    function approveAllERC721(IERC721 tokenContract, address spender) public virtual {
        tokenContract.setApprovalForAll(spender, true);
    }

    function removeApproveAllERC721(IERC721 tokenContract, address spender) public virtual {
        tokenContract.setApprovalForAll(spender, false);
    }

    function isApprovedForAllERC721(IERC721 tokenContract, address spender) public view virtual returns (bool) {
        return tokenContract.isApprovedForAll(address(this), spender);
    }

    function balanceERC721(IERC721 tokenContract) public view virtual returns(uint256) {
        return tokenContract.balanceOf(address(this));
    }

    function transferERC721(IERC721 tokenContract, address to, uint256 tokenId) public virtual {
        tokenContract.safeTransferFrom(address(this), to, tokenId);
    }
}