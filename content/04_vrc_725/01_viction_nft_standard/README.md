# 探索 IVRC725 接口

`IVRC725` 接口定义了 VRC725 代币的核心功能。让我们深入了解两个关键功能：

```solidity
interface IVRC725 is IERC721, IERC4494, IERC721Metadata {
    function permitForAll(address owner, address spender, uint256 deadline, bytes memory signature) external;
    function nonceByAddress(address owner) external view returns(uint256);
}
```

`permitForAll` 函数允许用户通过链下签名授予 NFT 转移的免气费授权，从而确保低成本、用户友好的交互，并结合安全的 nonce 机制以防止重放攻击。`nonceByAddress` 函数跟踪每个拥有者的 nonce，进一步增强了交易安全性，防止旧签名的重用。

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

IVRC725 `permitForAll` 的主要实现使用 `ECDSA.tryRecover` 从签名和摘要中提取地址，得到 `recoverAddress`。如果签名有效，这个地址应该与拥有者的地址匹配。通过 `require` 语句来确保 `recoverAddress` 或 `signature` 与拥有者匹配，从而验证该授权确实得到了拥有者的授权。

此外，**nonce** 在这里被手动递增，以防止重放攻击，确保每个授权请求是唯一的。由于拥有者的地址包含在摘要中，每次调用该方法时，nonce 会递增，使旧签名无效。这样可以确保每个签名只能使用一次，从而增强 NFT 的安全性。

## `nonceByAddress`

```solidity
function nonceByAddress(address owner) external view returns(uint256) {
    return _noncesByAddress[owner];
}
```

正如所提到的，nonce 在跟踪每个代币和地址已发出的授权数量时非常有用。在 VRC725 实现中，这被存储为一个地址到 `uint256` 数字的 `mapping`，表示调用次数。这增强了合约内授权机制的安全性和完整性。