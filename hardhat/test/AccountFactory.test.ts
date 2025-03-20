import { expect } from 'chai';
import { ethers } from 'hardhat';
import { Contract } from 'ethers';

describe('AccountFactory', function () {
  let accountFactory: Contract;
  let owner: any;
  let addr1: any;

  beforeEach(async function () {
    [owner, addr1] = await ethers.getSigners();

    const AccountFactory = await ethers.getContractFactory('AccountFactory');
    accountFactory = await AccountFactory.deploy();
    await accountFactory.deployed();
  });

  it('should create a new account', async function () {
    const tx = await accountFactory.connect(owner).createAccount();
    await tx.wait();

    const deployedAccount = await accountFactory.deployedContracts(0);
    expect(deployedAccount).to.not.be.undefined;

    const currentAccounts = await accountFactory.currentAccounts();
    expect(currentAccounts.toNumber()).to.equal(1);
  });
});