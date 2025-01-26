## 申请 Zero Gas 协议

当您在 Viction 上部署或注册您的 VRC25 时，它不会自动支持无 Gas 交易。要启用此功能，您需要申请 *Zero Gas 协议*。在本部分中，我们将探索如何通过 VicIssuer 智能合约来实现这一目标，并提供有关 VIC Issuer 内部工作原理的见解。

### 如何申请

首先，加载 VIC Issuer 合约，编译并部署它，使用先前指定的发行者地址。对于测试网，使用 `0x8c0faeb5c6bed2129b8674f262fd45c4e9468bee`。

![Issuer Contract](https://raw.githubusercontent.com/POLearn/victionary-everything-about-viction/refs/heads/master/content/assets/images/issuer_contract.png)

*或者，您可以通过我们的 IDE 直接访问 - [Solide IDE - VicIssuer](https://solide0x.tech/address/89/0x8c0faeb5c6bed2129b8674f262fd45c4e9468bee)*

加载到 IDE 后，调用 `minCap` 值。它应设置为 `10000000000000000000`，即 10 VIC 代币。这些代币是申请无 Gas 交易所必需的存款。这个值非常重要，因为它需要在调用 `apply` 时作为 `msg.value` 传递，从而将 VRC25 代币应用于 Zero Gas 集成。

```
10 $VIC * 18 (小数位) = 10000000000000000000 wei
```

![Issuer MinCap](https://raw.githubusercontent.com/POLearn/victionary-everything-about-viction/refs/heads/master/content/assets/images/issuer_mincap.png)

## Quest - 申请将您的 VRC25 代币应用于 VicIssuer

您可以通过部署代币并调用 `apply` 方法来启用 VRC25 代币的无 Gas 交易。这一过程允许该代币支持无 Gas 操作，使交易更加流畅和用户友好。请确保在此步骤中包含 10 VIC 存款，这将用于资助 Gas 费用。这样可以确保所有交易保持无 Gas，提高用户体验。

建议在初始部署时包含此存款，但您也可以选择稍后在其他阶段进行此存款。您可以在区块链浏览器中检查详细信息，以确认您的 VRC25 代币已成功设置为无 Gas 交易。

#### 代币验证

如果您调用 `tokens()` 方法，您可以确认您的代币是否包含在 VIC Issuer 的代币列表中。已申请代币的地址应出现在返回的列表中。请确保已申请的代币地址在代币列表中。

![Issuer Tokens](https://raw.githubusercontent.com/POLearn/victionary-everything-about-viction/refs/heads/master/content/assets/images/issuer_tokens.png)

如果一切设置正确，您还可以在 **Issuer Dashboard** 上验证代币的状态。访问以下链接查看主网或测试网状态：

- [Issuer Dashboard (主网)](https://issuer.viction.xyz)
- [Issuer Dashboard (测试网)](https://issuer-testnet.viction.xyz)

参考：这是本课程中应用的代币：[Example Applied Token](https://issuer-testnet.viction.xyz/token/0xbba5098BF9c7726EC69C7BE3AE35C10DDC0B866a)

![Issuer Dashboard](https://raw.githubusercontent.com/POLearn/victionary-everything-about-viction/refs/heads/master/content/assets/images/issuer_dashboard.png)

## 发生了什么？

创建无 Gas 代币的一个重要方面是 *申请* 代币到 VicIssuer。这意味着设置代币地址。

```solidity
function apply(address token) public payable onlyValidCapacity(token) {
    AbstractTokenTRC21 t = AbstractTokenTRC21(token);
    require(t.issuer() == msg.sender);
    _tokens.push(token);
    tokensState[token] = tokensState[token].add(msg.value);
    emit Apply(msg.sender, token, msg.value);
}
```

在第 98 行是 `apply` 的实现。请注意，只有代币的拥有者（或 `issuer`）才能将代币应用于 Issuer。之后，代币会被追加到 `_tokens`，这是一个所有注册的无 Gas 代币的列表，并且会使用提供的以太币（`msg.value`）更新发行状态（`tokensState`）。这个步骤有效地将代币发行者注册到 `VRC25Issuer` 合约中，从而启用与代币管理和费用收取相关的后续操作。