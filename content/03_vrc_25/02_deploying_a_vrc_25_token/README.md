## Setting up VRC25 with EIP-2612 (VRC25Permit)

The integration of VRC25Permit with Viction's VRC25 token offers a seamless gasless experience for users and applications, accessible in the IDE under `contracts/interfaces/IVRC25Permit.sol`. Traditionally, ERC-20 token transfers to contracts require a two-step process: approval and transfer, each needing blockchain transactions and gas fees. VRC25Permit simplifies this by combining approval and transfer into a single step through an off-chain signature, reducing transactions, lowering gas fees, and enhancing user convenience.

### Features of VRC25Permit

Examining the interface reveals two key methods crucial for enabling gasless token transactions:

- **Nonces:** The `nonces` function returns the current nonce for the token owner. Each successful call to `permit` increments this nonce, ensuring that every signature is unique and cannot be reused.

  ```solidity
  function nonces(address owner) external view returns (uint256);
  ```

- **Permit Function:** This function allows the token owner to authorize a spender to transfer tokens on their behalf. It verifies that the spender is a valid address, the deadline is a future timestamp, and the signature is valid using the current nonce of the owner. The `permit` function is the core feature of VRC25Permit, enabling token owners to sign off-chain approval messages. These messages specify the amount, recipient, and duration of the permission, providing security and transparency.

  ```solidity
  function permit(address owner, address spender, uint256 value, uint256 deadline, uint8 v, bytes32 r, bytes32 s) external;
  ```

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