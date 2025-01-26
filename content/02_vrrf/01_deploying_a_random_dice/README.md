## 骰子游戏

让我们来看一个使用 Viction 的 VRRF 在智能合约中的实际应用。在这个场景中，我们将创建一个骰子智能合约，允许用户掷一个虚拟骰子并在链上接收 1 到 6 之间的随机结果。这个应用展示了 VRRF 如何确保每一次掷骰子都是公平且可验证的，提供了一个抗篡改的链上随机源。通过将 VRRF 集成到智能合约中，我们可以确保每个玩家都体验到真正随机的骰子掷动。

### 代码

源代码可以通过我们的 IDE 加载，查看 [Github 源代码](https://github.com/POLearn/victionary-everything-about-viction/blob/master/contract/Dice.sol)

```solidity
contract Dice {
    IVRRF public immutable vrrf;

    event RollEvent(uint256 timestamp, uint256 n, uint256 value);

    constructor(address _vrrf) {
        vrrf = IVRRF(_vrrf);
    }

    function roll() public returns (uint8) {
        uint256 ts = block.number;
        bytes32 salt = blockhash(ts - 1);
        uint256 n = uint256(vrrf.random(salt));
        uint8 value = uint8((n % 6) + 1);
        emit RollEvent(ts, n, value);
        return value;
    }

    function rollWithSalt(bytes32 salt) public returns (uint8) {
        uint256 n = uint256(vrrf.random(salt));
        uint8 value = uint8((n % 6) + 1);
        emit RollEvent(block.number, n, value);
        return value;
    }
}
```

以下代码实现了一个功能齐全的骰子合约：

* **核心功能 (`roll()` 函数):** 此函数模拟骰子掷动。它捕获当前区块号并从上一个区块的哈希创建一个特殊值，称为 "salt"，为随机性添加额外层次。然后调用 VRRF 来生成一个伪随机数，将其转换为 1 到 6 之间的值，代表骰子的结果。
* **可定制随机性 (`rollWithSalt()` 函数):** 此函数提供了更多控制，适用于特定场景。用户可以提供自己的 "salt" 值，从而影响随机结果。对于需要可预测结果的测试场景非常有用。

### 任务 - 在 Viction 测试网部署骰子合约 🎲

首先加载 [Dice 合约](https://github.com/POLearn/victionary-everything-about-viction/blob/master/contract/Dice.sol)，并将其加载到您首选的 IDE 中。

![](https://raw.githubusercontent.com/POLearn/victionary-everything-about-viction/refs/heads/master/content/assets/images/dice_contract.png)

您的第一个任务是通过在合约顶部添加 `IVRRF` 接口来修改合约。这个接口允许合约从 Viction 的 VRRF 服务安全地请求随机性。接下来，您将实现 `roll()` 函数，它将与 VRRF 交互以生成随机值——这是骰子合约的核心功能。如果需要指导，可以查看 [Viction 测试网示例](https://testnet.vicscan.xyz/address/0x845B5EaF9D75215E08896a5c96B416640F6b1F55)。

![](https://raw.githubusercontent.com/POLearn/victionary-everything-about-viction/refs/heads/master/content/assets/images/dice_deploy.png)

更新代码后，使用 **Solidity 版本 0.8.19** 编译合约。注意在编译过程中是否有错误，并解决这些错误。这一步确保您的合约已准备好在 Viction 测试网上部署。

*如果您想查看参考示例，可以查看 [Viction 测试网部署示例](https://testnet.vicscan.xyz/address/0x845B5EaF9D75215E08896a5c96B416640F6b1F55)。*

确保您的钱包中有足够的 **VIC 代币** 来支付部署费用。部署后，记录下合约地址和交易哈希。您可以在 [Viction 测试网浏览器](https://testnet.vicscan.xyz/) 上验证您的部署。

您已成功在 Viction 测试网上部署了骰子合约！为了完成此任务，请分享您的 **交易哈希** 作为部署证明。这样做将为您赢得一个特别的 **NFT POAP 奖励**，以表彰您完成此课程。