# Đúc Token Cho Giao Dịch Không Tốn Gas

Với VRC25 mới triển khai của bạn, chúng ta có thể thấy token hoạt động thực tế bằng cách đúc token vào một Địa Chỉ gọi là Địa Chỉ Y. Với khoản tiền này, chúng ta có thể đúc token mẫu VRC25 vào *Địa Chỉ Y*. Mặc dù tương tác ban đầu sẽ phát sinh phí gas, các token đã được đúc sẽ cho phép Địa Chỉ Y tham gia vào việc đốt token. Trong phần Issuer của Viction trong khóa học này, chúng ta sẽ áp dụng chức năng Issuer của Viction để cho phép Địa Chỉ Y đốt token mà không tốn phí gas (cũng như đúc token), làm cho quá trình trở nên https://raw.githubusercontent.com/solide-project/awesome-learn-solidity/vic và tiết kiệm chi phí.

## Cung Cấp Quỹ Cho Địa Chỉ Y

Truy cập [Viction Testnet Faucet](https://faucet-testnet.viction.xyz/) để gửi các token này đến địa chỉ nhận mà bạn mong muốn, Địa Chỉ Y. Khoản tiền cung cấp ban đầu này sẽ được sử dụng cho giao dịch đúc token đầu tiên, có thể phát sinh phí gas tùy theo điều kiện mạng. Tuy nhiên, các token được đúc sau đó sẽ được hưởng lợi từ giao dịch không tốn gas.

## Nhiệm Vụ - Đúc Token

Trong nhiệm vụ này, bạn sẽ đúc `100000000000000000000` token vào Địa Chỉ Y.

![](https://raw.githubusercontent.com/POLearn/victionary-everything-about-viction/refs/heads/master/content/assets/images/vrc25_mint.png)

Tiêu chuẩn VRC25 giới thiệu các tính năng quản lý token tiên tiến trong khi tuân thủ cấu trúc ERC20 quen thuộc, đảm bảo khả năng tương thích và dễ dàng tích hợp. Với các phương thức độc đáo như `issuer` và `estimateFee`, VRC25 nâng cao tính bảo mật, minh bạch và kiểm soát người dùng, khiến nó trở thành một giải pháp mạnh mẽ cho các hoạt động token trên blockchain Viction. Hướng dẫn dưới đây sẽ tập trung vào một hợp đồng thông minh khác được gọi là `VicIssuer`, đi sâu vào việc tích hợp để cho phép các giao dịch không tốn gas.