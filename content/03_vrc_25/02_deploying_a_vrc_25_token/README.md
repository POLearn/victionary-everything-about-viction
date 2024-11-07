## Example Smart Contract: SampleVRC25

*Entire source code can be found from the official Viction Repository: https://github.com/BuildOnViction/vrc25/blob/main/contracts/tests/SampleVRC25.sol*

We can load the entire Solide IDE implementation with the `VRC25` and `VRC25Permit` implementation. If you want to take a look and understand the implementation you can view the implementation but this resource should provide sufficient information to understand the VRC25 token under the hood. 

Looking at `SampleVRC25.sol`, it implements the `VRC25Permit`, which implements `VRC25`, so the Sample Token will include all the token and permit methods for the token. For starters, we can edit Line 10 constructor parameters to a more appropriate token name and symbol

```
constructor() public VRC25("Example Fungible Token", "EFT", 0)
```

The `SampleVRC25` contract extends the functionality of the VRC25 token standard by integrating the `VRC25Permit` extension. This extension enables gasless transactions through off-chain signatures, enhancing user convenience and reducing transaction costs.


> For this submission, make deploy a VRC25 from the provided template. Make sure to deploy `SampleVRC25.sol`

> Compile it with version 0.8.19

> If you encounter an `Abstract contracts cannot have public constructors. Remove the "public" keyword to fix this.`. Goto the `VRC25Permit.sol` and remove the public keyword in the constractor. Here is the following,

```
constructor() public EIP712("VRC25", "1") { }
```