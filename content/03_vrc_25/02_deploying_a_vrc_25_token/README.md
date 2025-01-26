## Hợp Đồng Thông Minh Ví Dụ: SampleVRC25

Tóm lại, VRC25 nổi bật như một mở rộng sáng tạo của tiêu chuẩn token ERC20, được thiết kế để đơn giản hóa các giao dịch trên mạng Viction. Tính năng chính của nó? Giao dịch không tốn gas! Bằng cách tận dụng việc hợp đồng thông minh tài trợ phí giao dịch, VRC25 loại bỏ một rào cản đối với người dùng blockchain mới và tạo ra một trải nghiệm người dùng mượt mà hơn.

Hãy triển khai một ví dụ thực tế về tiêu chuẩn token VRC25 trên blockchain Viction. Toàn bộ mã nguồn có thể tìm thấy trong Kho Lưu Trữ Chính Thức của Viction: [https://github.com/POLearn/victionary-everything-about-viction/blob/master/contract/POLVRC25.sol](https://github.com/POLearn/victionary-everything-about-viction/blob/master/contract/POLVRC25.sol)

![](https://raw.githubusercontent.com/POLearn/victionary-everything-about-viction/refs/heads/master/content/assets/images/vrc25_contract.png)

Chúng ta có thể tải toàn bộ triển khai Solide IDE với các triển khai `VRC25` và `VRC25Permit`. Nếu bạn muốn xem và hiểu về triển khai, bạn có thể xem trực tiếp mã nguồn, nhưng tài nguyên này sẽ cung cấp đủ thông tin để hiểu về token VRC25. Bằng cách kế thừa cả `VRC25` và `VRC25Permit`, hợp đồng có quyền truy cập vào tất cả các tính năng của tiêu chuẩn VRC25, bao gồm quản lý token và ước tính phí. Thêm vào đó, phần mở rộng VRC25Permit giúp giao dịch không tốn gas thông qua chữ ký ngoài chuỗi, nâng cao đáng kể sự tiện lợi cho người dùng.

## Tùy Chỉnh Token VRC25 Của Bạn

![](https://raw.githubusercontent.com/POLearn/victionary-everything-about-viction/refs/heads/master/content/assets/images/vrc25_contstructor.png)

Khi xem `Dòng 10`, bạn có thể sửa đổi trong constructor để đặt tên và ký hiệu phù hợp hơn cho token VRC25 của mình. Dưới đây là một ví dụ:

```solidity
constructor() public VRC25("Example Fungible Token", "EFT", 0)
```

### Cân Nhắc Triển Khai

- Nếu bạn gặp phải thông báo lỗi "Hợp đồng trừu tượng không thể có constructor công khai. Xóa từ khóa 'public' để sửa lỗi này," bạn cần giải quyết vấn đề này trong tệp `VRC25Permit.sol`.
- Đơn giản chỉ cần xóa từ khóa `public` khỏi constructor trong `VRC25Permit.sol`. Dưới đây là mã đã được sửa:

```solidity
constructor() EIP712("VRC25", "1") { }
```

## Nhiệm Vụ - Triển Khai Token VRC25 Của Bạn 🪙

![](https://raw.githubusercontent.com/POLearn/victionary-everything-about-viction/refs/heads/master/content/assets/images/vrc25_deploy.png)

Để hoàn thành bài nộp này, triển khai hợp đồng `POLVRC25.sol` từ mẫu có sẵn. Biên dịch hợp đồng sử dụng **phiên bản Solidity 0.8.19**. Lại một lần nữa, nếu bạn gặp phải lỗi *"Hợp đồng trừu tượng không thể có constructor công khai"*, hãy vào tệp `VRC25Permit.sol` và xóa từ khóa `public` khỏi constructor như đã lưu ý trong *Cân Nhắc Triển Khai*.

Sau khi sửa xong, tiến hành triển khai và chúc mừng bạn. Bạn đã triển khai thành công token VRC25 của mình trên Viction! Để hoàn thành nhiệm vụ này, hãy chia sẻ **hash giao dịch** của bạn làm bằng chứng triển khai.