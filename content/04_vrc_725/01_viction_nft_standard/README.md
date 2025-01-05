# Exploring the IVRC725 Interface

The `IVRC725` interface defines the core functionalities of VRC725 tokens. Let's delve into two key functions:

```solidity
interface IVRC725 is IERC721, IERC4494, IERC721Metadata {
    function permitForAll(address owner, address spender, uint256 deadline, bytes memory signature) external;
    function nonceByAddress(address owner) external view returns(uint256);

}
```

The `permitForAll` function allows users to grant gasless approvals for NFT transfers via off-chain signatures, ensuring cost-effective, user-friendly interactions while incorporating a secure nonce mechanism to prevent replay attacks. The `nonceByAddress` function tracks the nonce for each owner, further enhancing transaction security by preventing the reuse of old signatures.

## `permitForAll`

```solidity
function permitForAll(address owner, address spender, uint256 deadline, bytes memory signature) external {
    require(deadline >= block.timestamp, 'VRC725: Permit deadline expired');
    bytes32 digest = _getPermitForAllDigest(spender, _noncesByAddress[owner], deadline);

    (address recoverAddress,, ) = ECDSA.tryRecover(digest, signature);
    require(
        recoverAddress == owner || SignatureChecker.isValidSignatureNow(owner, digest, signature),
        "VRC725: Invalid permit signature"
    );

    _setApprovalForAll(owner, spender, true);

    _noncesByAddress[owner]++;
}
```

The main implementation of IVRC725 `permitForAll` is using `ECDSA.tryRecover` to extract the address from the signature and digest, resulting in the `recoverAddress`. This address should match the owner's address if the signature is valid. This is ensured via the `require` statement, which confirms that the `recoverAddress` or `signature` matches the owner, thereby validating that the permit is genuinely authorized by the owner.

Additionally, the **nonce** is manually incremented here to prevent replay attacks by ensuring each permit request is unique. Since the owner's address is included in the digest, each time the method is called, the nonce increments, making old signatures invalid. This guarantees that each signature can only be used once, enhancing the security of the NFT.

## `nonceByAddress`

```solidity
function nonceByAddress(address owner) external view returns(uint256) {
    return _noncesByAddress[owner];
}
```

As mention the nonce is useful for tracking the number of permits issued for each token and address. In the case of the VRC725 implementation, this is stored as a `mapping` of an address to a `uint256` number to indicate the number of calls. This enhances the security and integrity of the permit mechanism within the contract.