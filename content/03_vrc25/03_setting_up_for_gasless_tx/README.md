## Setting up for VRC Gasless

Once a the VRC25 token has been deployed, let's create and use another address, *Address Y*, and fund it with using [Viction Testnet Faucet](https://faucet-testnet.viction.xyz/).

With this funding, we can mint the sample VRC25 token to *Address Y*. While this initial interaction will incur gas fees, the minted tokens will enable Address Y to participate in token burning. In the next steps, we will apply Viction's Issuer functionality to allow Address Y to burn tokens without incurring gas fees (as well as minting), making the process https://raw.githubusercontent.com/solide-project/awesome-learn-solidity/vic and cost-effective.

![Mint](https://raw.githubusercontent.com/solide-project/awesome-learn-solidity/vic/main/exploring-viction-ecosystem/deploying-gasless-vrc25/assets/mint.png)

## Conclusion

The VRC25 standard introduces advanced token management features while conforming to the familiar ERC20 structure, ensuring compatibility and ease of integration. With unique methods like `issuer` and `estimateFee`, VRC25 enhances security, transparency, and user control, making it a robust solution for token operations on the Viction blockchain. The following guide will focus on another smart contract known as the `VicIssuer` which delves into the integration for enabling gasless operations.