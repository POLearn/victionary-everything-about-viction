# 区块

Viction（或任何）区块链中的区块是区块链的基本单位，封装了重要的交易信息，并包含对前一个区块的引用。此设计建立了一条区块链，创建了所有交易的安全且不可更改的记录。因此是一个*“区块” - 链*。每个区块相互连接，前一个区块的哈希值嵌入其中，确保任何对一个区块的更改都需要修改所有后续区块。这一机制不仅增强了安全性，还加强了整个区块链网络的完整性，使其能够抵御篡改和欺诈。

### 以太坊区块的关键组成部分

![](https://lh7-us.googleusercontent.com/eln9I9CHeqGPvgib8ZW-L9l55ZZvKVDWCCdwiGySv5D465LhB8siEG734vbi_nMNx0459yjBQTrG8itmKdOd-hL4JwMkIEJ0esHzX9qqnRT9KiAa87vZxPVJ24bh8tJftC5J6ZEPeTK_pYuQPZuwiGI)

1. 区块头

区块头包含Viction区块链的关键信息：

- **哈希（前一个）** 🔗：链接到前一个区块以保证安全。
- **时间戳** ⏰：表示区块创建的时间。
- **Merkle根** 🌳：表示区块中的所有交易。
- **随机数** 🔍：矿工用于解决工作量证明难题的值。

2. 区块体

- **区块数据** 📊：以结构化格式存储交易详细信息。
- **Merkle树** 🌲：有效地组织交易数据以便验证。
- **交易ID** 🆔：每个区块内交易的唯一标识符。

### 分析Viction上的区块

![](https://raw.githubusercontent.com/POLearn/victionary-everything-about-viction/refs/heads/master/assets/blocks.png)

分析Viction区块链上的区块为交易活动和网络性能提供了有价值的洞见。每个区块结构严谨，区块头将其与前一个区块连接，确保了安全和不可更改的账本。通过检查区块体，用户可以深入了解以Merkle树组织的交易详细信息，从而有效地进行验证。

> 要浏览Viction的所有已挖掘区块，请访问以下链接：[Vicscan区块](https://www.vicscan.xyz/blocks)。

如果我们查看一个示例区块，例如 [#85453443](https://www.vicscan.xyz/block/85453443)

我们可以看到它代表了Viction区块链中的第85,453,443个区块。区块链中的每个区块都有一个顺序编号，允许用户跟踪网络中交易和变化的历史。

![](https://raw.githubusercontent.com/POLearn/victionary-everything-about-viction/refs/heads/master/assets/header.png)

- **区块高度：** 区块高度或区块编号表示特定区块在区块链中的位置。
- **纪元：** 一个时间段或间隔，其中挖掘了特定数量的区块；在Viction中，计算方法为 `BlockHeight / 900`，结果为 `ceil(85453443/900) = 94949`。
- **时间戳：** 显示区块创建多久之前。
- **交易数：** 区块中的交易总数，包括由涉及以太坊价值的合约执行所引发的内部交易。
- **哈希：** 当前区块头的哈希。
- **父哈希：** 前一个区块的哈希，也称为父区块。
- **状态根：** 状态树的根。
- **创建者：** 区块生产者。
- **验证者：** 双重检查区块的验证者。
- **费用：** 区块中所有交易的总交易费用。
- **消耗的Gas：** 区块消耗的Gas总量。
- **Gas限制：** 区块的最大Gas限制。
- **最终性：** 网络中与此区块达成共识的主节点百分比。
- **总难度：** 直到此区块为止链的累积难度。
- **大小：** 区块大小由区块的Gas限制决定。
- **附加数据：** 区块生产者添加的任何额外数据。

![](https://raw.githubusercontent.com/POLearn/victionary-everything-about-viction/refs/heads/master/assets/block-transactions.png)

此外，区块体包含所有代表网络核心操作的交易，例如资产转移、合约交互或数据更新。在这个特定的区块中，有三笔交易，表明Viction区块链上发生了各种活动。每笔交易都是一个事件记录，这些交易不仅有助于网络中的整体活动，还增强了透明度和问责制，因为它们被安全地记录并可以被任何分析区块链的人验证。