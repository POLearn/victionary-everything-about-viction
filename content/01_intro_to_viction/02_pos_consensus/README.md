## Bằng Chứng Cổ Phần (Proof of Stake - PoS) Tiếp Tục

Trong phần trước, chúng ta đã tìm hiểu về PoS như một cơ chế đồng thuận mà các blockchain sử dụng để xác thực giao dịch một cách hiệu quả và an toàn. Khác với hệ thống Bằng Chứng Công Việc (Proof of Work - PoW) tiêu tốn nhiều năng lượng, PoS cho phép người tham gia *stake* hoặc khóa tiền điện tử của mình để kiếm phần thưởng và giúp xác thực giao dịch. Trong PoS, các trình xác thực (validators) được chọn để tạo các khối giao dịch mới dựa trên số lượng tiền điện tử mà họ stake, với số tiền stake lớn hơn sẽ tăng khả năng được chọn. Mô hình này giảm tiêu thụ năng lượng, nâng cao bảo mật thông qua rủi ro bị phạt nếu không trung thực, và giúp việc tham gia trở nên dễ dàng hơn vì không yêu cầu thiết bị khai thác đắt đỏ.

## Cơ Chế Đồng Thuận của Viction

**Viction** sử dụng một cơ chế đồng thuận độc đáo **_Proof-of-Stake Voting (PoSV)_**, kết hợp các tính năng bảo mật mạnh mẽ với hiệu suất giao dịch cao. Theo [tài liệu](https://docs.viction.xyz/general/blockchain-platform-comparison/posv-consensus), Viction hoạt động dựa trên cơ chế Proof-of-Stake Voting (PoSV), một giao thức blockchain dựa trên PoS với cơ chế bỏ phiếu công bằng, đảm bảo bảo mật nghiêm ngặt, và tính xác suất đồng đều. Cơ chế đồng thuận này có các điểm nổi bật sau:

- Xác Thực Kép (Double Validation) để tăng cường bảo mật và giảm rủi ro phân nhánh blockchain
- Ngẫu Nhiên hóa (Randomization) để đảm bảo an toàn và ngăn chặn các cuộc tấn công bắt tay
- Thời gian xác nhận nhanh và các điểm kiểm tra hiệu quả để đạt được tính cuối cùng (finality)

Quá trình đồng thuận được thiết kế để đảm bảo tính công bằng và độ tin cậy trong khi duy trì sự phi tập trung. Đây là cách nó hoạt động:

1. **🛠️ Tham Gia Masternode**: Viction vận hành một mạng lưới gồm **150 Masternodes**, nơi các chủ sở hữu token có thể stake tối thiểu **50,000 VIC** để trở thành **ứng cử viên Masternode**.

2. **🗳️ Bỏ Phiếu và Lựa Chọn**: Các chủ sở hữu token tích cực tham gia vào quá trình quản trị bằng cách bỏ phiếu cho **các ứng cử viên Masternode**. Các ứng cử viên nhận được nhiều phiếu nhất sẽ được bầu làm **Masternodes**.

3. **🔄 Tạo Khối và Xác Thực Kép**: Khi được bầu, Masternodes lần lượt tạo khối theo hình thức **xoay vòng (round-robin)**. Để tăng cường bảo mật, mỗi khối được tạo sẽ được xác thực bởi một Masternode khác được chọn ngẫu nhiên thông qua quy trình gọi là **_xác thực kép (double validation)_**.

4. **⚡ Tính Cuối Cùng Nhanh**: Cơ chế đồng thuận tiên tiến này cho phép Viction đạt được hiệu suất ấn tượng, xử lý lên đến **2,000 giao dịch mỗi giây (TPS)** với thời gian **xác nhận khối** chỉ **2 giây**.

### Tăng Cường Bảo Mật và Khả Năng Mở Rộng

Bằng cách sử dụng xác thực kép, Viction giải quyết các thách thức thường gặp ở các hệ thống PoS truyền thống, như sự thông đồng tiềm tàng và các cuộc tấn công nothing-at-stake. Cách tiếp cận đổi mới này đảm bảo mức độ tin cậy cao trong mạng lưới, tạo môi trường an toàn cho người dùng và nhà phát triển. Với khả năng mở rộng hiệu quả trong khi duy trì bảo mật, nền tảng này được trang bị tốt để hỗ trợ một loạt các ứng dụng, từ tài chính đến trò chơi và hơn thế nữa. Khi ngày càng có nhiều nhà phát triển và dự án tham gia vào hệ sinh thái Viction, tiềm năng phát triển và đổi mới của mạng lưới tiếp tục mở rộng, mở đường cho tương lai của công nghệ phi tập trung.