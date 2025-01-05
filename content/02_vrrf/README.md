# Viction Dice Game Quest

In this exciting topic, you'll embark on a journey to understand and leverage Viction's Verifiable Relatively Random Function (VRRF) in a smart contract on the Viction blockchain. We'll build a Dice smart contract that allows users to roll a virtual dice and receive a fair and verifiable random outcome between 1 and 6.

## Learning Objectives:

- Gain a solid understanding of VRF and its role in ensuring randomness on-chain.
- Explore the Dice smart contract code and its functionalities.
- Deploy the Dice contract on the Viction Testnet.
- Interact with the deployed contract to experience a verifiable dice roll.

## What is VRRF?

Imagine a scenario where you're playing a dice game on a blockchain platform. How can you be sure the dice roll is truly random and hasn't been tampered with? Enter VRRF, a hero in the blockchain world, designed specifically for this purpose.

VRRF stands for Verifiable Relatively Random Function. It's a special type of function that generates pseudo-random numbers – numbers that appear random but are actually derived from a mathematical formula. The key here is that VRRF offers two crucial features:

1. **Verifiable:**  Anyone can verify that the random number was generated fairly and hasn't been manipulated. This transparency is essential for building trust in blockchain applications.
2. **Relatively Random:** While not mathematically perfect, VRRF produces unpredictable results that are difficult to guess beforehand. This ensures fairness in games, auctions, and other applications that rely on randomness.

## How Does VRRF Work?

VRRF combines several clever techniques to achieve its goals:

* **Deterministic Outputs:**  For the same inputs, VRRF always produces the same output. This might seem counterintuitive for randomness, but it's the key to verification.
* **Unpredictability:** VRRF uses a combination of factors to generate the random number, including previous results, on-chain parameters, and a user-provided "salt" value. This salt acts like a secret ingredient, making it nearly impossible to predict the outcome.
* **Manipulation Resistance:** VRRF is designed to be resistant to manipulation attempts. Even if someone tries to tamper with the process, it can be detected and prevented.
* **On-chain Processing:** VRRF operates entirely within a single blockchain transaction, ensuring a fast and secure process.

## VRRF Interface

To leverage VRRF's power in your smart contracts, you'll interact with an interface called `IVRRF`. This interface provides a single function:

```solidity
interface IVRRF {
  /**
   * @notice Get pseudo-random number base on provided seed
   * @param salt Random data as an additional input to harden the random
   */
  function random(bytes32 salt) external returns(bytes32);
}
```

This `random` function takes a `bytes32 salt` value as input. Remember the salt? It's your chance to add a layer of customization to the randomness. You can provide a unique salt for each random number generation, further enhancing unpredictability.

The function then returns a `bytes32` number, which you can use in various applications like:

* **Dice Games:** Roll a fair dice in your blockchain-based game.
* **NFT Generation:** Create unique and unpredictable traits for your non-fungible tokens.
* **Random Selection:** Select participants for a lottery or raffle in a transparent and verifiable manner.

By integrating VRRF, you can ensure that your blockchain applications are not only engaging but also fair and trustworthy for all users.

## VRRF Contracts

To utilize VRRF on Viction, you'll need to interact with the deployed `IVRRF` contract on the specific network (Mainnet or Testnet) you're working with. Here's a table with the VRRF contract addresses for your reference:

| Network | Address |
|---|---|
| Mainnet | 0x53eDcf19e4fb242c9957CB449d2d4106fD760A7F |
| Testnet | 0xDb14c007634F6589Fb542F64199821c3308A9d92 |

In the next section, we'll explore how to set up your smart contract to interact with VRRF and unlock the potential of fair and verifiable randomness on the Viction blockchain!
