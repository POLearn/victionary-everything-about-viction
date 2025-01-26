## 示例智能合约：SampleVRC25

回顾一下，VRC25 作为 ERC20 代币标准的创新扩展，旨在简化 Viction 网络上的交易。其关键特性是什么？免气费交易！通过利用智能合约资助交易费用，VRC25 消除了新区块链用户的一个障碍，促进了更流畅的用户体验。

让我们在 Viction 区块链上部署一个 VRC25 代币标准的实际示例。完整的源代码可以在 Viction 官方仓库找到：[https://github.com/POLearn/victionary-everything-about-viction/blob/master/contract/POLVRC25.sol](https://github.com/POLearn/victionary-everything-about-viction/blob/master/contract/POLVRC25.sol)

![](https://raw.githubusercontent.com/POLearn/victionary-everything-about-viction/refs/heads/master/content/assets/images/vrc25_contract.png)

我们可以加载整个 Solide IDE 实现，其中包括 `VRC25` 和 `VRC25Permit` 的实现。如果您想查看并理解该实现，可以查看代码，但这个资源应该提供足够的信息以了解 VRC25 代币的底层实现。通过继承 `VRC25` 和 `VRC25Permit`，合约获得了 VRC25 标准的所有功能，包括代币管理和费用估算。此外，VRC25Permit 扩展通过离线签名实现免气费交易，显著提高了用户便利性。

## 自定义您的 VRC25 代币

![](https://raw.githubusercontent.com/POLearn/victionary-everything-about-viction/refs/heads/master/content/assets/images/vrc25_contstructor.png)

查看 `第10行`，您可以在构造函数中修改，以设置更适合的 VRC25 代币名称和符号。以下是一个示例：

```solidity
constructor() public VRC25("示例可替代代币", "EFT", 0)
```

### 部署注意事项

- 如果遇到错误信息 "Abstract contracts cannot have public constructors. Remove the 'public' keyword to fix this"，则需要在 `VRC25Permit.sol` 文件中解决此问题。
- 只需从 `VRC25Permit.sol` 中的构造函数删除 `public` 关键字即可。以下是修正后的代码：

```solidity
constructor() EIP712("VRC25", "1") { }
```

## 任务 - 部署您的 VRC25 代币 🪙

![](https://raw.githubusercontent.com/POLearn/victionary-everything-about-viction/refs/heads/master/content/assets/images/vrc25_deploy.png)

要完成此提交，请从提供的模板中部署 `POLVRC25.sol` 合约。使用 **Solidity 版本 0.8.19** 编译合约。如果再次遇到错误 *"Abstract contracts cannot have public constructors"*，请导航到 `VRC25Permit.sol` 并按照 *部署注意事项* 中的说明删除构造函数中的 `public` 关键字。

修复后，继续进行部署并祝贺您。您已经成功在 Viction 上部署了您的 VRC25 代币！要完成此任务，请分享您的 **交易哈希** 作为部署证明。