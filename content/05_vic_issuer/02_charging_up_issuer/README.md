# Charging Gasless Transactions

This section is important for maintaining the capacity for gasless transactions, which is a critical aspect of creating a smooth and user-friendly experience with your VRC25 token. The **VicIssuer** contract includes a method called `charge`, which enables you to add funds to your token's capacity. By doing so, you ensure that the token can consistently support transaction fees, keeping the user experience seamless.

The `charge` method is straightforward and efficient. It accepts an address representing the token you want to recharge and the value (in $VIC or equivalent) you wish to deposit. This value is added to the token's state, increasing its capacity to sponsor gasless transactions. Here's the method definition:

```solidity
function charge(address token) public payable {
    tokensState[token] = tokensState[token].add(msg.value);
    emit Charge(msg.sender, token, msg.value);
}
```

Once executed, the function updates the `tokensState` mapping and emits a `Charge` event, allowing for transparency and easy tracking of recharge transactions.