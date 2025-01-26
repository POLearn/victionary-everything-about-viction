## Charging Gasless Transactions

在这个部分，我们将探讨如何为 VRC25 代币充电，以确保其能够持续支持无 Gas 交易，这是创建顺畅且用户友好体验的关键方面。**VicIssuer** 合约包括一个名为 `charge` 的方法，它允许您为代币的容量充值。通过充值，您确保代币能够始终支持交易费用，从而保持用户体验的无缝性。

### `charge` 方法

`charge` 方法简单高效。它接受一个表示您希望充值的代币的地址和您希望存入的金额（以 $VIC 或等值的代币表示）。这个存款将被添加到代币的状态中，增加其支持无 Gas 交易的容量。以下是该方法的定义：

```solidity
function charge(address token) public payable {
    tokensState[token] = tokensState[token].add(msg.value);
    emit Charge(msg.sender, token, msg.value);
}
```

### 如何使用

当您执行 `charge` 方法时，函数会更新 `tokensState` 映射，并发出 `Charge` 事件，从而提供透明度并便于追踪充值交易。

1. **调用 `charge` 方法**：提供代币地址和充值金额（以 $VIC 为单位）。
2. **更新状态**：该金额会被加到 `tokensState` 映射中，以增加代币的容量。
3. **发出事件**：每次充值都会触发 `Charge` 事件，以确保操作的透明性。

### 示例应用

假设您的代币地址为 `0x1234567890abcdef`，并且您希望为该代币充值 50 VIC：

```solidity
charge(0x1234567890abcdef) payable 50 VIC
```

充值成功后，`tokensState` 映射将更新，确保您的代币仍能支持无 Gas 交易。