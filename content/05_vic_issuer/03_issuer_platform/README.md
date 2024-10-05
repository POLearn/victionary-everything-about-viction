If you go back to the VRC25 Token and load the VRC25 token. Lets go Address Y from before, or a different address that has some tokens minted. We can test the gasless, by burning some of the token.

Once that been completed, we can take a look at the transaction hash. An gas less burn can used for this resource can be found here: [0xbbd4b30b530093b1e6b1cd169680f389624b0aaf5092cd9b1bd93d106238608d](https://testnet.vicscan.xyz/tx/0xbf8187748ee442c4c2163e6a0e927571145762b19ae96b6d3848cf066f8fb481). From the image transaction in the explorer we can see, the transaction type is **gas sponsored**.

![Gas Sponsor](https://raw.githubusercontent.com/solide-project/awesome-learn-solidity/vic/main/exploring-viction-ecosystem/deep-dive-viction-issuer/assets/gas-sponsor.png)

If you take a look in the address in the explorer or your wallet. The address will still have there entire amount of VIC.

![After](https://raw.githubusercontent.com/solide-project/awesome-learn-solidity/vic/main/exploring-viction-ecosystem/deep-dive-viction-issuer/assets/after.png)

## Conclusion

The VICIssuer platform simplifies the creation and management of VRC25 tokens, making it accessible to users of all technical backgrounds. By leveraging innovative features like gasless transactions and fee sponsorship, VICIssuer enhances user experience and streamlines blockchain interactions. While this guide provides an overview of the key functionalities, the real magic happens under the hood, offering a transparent way to understand how contracts can use sponsored gas to improve user experience. Explore these features further by visiting the [VICIssuer Testnet](https://issuer-testnet.viction.xyz/).

For a practical example, check out the Gas Zero token used in this guide at the following address: 0xc5632d3194f5337e3b31562b560d3db599769127. You can also verify the successful application of gasless integration on the issuer page.