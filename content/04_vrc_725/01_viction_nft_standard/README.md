# Khám Phá Giao Diện IVRC725

Giao diện `IVRC725` xác định các chức năng cốt lõi của token VRC725. Hãy cùng khám phá hai chức năng chính:

```solidity
interface IVRC725 is IERC721, IERC4494, IERC721Metadata {
    function permitForAll(address owner, address spender, uint256 deadline, bytes memory signature) external;
    function nonceByAddress(address owner) external view returns(uint256);
}
```

Chức năng `permitForAll` cho phép người dùng cấp quyền phê duyệt không mất gas cho việc chuyển nhượng NFT thông qua chữ ký ngoài chuỗi, đảm bảo các tương tác tiết kiệm chi phí và thân thiện với người dùng, đồng thời kết hợp cơ chế nonce bảo mật để ngăn chặn các cuộc tấn công replay. Chức năng `nonceByAddress` theo dõi nonce cho mỗi chủ sở hữu, tăng cường bảo mật giao dịch bằng cách ngăn chặn việc tái sử dụng các chữ ký cũ.

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

Triển khai chính của `permitForAll` trong IVRC725 sử dụng `ECDSA.tryRecover` để trích xuất địa chỉ từ chữ ký và digest, dẫn đến `recoverAddress`. Địa chỉ này phải khớp với địa chỉ của chủ sở hữu nếu chữ ký hợp lệ. Điều này được đảm bảo thông qua câu lệnh `require`, xác nhận rằng `recoverAddress` hoặc `chữ ký` khớp với chủ sở hữu, từ đó xác thực rằng giấy phép thực sự được cấp bởi chủ sở hữu.

Ngoài ra, **nonce** được tăng thủ công ở đây để ngăn chặn các cuộc tấn công replay, đảm bảo mỗi yêu cầu giấy phép là duy nhất. Vì địa chỉ của chủ sở hữu được bao gồm trong digest, mỗi lần phương thức được gọi, nonce sẽ tăng, làm cho các chữ ký cũ trở nên vô hiệu. Điều này đảm bảo rằng mỗi chữ ký chỉ có thể được sử dụng một lần, tăng cường bảo mật cho NFT.

## `nonceByAddress`

```solidity
function nonceByAddress(address owner) external view returns(uint256) {
    return _noncesByAddress[owner];
}
```

Như đã đề cập, nonce hữu ích trong việc theo dõi số lượng giấy phép đã cấp cho mỗi token và địa chỉ. Trong triển khai VRC725, điều này được lưu trữ dưới dạng một `mapping` của một địa chỉ tới một số `uint256` để chỉ ra số lần gọi. Điều này tăng cường bảo mật và tính toàn vẹn của cơ chế giấy phép trong hợp đồng.