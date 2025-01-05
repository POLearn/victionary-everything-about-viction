# Minting Token for Gasless Transaciton 

With your newly deployed VRC25, we can see the token in action, by minting to an Address called Address Y. With this funding, we can mint the sample VRC25 token to *Address Y*. While this initial interaction will incur gas fees, the minted tokens will enable Address Y to participate in token burning. In the Vic Issuer section of this course, we will apply Viction's Issuer functionality to allow Address Y to burn tokens without incurring gas fees (as well as minting), making the process https://raw.githubusercontent.com/solide-project/awesome-learn-solidity/vic and cost-effective.

## Fund Address Y

Access the [Viction Testnet Faucet](https://faucet-testnet.viction.xyz/) to . Send these tokens to your desired recipient address, Address Y. This initial funding will be used for the first minting transaction, which might incur a gas fee depending on network conditions. However, subsequently minted tokens will benefit from gasless transactions.

## Quest - Mint

In this quest, you'll mint `100000000000000000000` woth of the tokens to Address Y.

![](https://raw.githubusercontent.com/POLearn/victionary-everything-about-viction/refs/heads/master/content/assets/images/vrc25_mint.png)

The VRC25 standard introduces advanced token management features while conforming to the familiar ERC20 structure, ensuring compatibility and ease of integration. With unique methods like `issuer` and `estimateFee`, VRC25 enhances security, transparency, and user control, making it a robust solution for token operations on the Viction blockchain. The following guide will focus on another smart contract known as the `VicIssuer` which delves into the integration for enabling gasless operations.