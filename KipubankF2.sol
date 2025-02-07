// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

error KipuBank_InsufficientBalance();
error KipuBank_ExceedsWithdrawLimit();
error KipuBank_OverValueDeposit();
error KipuBank_WithdrawValue();

contract KipuBank {
    // State variables

    // Bank cap
    uint256 public immutable s_BANKCAP; 
    
    // Withdraw limit
    uint256 public constant s_WITHDRAW_LIMIT = 100 ether;

    // Mapping for user balances
    mapping(address => uint256) public s_balances; // Key: _wallet (address), Value: _amount (uint256)

    // Events
    event Deposit(address indexed sender, uint256 amount);
    event Withdraw(address indexed sender, uint256 amount);

    // Constructor
    constructor(uint256 bankCap) {
        s_BANKCAP = bankCap;
    }

    // Modifier to check if the deposit does not exceed the bank cap
    modifier checkDepositLimit(uint256 depositAmount) {
        uint256 newBalance = address(this).balance + depositAmount;
        if (newBalance > s_BANKCAP) {
            revert KipuBank_OverValueDeposit();
        }
        _;
    }

    // Modifier to check if the user has enough balance to withdraw
    modifier checkSufficientBalance(uint256 amount) {
        if (s_balances[msg.sender] < amount) {
            revert KipuBank_InsufficientBalance();
        }
        _;
    }

    // Modifier to check if the withdrawal does not exceed the limit
    modifier checkWithdrawLimit(uint256 amount) {
        if (amount > s_WITHDRAW_LIMIT) {
            revert KipuBank_ExceedsWithdrawLimit();
        }
        _;
    }
    
    //local correto do EMIT?
    // Internal function to transfer ETH to the user
    function _transferETH(address recipient, uint256 amount) internal {
        (bool success, ) = recipient.call{value: amount}("");
        
        if (!success) {
            revert KipuBank_WithdrawValue();
        }
    }

    // Deposit function
    function deposit() external payable checkDepositLimit(msg.value) {
        // Update user balance (_wallet: msg.sender, _amount: msg.value)
        s_balances[msg.sender] += msg.value;

        // Emit deposit event
        emit Deposit(msg.sender, msg.value);
    }

    // Withdraw function
    function withdraw(uint256 amount) external 
        checkSufficientBalance(amount)
        checkWithdrawLimit(amount)
    {
        // Update balance before transfer (_wallet: msg.sender, _amount: amount)
        s_balances[msg.sender] -= amount;

        // Call internal transfer function to send ETH to user
        _transferETH(msg.sender, amount);

        // Emit withdrawal event
        emit Withdraw(msg.sender, amount);
    }

    // Function  contract's ETH balance
    function getContractBalance() external view returns (uint256) {
        return address(this).balance;
    }
}