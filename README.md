


# KipuBank 🏦 | [Português](#português) | [English](#english) | [中文](#中文)

![MIT License](https://img.shields.io/badge/License-MIT-green)

---

<a name="português"></a>
## 🇧🇷 Português

### Contrato Bancário Descentralizado em Solidity

#### Funcionalidades Principais
- ✅ Depósito de ETH com limite de capacidade do banco
- ⚠️ Limite de saque de 100 ETH por transação
- 🔒 Modificadores de segurança integrados
- 📊 Rastreamento de saldos individuais
- 🚨 4 Erros personalizados com mensagens claras

#### Como Usar
```bash
# Compilar
forge build

# Implantar (capacidade em WEI)
forge create KipuBank --constructor-args <CAPACIDADE_EM_WEI> --value 0
```

#### Exemplo de Código
```solidity
// Depositar 1 ETH
(bool success,) = 0x...contractAddress.call{value: 1 ether}("");

// Sacar 0.5 ETH
contract.withdraw(0.5 ether);
```

#### Erros
```solidity
KipuBank_InsufficientBalance()    // Saldo insuficiente
KipuBank_ExceedsWithdrawLimit()   // Limite de saque excedido
KipuBank_OverValueDeposit()       // Depósito excede capacidade
KipuBank_WithdrawValue()          // Falha na transferência
```

#### Eventos
```solidity
event Deposit(address indexed sender, uint256 amount);
event Withdraw(address indexed sender, uint256 amount);
```

---

<a name="english"></a>
## 🌎 English

### Decentralized Banking Contract in Solidity

#### Key Features
- ✅ ETH deposits with bank capacity limit
- ⚠️ 100 ETH per transaction withdraw limit
- 🔒 Built-in security modifiers
- 📊 Individual balance tracking
- 🚨 4 Custom errors with clear messages

#### Quick Start
```bash
# Compile
forge build

# Deploy (capacity in WEI)
forge create KipuBank --constructor-args <BANK_CAP_IN_WEI> --value 0
```

#### Code Example
```solidity
// Deposit 1 ETH
(bool success,) = 0x...contractAddress.call{value: 1 ether}("");

// Withdraw 0.5 ETH
contract.withdraw(0.5 ether);
```

#### Custom Errors
```solidity
KipuBank_InsufficientBalance()    // Insufficient balance
KipuBank_ExceedsWithdrawLimit()   // Withdraw limit exceeded
KipuBank_OverValueDeposit()       // Deposit exceeds capacity
KipuBank_WithdrawValue()          // Transfer failed
```

#### Events
```solidity
event Deposit(address indexed sender, uint256 amount);
event Withdraw(address indexed sender, uint256 amount);
```

---

## 🇨🇳 中文

### 基于Solidity的去中心化银行合约

#### 主要功能
- ✅ ETH存款 (银行总容量限制)
- ⚠️ 单次取款限额100 ETH
- 🔒 内置安全修饰器 (原"修改器"→术语修正)
- 📊 用户余额追踪
- 🚨 4个定制化错误类型

#### 快速开始
```bash
# 编译合约
forge build

# 部署合约 (容量单位: WEI)
forge create KipuBank --constructor-args <银行总容量_WEI单位> --value 0
```

#### 代码示例
```solidity
// 存入1 ETH
(bool success,) = 0x...合约地址.call{value: 1 ether}("");

// 提取0.5 ETH
合约.withdraw(0.5 ether);
```

#### 自定义错误
```solidity
KipuBank_InsufficientBalance()    // 余额不足
KipuBank_ExceedsWithdrawLimit()   // 超过取款限额
KipuBank_OverValueDeposit()       // 存款超过总容量 (添加"总"更准确)
KipuBank_WithdrawValue()          // 转账失败
```

#### 事件
```solidity
event Deposit(address indexed sender, uint256 amount);  // 存款事件
event Withdraw(address indexed sender, uint256 amount); // 取款事件
```
---
## 📜 License
```solidity
// SPDX-License-Identifier: MIT
```
**Full license:** [LICENSE](LICENSE)


