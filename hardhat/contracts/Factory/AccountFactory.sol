// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {Account} from "../Account.sol";

contract AccountFactory {
    mapping (uint256 => Account) public deployedContracts;
    uint256 public currentAccounts;

    function createAccount() public returns (Account) {
        Account account = new Account(msg.sender);
        deployedContracts[currentAccounts] = account;
        currentAccounts++;
        return account;
    }
}
