# Tính Phí Giao Dịch Không Tốn Gas

Phần này rất quan trọng để duy trì khả năng cho phép giao dịch không tốn gas, điều này là yếu tố quan trọng trong việc tạo ra một trải nghiệm mượt mà và dễ sử dụng với token VRC25 của bạn. Hợp đồng **VicIssuer** bao gồm một phương thức gọi là `charge`, cho phép bạn thêm tiền vào khả năng của token. Bằng cách làm như vậy, bạn đảm bảo rằng token có thể liên tục hỗ trợ phí giao dịch, giữ cho trải nghiệm người dùng luôn mượt mà.

Phương thức `charge` rất đơn giản và hiệu quả. Nó nhận một địa chỉ đại diện cho token mà bạn muốn nạp lại và giá trị (bằng $VIC hoặc tương đương) mà bạn muốn gửi vào. Giá trị này sẽ được thêm vào trạng thái của token, tăng khả năng của token trong việc tài trợ cho các giao dịch không tốn gas. Đây là định nghĩa của phương thức:

```solidity
function charge(address token) public payable {
    tokensState[token] = tokensState[token].add(msg.value);
    emit Charge(msg.sender, token, msg.value);
}
```

Sau khi được thực thi, phương thức này cập nhật bản đồ `tokensState` và phát ra một sự kiện `Charge`, cho phép sự minh bạch và theo dõi dễ dàng các giao dịch nạp lại.