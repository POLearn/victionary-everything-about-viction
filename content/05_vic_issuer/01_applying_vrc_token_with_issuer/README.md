## Đăng Ký Giao Thức Zero Gas

Khi bạn triển khai hoặc đăng ký VRC25 của mình trên Viction, nó sẽ không tự động đủ điều kiện cho các giao dịch không tốn gas. Để kích hoạt tính năng này, bạn cần đăng ký *Giao Thức Zero Gas*. Trong phần này, chúng ta sẽ khám phá cách thực hiện điều này thông qua hợp đồng thông minh VicIssuer, cung cấp cái nhìn về cách hoạt động của VIC Issuer.

Để tiếp tục, tải hợp đồng VIC Issuer, biên dịch và triển khai nó sử dụng địa chỉ nhà phát hành đã chỉ định trước đó. Đối với testnet, sử dụng `0x8c0faeb5c6bed2129b8674f262fd45c4e9468bee`.

![](https://raw.githubusercontent.com/POLearn/victionary-everything-about-viction/refs/heads/master/content/assets/images/issuer_contract.png)

*Ngoài ra, bạn có thể truy cập trực tiếp thông qua IDE của chúng tôi - [https://solide0x.tech/address/89/0x8c0faeb5c6bed2129b8674f262fd45c4e9468bee](https://solide0x.tech/address/89/0x8c0faeb5c6bed2129b8674f262fd45c4e9468bee)*

Sau khi tải hợp đồng vào IDE, gọi giá trị `minCap`. Nó nên được thiết lập là `10000000000000000000`, tương đương với 10 token VIC. Những token này được yêu cầu làm tiền gửi để đăng ký giao dịch không tốn gas. Giá trị này sẽ quan trọng vì nó cần được truyền dưới dạng `msg.value` khi gọi `apply` và do đó áp dụng token VRC25 vào Zero Gas Integration.

```
10 $VIC * 18 (số thập phân) = 10000000000000000000 wei
```

![](https://raw.githubusercontent.com/POLearn/victionary-everything-about-viction/refs/heads/master/content/assets/images/issuer_mincap.png)

## Nhiệm Vụ - Đăng Ký VRC25 của bạn vào VicIssuer

![](https://raw.githubusercontent.com/POLearn/victionary-everything-about-viction/refs/heads/master/content/assets/images/issuer_apply.png)

Bạn có thể kích hoạt giao dịch không tốn gas cho token VRC25 của mình bằng cách triển khai token và gọi phương thức `apply`. Quá trình này cho phép token hỗ trợ các thao tác không tốn gas, giúp giao dịch mượt mà và thân thiện hơn với người dùng. Đảm bảo bao gồm một khoản tiền gửi 10 VIC trong bước này, sẽ được sử dụng để tài trợ cho phí gas. Điều này đảm bảo rằng tất cả giao dịch đều không tốn gas, nâng cao trải nghiệm người dùng.

Bạn (hoặc bất kỳ ai) có thể chọn thực hiện khoản tiền gửi này ở giai đoạn sau, nhưng nên kết hợp nó ngay trong quá trình triển khai ban đầu. Bạn có thể kiểm tra chi tiết trên trình duyệt blockchain để xác nhận rằng token VRC25 của bạn đã được thiết lập thành công cho giao dịch không tốn gas.

#### Xác Minh Token

Nếu bạn gọi phương thức `tokens()`, bạn có thể xác nhận việc bao gồm token của mình trong danh sách của VIC Issuer. Địa chỉ của token mà bạn đã đăng ký sẽ xuất hiện trong danh sách trả về. Đảm bảo rằng địa chỉ token mà bạn đăng ký có mặt trong danh sách token.

![](https://raw.githubusercontent.com/POLearn/victionary-everything-about-viction/refs/heads/master/content/assets/images/issuer_tokens.png)

Nếu mọi thứ đã được thiết lập chính xác, bạn cũng có thể xác minh trạng thái của token trên **Bảng Điều Khiển Nhà Phát Hành**. Truy cập [https://issuer.viction.xyz](https://issuer.viction.xyz) cho mainnet hoặc [https://issuer-testnet.viction.xyz](https://issuer-testnet.viction.xyz) cho testnet.  

Để tham khảo, đây là token đã được đăng ký trong khóa học này:  
[Token Đã Đăng Ký Mẫu](https://issuer-testnet.viction.xyz/token/0xbba5098BF9c7726EC69C7BE3AE35C10DDC0B866a)

![](https://raw.githubusercontent.com/POLearn/victionary-everything-about-viction/refs/heads/master/content/assets/images/issuer_dashboard.png)

## Đã Xảy Ra Điều Gì?

Một khía cạnh quan trọng của việc tạo ra một token không tốn gas là *đăng ký* token vào VicIssuer. Điều này có nghĩa là thiết lập địa chỉ token.

```solidity
function apply(address token) public payable onlyValidCapacity(token) {
    AbstractTokenTRC21 t = AbstractTokenTRC21(token);
    require(t.issuer() == msg.sender);
    _tokens.push(token);
    tokensState[token] = tokensState[token].add(msg.value);
    emit Apply(msg.sender, token, msg.value);
}
```

Tại `Dòng 98` là triển khai của phương thức `apply`. Lưu ý chỉ có chủ sở hữu token (hoặc `issuer`) mới có thể đăng ký token vào Issuer. Sau đó, chúng ta thấy token được thêm vào `_tokens`, là danh sách tất cả các token đã đăng ký cho giao dịch không tốn gas và cập nhật trạng thái phát hành (`tokensState`) với số Ether đã cung cấp (`msg.value`). Bước này thực tế đăng ký nhà phát hành token vào hợp đồng `VRC25Issuer`, cho phép các hoạt động liên quan đến việc quản lý token và thu phí sau này.