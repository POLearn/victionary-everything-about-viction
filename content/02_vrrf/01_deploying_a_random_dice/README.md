## Dice Game

Let’s look at a practical example of using Viction's VRRF in a smart contract. In this scenario, we'll create a Dice smart contract that allows users to roll a virtual dice and receive a random outcome between 1 and 6 on chain. This application hopes to demonstrates how VRRF ensures that each roll is fair and verifiable, providing a manipulation-resistant source of randomness on-chain. By integrating VRRF into the smart contract, we can guarantee that every player experiences a truly random dice roll.

### Code 

The source code can be loaded in our IDE with this [Github source](https://github.com/POLearn/victionary-everything-about-viction/blob/master/contract/Dice.sol)

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

The `roll` function will simulates a dice roll within the smart contract. When executed, it captures the current block number and creates a salt from the hash of the previous block, enhancing randomness. It then calls the VRRF that is defined to obtain a pseudo-random number, which is converted to a value between 1 and 6 by taking the modulus and adding 1.

Similarly `rollWithSalt` function allows users to roll the dice using a custom salt, enabling controlled randomness. This is useful for applications requiring predictable outcomes when the same salt is used.

### Deploying on Viction Testnet

To get started, compile the Dice smart contract using Solidity version 0.8.19. If you’d like to see a reference, you can view an example deployment on the Viction Testnet.

When deploying on the Viction network, make sure to specify the network address. In this guide, we’ll deploy to Viction Testnet (chain ID 89). You can find more setup details here. In the contract’s constructor, use the Testnet VRRF address (0xDb14c007634F6589Fb542F64199821c3308A9d92) to link the VRRF to your Dice contract.

Congratulations! You've deployed on the Viction Testnet. Switching networks in MetaMask can allow you to test on different testnets or even deploy to the mainnet. Just ensure you have enough VIC tokens to cover the deployment costs.

> ❗**IMPORTANT**
> Make sure to complete the quest by providing the deployed transaction.