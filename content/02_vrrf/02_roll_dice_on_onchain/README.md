### Rolling the on chain Dice

If you haven't deployed a Dice contract in our previouslt, you can want to use an existing contract. Just load `0x42f8A200d7c7BF4FC6aa435ac0c13E0caF40E06D` into an IDE, or use [Solide IDE](https://solide0x.tech/address/89/0x42f8A200d7c7BF4FC6aa435ac0c13E0caF40E06D). Then click on `roll` method and it should execute with a confirmed transacton. Note, that the result will change upon after a few seconds. According to the Viction documentation it is good to note that *VRRF relies on the order of calling transaction, protocols who make use of VRRF must wait for a short period of time (say 8-10 seconds) before displaying random result to end-users to avoid issues related to block re-org.*

### Debugging the `roll()`

To retrieve and debug the roll value, the contract emits a `RollEvent` event that can be decoded to get the desired value. By navigating to the Dice contract on Vicscan and checking the *Event* tab, you can find the emitted event. Regardless of whether the contract is verified or unverified, you can decode the provided data. For example, consider the following data:

```
0x000000000000000000000000000000000000000000000000000000000074a7b9fccbcb761acbe15e37f7956d80da55f601cf9444bc439ddadba7b93b32648a190000000000000000000000000000000000000000000000000000000000000002
```

This data decodes to a roll value of 2. Additionally, you can view the raw value of the VRRF emitted with the key `n`. This value is a `bytes32` type (`114342912035737238189353812130102868447094573821621668253466625880326790220313`), which can be translated to a `uint256` as shown in the Dice Contract.

![Roll Event Log](https://raw.githubusercontent.com/solide-project/awesome-learn-solidity/master/main/exploring-viction-ecosystem/build-with-viction-vrrf/assets/logs.png)

## Conclusion

VRRF (Verifiable Random Function) offers a robust solution for generating verifiable random numbers on the Viction. Its seamless integration and on-chain processing capabilities make it an great for applications such as games, distributing tasks, or minting NFTs, ensuring reliable and unbiased randomness.

By leveraging VRRF, smart contracts can obtain a pseudo-random `bytes32` value, which can be easily converted to a `uint256`. This conversion is perfect for on-chain randomness, providing a cost-effective and secure method within a smart contract. VRRF's reliability and efficiency make it a valuable tool for any blockchain application requiring dependable random number generation.

> ❗**IMPORTANT**
> For this submission, provide the transaction of the invokation of the `roll` method in the Dice deployed on Viction.