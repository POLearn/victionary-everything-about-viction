# Proof of Stake (PoS)?

Taking a look deeper into PoS, 

## Consensus Mechanism

**Viction** employs a unique **_Proof-of-Stake Voting (PoSV)_** consensus mechanism that combines robust security features with high transaction efficiency. 

Taking from the [documentations](https://docs.viction.xyz/general/blockchain-platform-comparison/posv-consensus), Viction runs on the Proof-of-Stake Voting (PoSV) consensus, which is a PoS-based blockchain protocol with a fair voting mechanism, rigorous security guarantees, and uniform probability eventuality. The consensus has the following key novelties:

- Double Validation to strengthen security and reduce the risk of a blockchain fork
- Randomization provides security, and prevents handshaking attacks
- Fast confirmation time and efficient checkpoints for finality

The consensus process is designed to ensure fairness and reliability while maintaining decentralization. Here’s how it works:

1. **🛠️ Masternode Participation**: Viction operates a network of **150 Masternodes**, where token holders can stake a minimum of **50,000 VIC** tokens to become **Masternode candidates**.

2. **🗳️ Voting and Selection**: Token holders actively participate in the governance process by voting for **Masternode candidates**. The candidates receiving the most votes are elected as **Masternodes**.

3. **🔄 Block Creation and Double Validation**: Once elected, Masternodes take turns generating blocks in a **round-robin** manner. To enhance security, each block creation is verified by another randomly selected Masternode through a process called **_double validation_**.

4. **⚡ Rapid Finality**: This innovative consensus mechanism allows Viction to achieve impressive performance, processing up to **2,000 transactions per second (TPS)** with a **block confirmation time** of just **2 seconds**.

### Enhanced Security and Scalability

By leveraging double validation, Viction addresses common challenges faced by traditional proof-of-stake systems, such as potential collusion and nothing-at-stake attacks. This innovative approach ensures a high level of trust within the network, fostering a secure environment for users and developers alike. With Viction's ability to scale efficiently while maintaining security, the platform is well-equipped to support a wide array of applications, from finance to gaming and beyond. As more developers and projects join the Viction ecosystem, the network's potential for growth and innovation continues to expand, paving the way for the future of decentralized technology.

---




Proof of Stake (PoS) is a method used by some blockchains to validate transactions and keep the network secure. It’s different from the more commonly known Proof of Work (PoW), which requires a lot of computing power. Instead of using computers to solve complex puzzles, PoS allows people to earn rewards based on how much cryptocurrency they hold and are willing to "stake" or lock up.

How Does Proof of Stake Work?
Staking Your Coins: In PoS, if you want to help validate transactions and earn rewards, you first need to stake some of your coins. This means you lock them up in a special wallet, kind of like putting them in a savings account. The more coins you stake, the better your chances are of being selected to validate the next block of transactions.

Becoming a Validator: When it’s time to create a new block (which contains a group of transactions), the network randomly picks one of the stakers to be the validator. Your chances of being chosen depend on how many coins you’ve staked—more staked coins generally mean a higher chance of being selected.

Creating a New Block: If you are chosen as the validator, you get to propose a new block of transactions. Other validators will check your block to make sure everything is correct. If they agree that your block is valid, it gets added to the blockchain, and you earn a reward, usually in the form of transaction fees or new coins.

Keeping Everyone Honest: PoS has a built-in system to keep validators honest. If a validator tries to cheat or act maliciously (like trying to double-spend coins), they can lose a portion of their staked coins. This system, known as "slashing," makes validators think twice before doing anything dishonest.

Why Is Proof of Stake Important?
Less Energy Use: PoS is much more energy-efficient than PoW because it doesn’t require powerful computers to solve complex problems. This makes it better for the environment.
Security and Trust: Since validators have something to lose (their staked coins), they are motivated to act honestly and keep the network secure.
Accessibility: PoS allows more people to participate in securing the network without needing expensive mining equipment. Anyone with enough coins can become a validator.