## Example Smart Contract: VRC725 NFT

Below is an example of an NFT smart contract using VRC725, named `NFTMock.sol`, which can be found on the official [Viction Repository on GitHub](https://github.com/BuildOnViction/vrc725/blob/main/contracts/tests/NFTMock.sol):

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

The `NFTMock` contract inherits from `VRC725Enumerable`, leveraging the VRC725 standard with added enumerable capabilities. The contract initialization follows a pattern similar to ERC721, but for VRC725, it uses `__VRC725_init` for proper setup. After deployment, the ABI will include all ERC721 methods, enabling minting, transferring, approving, with the addition permit functionalities.
## Setting up for VRC Gasless

Once the VRC725 token has been deployed, developers can set up their NFT contract on Viction for gasless transactions, similar to VRC25 tokens. An in-depth guide is available [here](https://dapp.solide0x.tech/learn/exploring-viction-ecosystem). Essentially, the contract must be registered with the Viction Issuer contract, and the contract owner needs to deposit 10+ $VIC to support and sponsor gas fees for their users.