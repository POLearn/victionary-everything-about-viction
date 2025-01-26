# 为免气费交易铸造代币

通过您新部署的 VRC25，我们可以看到代币的实际应用，通过铸造到一个名为 Address Y 的地址。通过这笔资金，我们可以将样本 VRC25 代币铸造到 *Address Y*。虽然这次初始交互会产生气费，但铸造的代币将使 Address Y 能够参与代币销毁。在本课程的 Vic Issuer 部分，我们将应用 Viction 的 Issuer 功能，允许 Address Y 在不产生气费的情况下销毁代币（以及铸造），使该过程变得更加高效且具有成本效益。

## 为 Address Y 提供资金

访问 [Viction 测试网水龙头](https://faucet-testnet.viction.xyz/) 以获取测试代币。将这些代币发送到您想要的接收地址 Address Y。此次初始资金将用于第一次铸造交易，这可能会根据网络状况产生气费。然而，后续铸造的代币将享受免气费交易。

## 任务 - 铸造

在此任务中，您将把 `100000000000000000000` 数量的代币铸造到 Address Y。

![](https://raw.githubusercontent.com/POLearn/victionary-everything-about-viction/refs/heads/master/content/assets/images/vrc25_mint.png)

VRC25 标准引入了先进的代币管理功能，同时遵循熟悉的 ERC20 结构，确保兼容性和易于集成。通过独特的方法，如 `issuer` 和 `estimateFee`，VRC25 增强了安全性、透明度和用户控制，使其成为在 Viction 区块链上进行代币操作的强大解决方案。以下指南将重点介绍另一个智能合约，名为 `VicIssuer`，它深入探讨了启用免气费操作的集成。