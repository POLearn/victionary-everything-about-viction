# Ready to Roll?

If you're new to deploying smart contracts, fret not! We can leverage an existing Dice contract. Here's what you'll need to do:

## Load the Contract

Head over to [Solide IDE](https://solide0x.tech/address/89/0x42f8A200d7c7BF4FC6aa435ac0c13E0caF40E06D) and interact with the contract at this address: `0x42f8A200d7c7BF4FC6aa435ac0c13E0caF40E06D`.

## Roll the Dice!

Click on the `roll` function within the IDE. This will initiate a transaction simulating a dice roll. Confirmation might take a few seconds due to VRRF's workings.

![](https://raw.githubusercontent.com/POLearn/victionary-everything-about-viction/refs/heads/master/content/assets/images/dice_roll.png)

*Note, that the result will change upon after a few seconds. According to the Viction documentation it is good to note that *VRRF relies on the order of calling transaction, protocols who make use of VRRF must wait for a short period of time (say 8-10 seconds) before displaying random result to end-users to avoid issues related to block re-org.*

## Understanding the Roll Event

The contract emits a `RollEvent` whenever a dice roll is executed. Let's navigate to the Dice contract on Vicscan and explore the *Event* tab to find this emitted event. This event holds the key to decoding the roll value:

```
0x0000000000000000000000000000000000000000000000000000000000fa8674b6c634d1fa355a3b605f762247847be8da437e46c55627c8ed747367298250e40000000000000000000000000000000000000000000000000000000000000001
```

By decoding this data, we discover the roll value to be **2**. Additionally, the event provides a raw VRRF value denoted by the key `n`. This `bytes32` value can be converted to a standard number (`uint256`) for on-chain operations, as demonstrated in the Dice contract itself. (You can find a screenshot of the Roll Event Log [here](https://raw.githubusercontent.com/solide-project/awesome-learn-solidity/master/main/exploring-viction-ecosystem/build-with-viction-vrrf/assets/logs.png) for reference).

![](https://raw.githubusercontent.com/POLearn/victionary-everything-about-viction/refs/heads/master/content/assets/images/dice_log.png)

## The Power of VRRF

VRRF shines as a reliable and verifiable solution for generating random numbers on the Viction blockchain. Here's why it's so valuable:

* **Verifiable Randomness:**  Anyone can confirm that the generated number is truly random and hasn't been tampered with, fostering trust in blockchain applications.
* **Seamless Integration:** VRRF integrates effortlessly with smart contracts, enabling efficient on-chain processing of random values.
* **Cost-Effective:** VRRF provides a secure and cost-effective way to generate random numbers within smart contracts.

## VRRF Applications: Beyond Dice Games

While dice games highlight VRRF's fun potential, its use cases go much further. VRRF enables fair task distribution, ensuring rewards or assignments are allocated transparently and without bias. It also powers unpredictable NFT minting, adding an exciting layer of randomness and surprise to the creation of unique collectibles.

> ❗**Don't forget**
> For this submission, provide the transaction of the invokation of the `roll` method in the Dice deployed on Viction.