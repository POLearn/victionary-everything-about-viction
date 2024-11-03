## Proof of Stake (PoS) Cont.

In the previous, we explored PoS as a consensus mechanism that blockchains use to validate transactions efficiently and securely. Unlike the energy-intensive Proof of Work (PoW) system, PoS allows participants to *stake* or lock up their cryptocurrency to earn rewards and help validate transactions. In PoS, validators are chosen to create new transaction blocks based on the amount of cryptocurrency they stake, with more staked funds increasing their selection chances. This model reduces energy consumption, enhances security through a risk of penalties for dishonesty, and enables more accessible participation since no costly mining equipment is required.

## Viction's Consensus Mechanism

**Viction** uses a unique **_Proof-of-Stake Voting (PoSV)_** consensus mechanism that combines robust security features with high transaction efficiency. Taken from the [documentations](https://docs.viction.xyz/general/blockchain-platform-comparison/posv-consensus), Viction runs on the Proof-of-Stake Voting (PoSV) consensus, which is a PoS-based blockchain protocol with a fair voting mechanism, rigorous security guarantees, and uniform probability eventuality. The consensus has the following key novelties:

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