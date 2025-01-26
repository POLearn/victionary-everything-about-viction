### Triển Khai Hợp Đồng VRC725 NFT trên Viction Testnet

Khi đã hiểu về VRC725, hãy triển khai một hợp đồng NFT sử dụng tiêu chuẩn này. Chúng ta sẽ sử dụng hợp đồng từ kho mã nguồn chính thức của Viction. Hợp đồng `NFTMock.sol` tận dụng **VRC725Enumerable**, cung cấp các chức năng tương tự ERC721 nhưng được tối ưu hóa cho VRC725, cho phép tạo, chuyển nhượng và phê duyệt với các tính năng cấp phép bổ sung độc đáo của VRC725.

Hợp đồng `NFTMock` kế thừa từ `VRC725Enumerable`, tận dụng tiêu chuẩn VRC725 với khả năng liệt kê bổ sung. Quá trình khởi tạo hợp đồng theo một mẫu tương tự ERC721, nhưng đối với VRC725, nó sử dụng `__VRC725_init` để thiết lập chính xác. Sau khi triển khai, ABI của hợp đồng sẽ bao gồm tất cả các phương thức ERC721, cho phép tạo, chuyển nhượng, phê duyệt, cùng với các tính năng cấp phép bổ sung.

Hãy triển khai một ví dụ thực tế về tiêu chuẩn token `VRC725` trên blockchain Viction. Mã nguồn đầy đủ có thể được tìm thấy trong kho mã chính thức của Viction: [https://github.com/BuildOnViction/vrc725/blob/main/contracts/tests/NFTMock.sol](https://github.com/BuildOnViction/vrc725/blob/main/contracts/tests/NFTMock.sol)

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

## Quest - Triển Khai V725

Bạn có thể tải hợp đồng trên vào IDE hoặc môi trường mong muốn và biên dịch `NFTMock.sol` sử dụng **Phiên bản Solidity 0.8.19** và triển khai hợp đồng.

![](https://raw.githubusercontent.com/POLearn/victionary-everything-about-viction/refs/heads/master/content/assets/images/vrc25_contract.png)

![](https://raw.githubusercontent.com/POLearn/victionary-everything-about-viction/refs/heads/master/content/assets/images/vrc725_deploy.png)

Sau đó, để triển khai hợp đồng, hãy cung cấp các tham số sau cho token của nó:
- **Tên:** "POL VRC725"  
- **Ký hiệu:** "POL"  
- **Địa chỉ Issuer:** `0x8c0faeb5c6bed2129b8674f262fd45c4e9468bee`  

Điều quan trọng cần lưu ý ở đây là hợp đồng phải được đăng ký với hợp đồng Issuer của Viction. Trong trường hợp này, đó là `0x8c0faeb5c6bed2129b8674f262fd45c4e9468bee`. Chúng ta sẽ đi vào chi tiết hơn, nhưng về cơ bản, chủ sở hữu hợp đồng cần phải gửi 10+ $VIC để hỗ trợ và tài trợ phí gas cho người dùng của họ. Bằng cách cung cấp Địa chỉ Issuer, người dùng có thể tương tác và được tài trợ, tạo ra một trải nghiệm không mất gas cho các token và NFTs.

Sau khi triển khai, hợp đồng VRC725 NFT của bạn đã sẵn sàng để cách mạng hóa cách các NFT hoạt động trên Viction Testnet. Đừng quên gửi hash giao dịch của bạn để hoàn thành quest và thể hiện thành tích của bạn! 🎉