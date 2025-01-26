# 准备好掷骰子了吗？

如果你是首次部署智能合约，别担心！我们可以利用现有的骰子合约。以下是你需要做的：

## 加载合约

前往 [Solide IDE](https://solide0x.tech/address/89/0x42f8A200d7c7BF4FC6aa435ac0c13E0caF40E06D)，并与该地址的合约进行交互：`0x42f8A200d7c7BF4FC6aa435ac0c13E0caF40E06D`。

## 掷骰子！

点击 IDE 中的 `roll` 函数。这将启动一个模拟掷骰子的交易。由于 VRRF 的工作原理，确认过程可能需要几秒钟。

![](https://raw.githubusercontent.com/POLearn/victionary-everything-about-viction/refs/heads/master/content/assets/images/dice_roll.png)

*请注意，结果将在几秒钟后改变。根据 Viction 文档，值得注意的是 *VRRF 依赖于调用交易的顺序，使用 VRRF 的协议必须等待短暂的时间（例如 8-10 秒），再向最终用户显示随机结果，以避免与区块重组相关的问题。*

## 理解掷骰子事件

每次执行掷骰子时，合约都会触发一个 `RollEvent`。我们可以导航到 Vicscan 上的骰子合约，并查看 *Event* 选项卡，找到这个触发的事件。该事件包含解码掷骰子值的关键信息：

```
0x0000000000000000000000000000000000000000000000000000000000fa8674b6c634d1fa355a3b605f762247847be8da437e46c55627c8ed747367298250e40000000000000000000000000000000000000000000000000000000000000001
```

通过解码这些数据，我们发现掷骰子的值是 **2**。此外，该事件还提供了一个原始的 VRRF 值，由 `n` 关键字表示。这个 `bytes32` 值可以转换为标准数字（`uint256`），以供链上操作，正如骰子合约中所示。（你可以参考 [这里](https://raw.githubusercontent.com/solide-project/awesome-learn-solidity/master/main/exploring-viction-ecosystem/build-with-viction-vrrf/assets/logs.png) 查看掷骰子事件日志的截图）。

![](https://raw.githubusercontent.com/POLearn/victionary-everything-about-viction/refs/heads/master/content/assets/images/dice_log.png)

## VRRF 的强大功能

VRRF 作为一个可靠且可验证的解决方案，在 Viction 区块链上生成随机数。以下是它如此有价值的原因：

* **可验证的随机性：** 任何人都可以确认生成的数字确实是随机的，并且没有被篡改，从而增强区块链应用程序的信任度。
* **无缝集成：** VRRF 与智能合约无缝集成，实现了随机值的高效链上处理。
* **成本效益：** VRRF 提供了一种安全且具有成本效益的方式来生成智能合约中的随机数。

## VRRF 应用：不仅仅是掷骰子游戏

虽然掷骰子游戏展示了 VRRF 的娱乐潜力，但它的应用远不止于此。VRRF 可以实现公平的任务分配，确保奖励或任务分配透明且不偏不倚。它还推动了不可预测的 NFT 铸造，为创建独特收藏品增添了令人兴奋的随机性和惊喜。

> ❗**别忘了**
> 对于此次提交，请提供在 Viction 上部署的骰子合约中调用 `roll` 方法的交易。