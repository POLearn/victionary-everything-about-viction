### 在 Viction 测试网部署 VRC725 NFT 合约

既然我们已经了解了 VRC725，接下来让我们使用该标准部署一个 NFT 合约。我们将从官方 Viction 仓库获取该合约。`NFTMock.sol` 合约利用了 **VRC725Enumerable**，提供了类似于 ERC721 的功能，但经过调整以适应 VRC725，允许铸造、转移和批准功能，并附加 VRC725 独特的许可功能。

`NFTMock` 合约继承自 `VRC725Enumerable`，利用了 VRC725 标准并增加了枚举功能。合约初始化遵循类似于 ERC721 的模式，但对于 VRC725，它使用 `__VRC725_init` 进行适当的设置。部署后，ABI 将包括所有 ERC721 方法，支持铸造、转移、批准，并新增许可功能。

让我们在 Viction 区块链上部署一个实际的 `VRC725` 代币标准示例。完整的源代码可以在官方 Viction 仓库找到：[https://github.com/BuildOnViction/vrc725/blob/main/contracts/tests/NFTMock.sol](https://github.com/BuildOnViction/vrc725/blob/main/contracts/tests/NFTMock.sol)

```solidity
contract NFTMock is VRC725Enumerable {
    constructor(string memory name, string memory symbol, address issuer) {
        __VRC725_init(name, symbol, issuer);
    }

    function mint(address owner, uint256 tokenId) external onlyOwner {
        _safeMint(owner, tokenId);
    }
}
```

## 任务 - 部署 V725

你可以在所选 IDE 或环境中加载上述合约，并使用 **Solidity 版本 0.8.19** 编译 `NFTMock.sol` 并部署合约。

![](https://raw.githubusercontent.com/POLearn/victionary-everything-about-viction/refs/heads/master/content/assets/images/vrc25_contract.png)

![](https://raw.githubusercontent.com/POLearn/victionary-everything-about-viction/refs/heads/master/content/assets/images/vrc725_deploy.png)

然后，部署合约时，提供以下作为其代币参数：
- **名称：** "POL VRC725"  
- **符号：** "POL"  
- **发行人地址：** `0x8c0faeb5c6bed2129b8674f262fd45c4e9468bee`  

需要注意的是，合约必须注册到 Viction 发行人合约。在本例中，发行人地址为 `0x8c0faeb5c6bed2129b8674f262fd45c4e9468bee`。稍后我们将详细说明，但本质上，合约拥有者需要存入 10+ $VIC，以支持并资助用户的 gas 费用。通过提供发行人地址，用户可以与合约进行交互，并享受由发行人提供的 gasless 体验。

部署完成后，你的 VRC725 NFT 合约已经准备好在 Viction 测试网上改变 NFT 的运作方式。不要忘记提交你的交易哈希来完成任务并展示你的成就！ 🎉