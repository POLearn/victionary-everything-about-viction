### Charge (Optionally)

In addition to the VICIssuer's capabilities, there is a crucial method called `charge` that allows you to recharge the token's capacity. This method enables the addition of funds to support ongoing gasless transactions. When you use the `charge` method, you can deposit additional value to the token, ensuring that the token's capacity remains sufficient to cover transaction fees.

```solidity
function charge(address token) public payable {
    tokensState[token] = tokensState[token].add(msg.value);
    emit Charge(msg.sender, token, msg.value);
}
```

By calling this method and sending the required value, you can maintain a continuous, seamless gasless experience for your token holders. This feature ensures that the tokens can always support transaction fees, enhancing the overall user experience and operational efficiency of your VRC25 token.