# State Trie

Learning about Viction (or blockchain in general), then a concept that's important is **State Trie**. It is a fundamental data structure to efficiently store and manage the **state** of the blockchain. So, think of a blockchain as a database, that keeps a track off all accounts balances and transactions. It is part of the Viction protocol and plays a crucial role in maintaining the current state of all accounts and their respective balances, storage, and other data.

### What is a Trie?
If we go basic to Computer Science or data structures. A [trie](https://en.wikipedia.org/wiki/Trie) is a type of *tree structure* that helps store and retrieve data efficiently. Tries are particularly useful when you need to look up information quickly, which is exactly what Ethereum needs to do when managing thousands of accounts and transactions.

The state trie can be thought of as a mapping structure where:
- Key: The account address.
- Value: The account state, which includes details like nonce, balance, and more.
An example could be the information for an account,

```json
{
  "address": "0x123...",
  "nonce": 5,
  "balance": "",
  "storage": {}
}
```

This object represents the account state associated with the specified address. However, since storing all this data in each block would be inefficient, only the root hash of the state trie is included in each block header. This root hash acts as a commitment to the data within the trie for that specific block. For example, in [Block 85453443](https://www.vicscan.xyz/block/85453443) on Viction, the block contains a state root that is a hash of the block information, ensuring that any modifications to account states during transaction processing are accurately reflected. This allows nodes to validate the integrity of the blockchain and efficiently verify account states through Merkle proofs, maintaining trust in the network's data while ensuring scalability.