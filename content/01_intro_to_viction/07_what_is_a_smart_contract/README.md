# Viction - Ngôn Ngữ Hợp Đồng Thông Minh 🛠️

Chào mừng bạn đến với thế giới của Viction! Trong chương này, chúng ta sẽ khám phá những kiến thức cơ bản về việc viết hợp đồng thông minh trên blockchain Viction. Hướng dẫn này sẽ cung cấp cho bạn hiểu biết vững chắc về cách bắt đầu, cùng với một ví dụ đơn giản để minh họa các khái niệm. Để biết thêm chi tiết và thông số kỹ thuật, đừng quên kiểm tra phần Tài Liệu Tham Khảo ở cuối!

Viction là một blockchain tương thích với EVM được thiết kế để giúp các nhà phát triển tạo ra các hợp đồng thông minh có thể chạy mượt mà trên nền tảng của nó. Mặc dù được xây dựng với Viction trong tâm trí, tính linh hoạt của nó cho phép sử dụng trên các môi trường blockchain khác nhau. Mạng Viction hỗ trợ các phiên bản mới nhất của Ethereum Virtual Machine (EVM), đảm bảo tính tương thích và dễ sử dụng cho các nhà phát triển quen thuộc với Ethereum.

## Viết Hợp Đồng Thông Minh Đầu Tiên Của Bạn ✍️

Hãy cùng khám phá một ví dụ đơn giản về hợp đồng thông minh trên Viction. Ví dụ này sẽ minh họa cách tạo ra một hệ thống quản lý hồ sơ người dùng cơ bản. Đoạn mã dưới đây mang tính chất giáo dục, vì vậy hãy thoải mái thử nghiệm và học hỏi! 🚀

```solidity
pragma solidity ^0.8.0;            // (bắt buộc) chỉ định phiên bản Solidity

contract Crowdfunding {                // (tùy chọn) định nghĩa hợp đồng thông minh
    mapping(address => uint) public contributions; // theo dõi các đóng góp từ mỗi địa chỉ
    uint public goal;                    // mục tiêu gây quỹ
    uint public totalContributions;       // tổng số đóng góp đã thu
    address public owner;                 // chủ sở hữu hợp đồng

    constructor(uint _goal) {            // constructor để thiết lập mục tiêu gây quỹ
        goal = _goal;
        owner = msg.sender;              // thiết lập chủ sở hữu hợp đồng
    }

    // Hàm để đóng góp vào dự án gây quỹ
    function contribute() public payable {
        require(msg.value > 0, "Đóng góp phải lớn hơn 0."); // xác nhận đóng góp hợp lệ
        contributions[msg.sender] += msg.value;  // ghi nhận đóng góp
        totalContributions += msg.value;          // cập nhật tổng đóng góp
    }

    // Hàm kiểm tra xem mục tiêu đã đạt được chưa
    function isGoalReached() public view returns (bool) {
        return totalContributions >= goal;       // trả về true nếu đạt mục tiêu
    }

    // Hàm rút tiền (chỉ chủ sở hữu mới có thể rút)
    function withdraw() public {
        require(msg.sender == owner, "Chỉ chủ sở hữu mới có thể rút."); // kiểm tra xem người gửi có phải là chủ sở hữu không
        require(isGoalReached(), "Mục tiêu phải đạt được để rút tiền."); // đảm bảo mục tiêu đã đạt được
        payable(owner).transfer(totalContributions); // chuyển tiền cho chủ sở hữu
    }
}
```

## Các Tính Năng Chính Của Hợp Đồng Này 🔑

1. **Mục Tiêu Gây Quỹ**: Hợp đồng thiết lập một mục tiêu gây quỹ cần đạt được trước khi có thể rút tiền. Điều này thúc đẩy tính minh bạch và trách nhiệm.
2. **Hàm Đóng Góp**: Hàm `contribute` cho phép người dùng gửi ETH vào dự án gây quỹ. Các đóng góp được ghi nhận cho từng người dùng, giúp theo dõi tiến độ gây quỹ.
3. **Kiểm Tra Mục Tiêu**: Hàm `isGoalReached` kiểm tra xem tổng số đóng góp có đạt hoặc vượt quá mục tiêu gây quỹ hay không, giúp người tham gia biết liệu dự án có khả thi hay không.
4. **Rút Tiền**: Hàm `withdraw` cho phép chủ sở hữu hợp đồng rút tiền chỉ khi mục tiêu đã được đạt, đảm bảo quyền lợi của những người đóng góp.

## Tại Sao Hợp Đồng Thông Minh Quan Trọng

Hợp đồng thông minh là các thỏa thuận tự thực thi chạy trên blockchain. Chúng cho phép các tương tác không cần niềm tin, giúp người dùng tham gia mà không cần đến các bên trung gian. Nền tảng Viction hỗ trợ các ứng dụng phi tập trung (dApps) có thể cách mạng hóa các ngành công nghiệp bằng cách đơn giản hóa các quy trình và nâng cao tính minh bạch.

Bằng cách thành thạo hợp đồng thông minh trên Viction, bạn có thể đóng góp vào một hệ sinh thái đang phát triển của các giải pháp phi tập trung. Hãy sáng tạo, xây dựng các dApps đổi mới và khai thác sức mạnh của công nghệ blockchain.