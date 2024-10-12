## ⚡Background 

In the blockchain world, **Bitcoin** uses **Proof of Work (PoW)**, while **Ethereum** has shifted to **Proof of Stake (PoS)**. 

In **PoW**, nodes compete to solve complex problems, requiring substantial computational power. This can lead to forks, where multiple blocks are created at the same height, causing uncertainty about which block is valid. The "Longest Chain Wins" rule eventually resolves this, but transactions remain probabilistic until additional blocks confirm their validity.

Conversely, **PoS** selects block-generating nodes based on their staked cryptocurrency, reducing the likelihood of forks and enhancing efficiency. However, it can still face finality issues without sufficient consensus among nodes.

This uncertainty impacts user experiences, particularly in financial transactions. For instance, a user might have to wait 30 to 60 minutes for a transfer to be confirmed, as the service needs to ensure the transaction is irreversible after potential forks are resolved. 

Ultimately, both consensus mechanisms offer unique benefits and challenges, but guaranteed finality is a crucial factor for improving blockchain usability.

Here’s a table outlining the key differences between **Proof of Stake (PoS)** and **Proof of Work (PoW)**:

| **Aspect**                  | **Proof of Work (PoW)**                                 | **Proof of Stake (PoS)**                               |
|-----------------------------|---------------------------------------------------------|--------------------------------------------------------|
| **Mechanism**                | Miners solve complex mathematical problems to validate transactions and add blocks. | Validators are chosen to create new blocks based on the amount of cryptocurrency they "stake." |
| **Energy Consumption**       | High energy consumption due to the computational work required for mining. | Low energy consumption since no complex computations are needed. |
| **Hardware Requirement**     | Requires specialized hardware (e.g., ASICs, GPUs) for mining. | No specialized hardware needed; relies on staking coins. |
| **Decentralization**         | Can be centralized by large mining farms with massive computational power. | More decentralized, as staking reduces the advantage of having powerful hardware. |
| **Security Model**           | Secured by the computational difficulty and energy cost of mining, making attacks expensive. | Secured by the economic stake of validators, as they are penalized (slashed) for malicious actions. |
| **Block Creation**           | Miners compete to solve puzzles, and the first to solve it gets to add the block. | Validators are selected randomly (often weighted by stake) to propose and validate blocks. |
| **Rewards**                  | Mining rewards are given to the first miner to solve the puzzle. | Validators receive rewards based on their staked amount and participation in block validation. |
| **51% Attack Resistance**    | Vulnerable if a single entity controls 51% of the mining power. | Vulnerable if a single entity controls 51% of the staked tokens, but penalties discourage this. |
| **Environmental Impact**     | High, due to energy-intensive mining.                   | Low, as validation requires minimal energy.             |
| **Adoption**                 | Used by Bitcoin, Ethereum (before the merge), and other older blockchains. | Used by newer blockchains like Ethereum 2.0 (post-merge), Cardano, and Polkadot. |

Viction uses a special type of PoS called PoSV, which we'll cover in the next section.