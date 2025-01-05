### Deploying a VRC725 NFT Contract on Viction Testnet

Given that we understand aobut VRC725, lets deploy a NFT contract using the standard. We are taking this contract from the offical Viction Repo. The `NFTMock.sol` contract leverages **VRC725Enumerable**, providing functionality similar to ERC721 but tailored to VRC725 allowing for minting, transferring, and approval capabilities, with additional permit functionalities unique to VRC725.  

The `NFTMock` contract inherits from `VRC725Enumerable`, leveraging the VRC725 standard with added enumerable capabilities. The contract initialization follows a pattern similar to ERC721, but for VRC725, it uses `__VRC725_init` for proper setup. After deployment, the ABI will include all ERC721 methods, enabling minting, transferring, approving, with the addition permit functionalities.

Let's deploy a practical example of the `VRC725` token standard on the Viction blockchain. Entire source code can be found from the official Viction Repository: [https://github.com/BuildOnViction/vrc725/blob/main/contracts/tests/NFTMock.sol](https://github.com/BuildOnViction/vrc725/blob/main/contracts/tests/NFTMock.sol)

```solidity
contract NFTMock is VRC725Enumerable {
    constructor(string memory name, string memory symbol, address issuer) {
        __VRC725_init(name, symbol, issuer);
    }

    function mint(address owner, uint256 tokenId) external onlyOwner {
        _safeMint(owner, tokenId);
    }
}
```
## Quest - Deploy V725

You can load the above contract in a desired IDE or environment and compile `NFTMock.sol` using **Solidity version 0.8.19** and deploy the contract.

![](https://raw.githubusercontent.com/POLearn/victionary-everything-about-viction/refs/heads/master/content/assets/images/vrc25_contract.png)

![](https://raw.githubusercontent.com/POLearn/victionary-everything-about-viction/refs/heads/master/content/assets/images/vrc725_deploy.png)

Then to deploy the contract, provide the following as its token parameters.
- **Name:** "POL VRC725"  
- **Symbol:** "POL"  
- **Issuer Address:** `0x8c0faeb5c6bed2129b8674f262fd45c4e9468bee`  

What's important to note here is the is, the contract must be registered with the Viction Issuer contract. In this case its the `0x8c0faeb5c6bed2129b8674f262fd45c4e9468bee`. We will go through in more detail,  But essentially,  the contract owner needs to deposit 10+ $VIC to support and sponsor gas fees for their users. By providing the Issuer Address, users can interact and be spsonsored making it gasless experience for tokens and NFTs.

Once deployed, your VRC725 NFT contract is ready to revolutionize how NFTs operate on the Viction Testnet. Don’t forget to submit your transaction hash to complete the quest and showcase your achievement! 🎉