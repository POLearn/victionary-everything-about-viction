# Blocks

A block in the Viction (or any) blockchain is a fundamental unit of the blockchain, encapsulating essential transaction information along with a reference to the preceding block. This design establishes a chain of blocks, creating a secure and immutable record of all transactions. Hence a *"block" - chain*. Each block is interconnected, with the hash of the previous block embedded within it, ensuring that any alterations to one block would require modifications to all subsequent blocks. This mechanism not only enhances security but also reinforces the integrity of the entire blockchain network, making it resilient against tampering and fraud.

### Key Components of an Ethereum Block

![](https://lh7-us.googleusercontent.com/eln9I9CHeqGPvgib8ZW-L9l55ZZvKVDWCCdwiGySv5D465LhB8siEG734vbi_nMNx0459yjBQTrG8itmKdOd-hL4JwMkIEJ0esHzX9qqnRT9KiAa87vZxPVJ24bh8tJftC5J6ZEPeTK_pYuQPZuwiGI)

1. Block Header

The block header contains vital information for the Viction blockchain:

- **Hash (Prev)** 🔗: Links to the previous block for security.
- **Timestamp** ⏰: Indicates when the block was created.
- **Merkle Root** 🌳: Represents all transactions in the block.
- **Nonce** 🔍: A value used by miners to solve the proof-of-work puzzle.

2. Block Body

- **Block Data** 📊: Stores transaction details in a structured format.
- **Merkle Tree** 🌲: Organizes transaction data efficiently for verification.
- **Transaction IDs** 🆔: Unique identifiers for each transaction within the block.

### Analyzing Blocks on Viction

![](https://raw.githubusercontent.com/POLearn/victionary-everything-about-viction/refs/heads/master/assets/blocks.png)

Analyzing blocks on the Viction blockchain provides valuable insights into transaction activity and network performance. Each block is meticulously structured, featuring a header that links it to its predecessor, ensuring a secure and immutable ledger. By examining the block body, users can delve into transaction details organized in a Merkle tree, facilitating efficient verification. 

> To explore all of Viction's mined blocks, visit the following link: [Vicscan Blocks](https://www.vicscan.xyz/blocks).

If we take a look at an example block say, [#85453443](https://www.vicscan.xyz/block/85453443)

We can see that it represents the 85,453,443rd block in Viction's blockchain. Each block in the blockchain is sequentially numbered, allowing users to track the history of transactions and changes within the network

![](https://raw.githubusercontent.com/POLearn/victionary-everything-about-viction/refs/heads/master/assets/header.png)

- **Block Height:** The block height, or block number, indicates the position of a specific block in the blockchain.
- **Epoch:** A time period or interval during which a specific number of blocks are mined; in Viction, it's calculated as `BlockHeight / 900`, resulting in `ceil(85453443/900) = 94949`.
- **Timestamp:** Shows how long ago the block was created.
- **Transactions:** The total number of transactions in the block, including internal transactions resulting from contract executions that involve Ether value.
- **Hash:** The hash of the current block's header.
- **Parent Hash:** The hash of the previous block, also known as the parent block.
- **State Root:** The root of the state trie.
- **Creator:** The block producer.
- **Validator:** The validator double-checking the block.
- **Fee:** The total transaction fee for all transactions in the block.
- **Gas Used:** The total gas units consumed by the block.
- **Gas Limit:** The maximum gas limit for the block.
- **Finality:** The percentage of masternodes in the network that agree on this block.
- **Total Difficulty:** The cumulative difficulty of the chain up to this block.
- **Size:** The block size is determined by the block's gas limit.
- **Extra Data:** Any additional data included by the block producer.
 
![](https://raw.githubusercontent.com/POLearn/victionary-everything-about-viction/refs/heads/master/assets/block-transactions.png)

Moreover, the block body contains all the transactions that represent core operations within the network, such as asset transfers, contract interactions, or data updates. In this particular block, there are three transactions, indicating a variety of activities taking place within the Viction blockchain. Each transaction is a record of an event These transactions not only contribute to the overall activity within the network but also enhance transparency and accountability, as they are securely recorded and verifiable by anyone analyzing the blockchain.