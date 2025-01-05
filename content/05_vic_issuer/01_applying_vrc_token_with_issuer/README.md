## Apply for Zero Gas Protocol

When you deploy or register your VRC25 on Viction, it won’t automatically qualify for gasless transactions. To enable this feature, you need to apply for the *Zero Gas Protocol*. In this section, we’ll explore how to achieve this through the VicIssuer smart contract, providing insights into the inner workings of the VIC Issuer.

To follow along, load the VIC Issuer contract, compile, and deploy it using the issuer address specified earlier. For the testnet, use `0x8c0faeb5c6bed2129b8674f262fd45c4e9468bee`.

![](https://raw.githubusercontent.com/POLearn/victionary-everything-about-viction/refs/heads/master/content/assets/images/issuer_contract.png)

*Alternatively, you can access it directly via our IDE - [https://solide0x.tech/address/89/0x8c0faeb5c6bed2129b8674f262fd45c4e9468bee](https://solide0x.tech/address/89/0x8c0faeb5c6bed2129b8674f262fd45c4e9468bee)*

Once loaded into the IDE, call the `minCap` value. This should be set to `10000000000000000000`, which corresponds to 10 VIC tokens. These tokens are required as a deposit to apply for gasless transactions. This value will be important as it'll need to be passed as the `msg.value` when invoking `apply` and thus applying the VRC25 token to the Zero Gas Integration.

```
10 $VIC * 18 (decimals) = 10000000000000000000 wei
```

![](https://raw.githubusercontent.com/POLearn/victionary-everything-about-viction/refs/heads/master/content/assets/images/issuer_mincap.png)

## Quest - Apply your VRC25 to VicIssuer

![](https://raw.githubusercontent.com/POLearn/victionary-everything-about-viction/refs/heads/master/content/assets/images/issuer_apply.png)

You can enable gasless transactions for your VRC25 token by deploying the token and invoking the `apply` method. This process allows the token to support gasless operations, making transactions smoother and more user-friendly. Make sure to include a deposit of 10 VIC during this step, which will be used to sponsor the gas fees. This ensures that all transactions remain gasless, enhancing the user experience. 

You (or anyone) can choose to make this deposit at a later stage, but incorporating it during the initial deployment is advisable. You can check the details in the blockchain explorer to confirm that your VRC25 token has been successfully set up for gasless transactions.

#### Token Verification

If you call the `tokens()` method, you can confirm your token’s inclusion in the VIC Issuer’s list. The address of your applied token should appear in the returned list. Make sure that the token address you applied for is in the token list.

![](https://raw.githubusercontent.com/POLearn/victionary-everything-about-viction/refs/heads/master/content/assets/images/issuer_tokens.png)

If everything is set up correctly, you can also verify your token's status on the **Issuer Dashboard**. Visit [https://issuer.viction.xyz](https://issuer.viction.xyz) for the mainnet or [https://issuer-testnet.viction.xyz](https://issuer-testnet.viction.xyz) for the testnet.  

For reference, here’s the token applied during this course:  
[Example Applied Token](https://issuer-testnet.viction.xyz/token/0xbba5098BF9c7726EC69C7BE3AE35C10DDC0B866a)

![](https://raw.githubusercontent.com/POLearn/victionary-everything-about-viction/refs/heads/master/content/assets/images/issuer_dashboard.png)

## What happened?

An important aspect of creating a gasless token is to *apply* the token to the VicIssuer. This means, setting up the token address. 

```solidity
function apply(address token) public payable onlyValidCapacity(token) {
    AbstractTokenTRC21 t = AbstractTokenTRC21(token);
    require(t.issuer() == msg.sender);
    _tokens.push(token);
    tokensState[token] = tokensState[token].add(msg.value);
    emit Apply(msg.sender, token, msg.value);

}
```

On `Line 98` is the implementation of `apply`. Note only that only the token owner (or `issuer`) can apply a token to the Issuer. After that, we see that the token gets appended to `_tokens` which is a list of all registeretokensen for gasless and updates the issuance state (`tokensState`) with the amount of Ether provided (`msg.value`). This step effectively registers the token issuer within the `VRC25Issuer` contract, enabling subsequent operations related to token management and fee charging.