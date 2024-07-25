// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IERC721Receiver} from '@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol';
import {IERC721} from '@openzeppelin/contracts/token/ERC721/IERC721.sol';

interface IERC721Account is IERC721Receiver {
    function approveERC721(IERC721 tokenContract, address spender, uint256 tokenId) external;
    function approveAllERC721(IERC721 tokenContract, address spender) external;
    function removeApproveAllERC721(IERC721 tokenContract, address spender) external;
    function isApprovedForAllERC721(IERC721 tokenContract, address spender) external view returns (bool);
    function balanceERC721(IERC721 tokenContract) external view returns(uint256);
    function transferERC721(IERC721 tokenContract, address to, uint256 tokenId) external;
}