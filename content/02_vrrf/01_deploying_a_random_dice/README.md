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

The following code serves a contract that represent a functioning dice,

* **Core Functionality (`roll()` function):** This function simulates a dice roll. It captures the current block number and creates a special value called "salt" from the previous block's hash, adding an extra layer of randomness. VRRF is then called to generate a pseudo-random number, which is converted into a value between 1 and 6, representing the dice roll outcome.
* **Customizable Randomness (`rollWithSalt()` function):** This function provides more control for specific scenarios. Users can provide their own "salt" value, influencing the random outcome. This can be useful for testing purposes where predictable results are desired.

### Quest - Deploying the Dice Contract on Viction Testnet 🎲

Start by loading the [Dice contract](https://github.com/POLearn/victionary-everything-about-viction/blob/master/contract/Dice.sol) and loading it into your preferred IDE. 

![](https://raw.githubusercontent.com/POLearn/victionary-everything-about-viction/refs/heads/master/content/assets/images/dice_contract.png)

Your first task is to modify the contract by adding the `IVRRF` interface at the top. This interface allows the contract to request randomness securely from Viction’s VRRF service. Next, you’ll implement the `roll()` function, which will interact with VRRF to produce random values—an essential feature for the Dice contract. If you need guidance, check out the [Viction Testnet example](https://testnet.vicscan.xyz/address/0x845B5EaF9D75215E08896a5c96B416640F6b1F55).  

![](https://raw.githubusercontent.com/POLearn/victionary-everything-about-viction/refs/heads/master/content/assets/images/dice_deploy.png)

Once you’ve updated the code, compile the contract using **Solidity version 0.8.19**. Pay attention to any errors during compilation and resolve them. This step ensures your contract is ready for deployment on the Viction Testnet.  

*If you’d like to see a reference, you can view an [example](https://testnet.vicscan.xyz/address/0x845B5EaF9D75215E08896a5c96B416640F6b1F55) deployment on the Viction Testnet.*

Make sure you have enough **VIC tokens** in your wallet to cover the deployment fees. Once deployed, note the contract’s address and transaction hash. You can verify your deployment on the [Viction Testnet Explorer](https://testnet.vicscan.xyz/).  

You’ve successfully deployed your Dice contract on Viction Testnet! To complete this quest, share your **transaction hash** as proof of deployment. Doing so will earn you a special **NFT POAP reward** for completing this course.  