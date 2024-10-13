### `apply`

An important aspect of creating a gasless token is to *apply* the token to the VicIssuer. This mean, setting up the token address. 

```solidity
function apply(address token) public payable onlyValidCapacity(token) {
    AbstractTokenTRC21 t = AbstractTokenTRC21(token);
    require(t.issuer() == msg.sender);
    _tokens.push(token);
    tokensState[token] = tokensState[token].add(msg.value);
    emit Apply(msg.sender, token, msg.value);

}
```

On Line 98 is the implementation of `apply`. Note only that only the token owner (or `issuer`) can apply a token to the Issuer. After that we see that the token get appended to `_tokens` which is a list of all registered token for gasless and updates the issuance state (`tokensState`) with the amount of Ether provided (`msg.value`). This step effectively registers the token issuer within the `VRC25Issuer` contract, enabling subsequent operations related to token management and fee charging.

## Practical Guide,

*This will require a VRC25, take a look the previous guide to deploy a VRC25 token*.

When you load the the `VicIssuer` into the an IDE, you can deploy and interact with it. Let's take a look at the `_minCap`. The value should be `10000000000000000000`. This means that an requirement of 10 VIC will be need to apply for the gasless token.
```
10 $VIC * 18 (decimals) = 10000000000000000000 wei
```

This value will be important as it'll be need to be pass as the `msg.value` when invoking `apply` and thus applying the VRC25 token to the Zero Gas Integration.

### Apply

![Mint](https://raw.githubusercontent.com/solide-project/awesome-learn-solidity/vic/main/exploring-viction-ecosystem/deep-dive-viction-issuer/assets/apply.png)

You can enable gasless transactions for your VRC25 token by deploying the token and invoking the `apply` method. This process allows the token to support gasless operations, making transactions smoother and more user-friendly. It's recommended to include a deposit of 10 VIC during this step, which will be used to sponsor the gas fees. This ensures that all transactions remain gasless, enhancing the user experience. If preferred, you can choose to make this deposit at a later stage, but incorporating it during the initial deployment is advisable for seamless integration. To confirm that your VRC25 token has been successfully set up for gasless transactions, you can check the details in the blockchain explorer. This verification step ensures that the token deployment and the application for gasless transactions were executed correctly, providing transparency and assurance that your VRC25 token is ready for seamless, fee-free operations.

![Applied on Vic Issuer](https://raw.githubusercontent.com/solide-project/awesome-learn-solidity/vic/main/exploring-viction-ecosystem/deep-dive-viction-issuer/assets/applied-issuer.png)

### Found your token address with tokens()

If you take call `tokens()`. It will return the entire list of applied tokens available for the Issuer. The applied token address from before should be there.

![Token List](https://raw.githubusercontent.com/solide-project/awesome-learn-solidity/vic/main/exploring-viction-ecosystem/deep-dive-viction-issuer/assets/token-list.png)

>