## Example Smart Contract: SampleVRC25

To recap, VRC25 stands out as an innovative extension of the ERC20 token standard, designed to streamline transactions on the Viction network. Its key feature? Gasless transactions! By leveraging smart contract sponsorship of transaction fees, VRC25 removes a barrier for new blockchain users and fosters a smoother user experience.

Let's deploy a practical example of the VRC25 token standard on the Viction blockchain. Entire source code can be found from the official Viction Repository: [https://github.com/POLearn/victionary-everything-about-viction/blob/master/contract/POLVRC25.sol](https://github.com/POLearn/victionary-everything-about-viction/blob/master/contract/POLVRC25.sol)

![](https://raw.githubusercontent.com/POLearn/victionary-everything-about-viction/refs/heads/master/content/assets/images/vrc25_contract.png)

We can load the entire Solide IDE implementation with the `VRC25` and `VRC25Permit` implementation. If you want to take a look and understand the implementation you can view the implementation but this resource should provide sufficient information to understand the VRC25 token under the hood. By inheriting from both `VRC25` and `VRC25Permit`, the contract gains access to all the functionalities of the VRC25 standard, including token management and fee estimation. Additionally, the VRC25Permit extension empowers gasless transactions through off-chain signatures, significantly enhancing user convenience.

## Customizing Your VRC25 Token

![](https://raw.githubusercontent.com/POLearn/victionary-everything-about-viction/refs/heads/master/content/assets/images/vrc25_contstructor.png)

Taking a look at `Line 10`, you can modify within the constructor to set a more suitable name and symbol for your VRC25 token. Here's an example:

```solidity
constructor() public VRC25("Example Fungible Token", "EFT", 0)
```
### Deployment Considerations

- If you encounter an error message stating "Abstract contracts cannot have public constructors. Remove the 'public' keyword to fix this," you'll need to address this in the `VRC25Permit.sol` file.
- Simply remove the `public` keyword from the constructor within `VRC25Permit.sol`. Here's the corrected code:

```solidity
constructor() EIP712("VRC25", "1") { }
```

## Quest - Deploy your own VRC25 Token 🪙

![](https://raw.githubusercontent.com/POLearn/victionary-everything-about-viction/refs/heads/master/content/assets/images/vrc25_deploy.png)

To complete this submission, deploy the `POLVRC25.sol` contract from the provided template. Compile the contract using **Solidity version 0.8.19**. Again, if you encounter the error *"Abstract contracts cannot have public constructors"*, navigate to `VRC25Permit.sol` and remove the `public` keyword from the constructor as noted in *Deployment Considerations*

Once fixed, proceed with your deployment and congratulations. You’ve successfully deployed your VRC25 token on Viction! To complete this quest, share your **transaction hash** as proof of deployment.