# Tài khoản EOA và Tài khoản Hợp đồng Thông minh trên Viction

Trong hệ sinh thái blockchain của Viction, có hai loại tài khoản chính: **Tài khoản do bên ngoài sở hữu (Externally Owned Accounts - EOAs)** và **Tài khoản Hợp đồng Thông minh (Smart Contract Accounts)**. Hiểu cách chúng hoạt động là chìa khóa để tương tác với mạng lưới và xây dựng các ứng dụng phi tập trung (dApps) một cách hiệu quả.

## Tài khoản do bên ngoài sở hữu (EOAs) 📒

**EOA** là một tài khoản đơn giản do người dùng kiểm soát, giữ token gốc **VIC** và có thể khởi tạo giao dịch. EOAs được quản lý bằng các khóa riêng, có nghĩa là chỉ những người có quyền truy cập vào khóa riêng mới có thể ký và ủy quyền các giao dịch.

- **Các đặc điểm chính của EOAs**:
  - **Do người dùng kiểm soát**: EOAs được kiểm soát bởi người dùng thông qua các khóa riêng, thường được quản lý bằng các ví như MetaMask hoặc ví phần cứng.
  - **Khởi tạo giao dịch**: EOAs có thể gửi VIC, tương tác với các hợp đồng thông minh và bỏ phiếu cho các Masternodes trong cơ chế đồng thuận PoSV của Viction.
  - **Không có mã lập trình**: EOAs không có khả năng lập trình, nghĩa là chúng không thể thực thi mã trên blockchain; chúng chỉ gửi giao dịch hoặc tương tác với các hợp đồng thông minh.

EOAs là loại tài khoản đơn giản nhất trên Viction và rất quan trọng cho người dùng khi tương tác với mạng lưới hoặc dApps. Các giao dịch từ EOAs yêu cầu người dùng phải ký bằng khóa riêng của họ để xác nhận bất kỳ hành động nào, chẳng hạn như gửi token hoặc thực thi các chức năng trong một hợp đồng thông minh.

## Tài khoản Hợp đồng Thông minh 📜

**Tài khoản Hợp đồng Thông minh**, ngược lại, là một tài khoản có khả năng lập trình được kiểm soát bởi mã thay vì khóa riêng. Hợp đồng thông minh trên Viction được triển khai lên blockchain bởi các EOAs và được thực thi bởi Viction Virtual Machine (VVM).

- **Các đặc điểm chính của Tài khoản Hợp đồng Thông minh**:
  - **Logic lập trình**: Hợp đồng thông minh có thể tự động hóa các chức năng phức tạp như giao thức DeFi, NFT hoặc logic của dApps bằng cách thực thi mã khi các điều kiện nhất định được đáp ứng.
  - **Tương tác với EOAs**: Hợp đồng thông minh không thể tự khởi tạo giao dịch; chúng phản hồi các giao dịch được khởi tạo bởi EOAs.
  - **Thực thi tự động**: Một khi được triển khai, hợp đồng thông minh sẽ chạy tự động theo mã của nó, điều này có nghĩa là chúng không thể bị can thiệp và chỉ có thể thay đổi nếu được lập trình cụ thể.

## Sự khác biệt giữa EOAs và Tài khoản Hợp đồng Thông minh

| Tính năng              | Tài khoản do bên ngoài sở hữu (EOA)         | Tài khoản Hợp đồng Thông minh            |
|------------------------|--------------------------------------------|------------------------------------------|
| **Kiểm soát bởi**      | Khóa riêng                                  | Mã Hợp đồng Thông minh                   |
| **Có thể khởi tạo giao dịch?** | Có                                        | Không (chỉ phản hồi giao dịch đến)        |
| **Lập trình được?**     | Không                                      | Có, có thể thực thi các hoạt động phức tạp |
| **Ứng dụng ví dụ**      | Gửi VIC, tương tác với hợp đồng thông minh  | Tự động hóa giao thức DeFi, xử lý NFT    |

## Cách chúng hoạt động cùng nhau trên Viction

EOAs rất cần thiết cho người dùng để tương tác với mạng lưới Viction, trong khi các hợp đồng thông minh cho phép nhà phát triển xây dựng dApps và các dịch vụ phi tập trung. Ví dụ:
- Một người dùng có EOA có thể khởi tạo một giao dịch đến một hợp đồng thông minh DeFi, kích hoạt các chức năng tự động như staking hoặc cung cấp thanh khoản.
- Các hợp đồng thông minh sau đó có thể thực hiện các hoạt động như chuyển token hoặc thực hiện các lượt bỏ phiếu quản trị, tất cả trong khi dựa vào EOAs để khởi tạo các tương tác.

Cùng nhau, **EOAs** và **Tài khoản Hợp đồng Thông minh** tạo nên nền tảng của các ứng dụng phi tập trung và các tương tác blockchain trên Viction, mang lại một hệ sinh thái linh hoạt và có thể mở rộng cho cả nhà phát triển và người dùng.

Hiểu rõ sự khác biệt giữa EOAs và hợp đồng thông minh là chìa khóa để điều hướng nền tảng Viction, dù bạn là nhà phát triển xây dựng dApps hay người dùng tương tác với các dịch vụ phi tập trung.