# Viction Dice Game Quest

Trong chủ đề thú vị này, bạn sẽ bắt đầu một hành trình để hiểu và tận dụng Hàm Ngẫu Nhiên Có Thể Xác Minh (VRRF) của Viction trong một hợp đồng thông minh trên blockchain Viction. Chúng ta sẽ xây dựng một hợp đồng thông minh Dice cho phép người dùng tung xúc xắc ảo và nhận kết quả ngẫu nhiên công bằng và có thể xác minh từ 1 đến 6.

## Mục Tiêu Học Tập:

- Nắm vững khái niệm VRF và vai trò của nó trong việc đảm bảo tính ngẫu nhiên trên blockchain.
- Khám phá mã hợp đồng thông minh Dice và các chức năng của nó.
- Triển khai hợp đồng Dice trên Viction Testnet.
- Tương tác với hợp đồng đã triển khai để trải nghiệm một lần tung xúc xắc có thể xác minh.

## VRRF là gì?

Hãy tưởng tượng một tình huống bạn đang chơi một trò chơi xúc xắc trên một nền tảng blockchain. Làm thế nào để bạn chắc chắn rằng lần tung xúc xắc thực sự ngẫu nhiên và không bị gian lận? Đó chính là VRRF, một anh hùng trong thế giới blockchain, được thiết kế đặc biệt cho mục đích này.

VRRF là viết tắt của Hàm Ngẫu Nhiên Có Thể Xác Minh. Đây là một loại hàm đặc biệt tạo ra các số ngẫu nhiên giả – các số có vẻ ngẫu nhiên nhưng thực ra được lấy từ một công thức toán học. Điểm mấu chốt ở đây là VRRF cung cấp hai tính năng quan trọng:

1. **Có Thể Xác Minh:** Bất kỳ ai cũng có thể xác minh rằng số ngẫu nhiên được tạo ra một cách công bằng và không bị thao túng. Sự minh bạch này rất quan trọng để xây dựng sự tin tưởng trong các ứng dụng blockchain.
2. **Ngẫu Nhiên Tương Đối:** Mặc dù không hoàn hảo về mặt toán học, VRRF tạo ra những kết quả không thể đoán trước và khó có thể đoán trước. Điều này đảm bảo sự công bằng trong các trò chơi, đấu giá và các ứng dụng khác dựa vào tính ngẫu nhiên.

## VRRF Hoạt Động Như Thế Nào?

VRRF kết hợp nhiều kỹ thuật thông minh để đạt được mục tiêu của mình:

* **Đầu Ra Quyết Định:** Với cùng một đầu vào, VRRF luôn tạo ra cùng một đầu ra. Điều này có vẻ mâu thuẫn với tính ngẫu nhiên, nhưng đây là chìa khóa để xác minh.
* **Không Thể Dự Đoán:** VRRF sử dụng sự kết hợp của nhiều yếu tố để tạo ra số ngẫu nhiên, bao gồm kết quả trước đó, các tham số trên chuỗi và một giá trị "muối" do người dùng cung cấp. Giá trị muối này giống như một nguyên liệu bí mật, khiến việc dự đoán kết quả gần như là không thể.
* **Kháng Thao Túng:** VRRF được thiết kế để chống lại các nỗ lực thao túng. Ngay cả khi ai đó cố gắng can thiệp vào quá trình, việc này có thể được phát hiện và ngăn chặn.
* **Xử Lý Trên Chuỗi:** VRRF hoạt động hoàn toàn trong một giao dịch blockchain duy nhất, đảm bảo quá trình nhanh chóng và bảo mật.

## Giao Diện VRRF

Để tận dụng sức mạnh của VRRF trong hợp đồng thông minh của bạn, bạn sẽ tương tác với một giao diện gọi là `IVRRF`. Giao diện này cung cấp một hàm duy nhất:

```solidity
interface IVRRF {
  /**
   * @notice Lấy số ngẫu nhiên giả dựa trên hạt giống đã cung cấp
   * @param salt Dữ liệu ngẫu nhiên như một đầu vào bổ sung để làm cứng tính ngẫu nhiên
   */
  function random(bytes32 salt) external returns(bytes32);
}
```

Hàm `random` này nhận một giá trị `bytes32 salt` làm đầu vào. Nhớ không? Đây là cơ hội của bạn để thêm một lớp tùy chỉnh vào tính ngẫu nhiên. Bạn có thể cung cấp một muối duy nhất cho mỗi lần tạo số ngẫu nhiên, làm tăng tính không thể đoán trước.

Hàm này sẽ trả về một số `bytes32`, bạn có thể sử dụng trong nhiều ứng dụng như:

* **Trò Chơi Xúc Xắc:** Tung một xúc xắc công bằng trong trò chơi blockchain của bạn.
* **Tạo NFT:** Tạo những đặc điểm độc đáo và không thể đoán trước cho các token không thể thay thế của bạn.
* **Chọn Ngẫu Nhiên:** Chọn người tham gia cho một cuộc xổ số hoặc rút thăm một cách minh bạch và có thể xác minh.

Bằng cách tích hợp VRRF, bạn có thể đảm bảo rằng các ứng dụng blockchain của mình không chỉ thú vị mà còn công bằng và đáng tin cậy đối với tất cả người dùng.

## Các Hợp Đồng VRRF

Để sử dụng VRRF trên Viction, bạn sẽ cần tương tác với hợp đồng `IVRRF` đã triển khai trên mạng lưới cụ thể (Mainnet hoặc Testnet) mà bạn đang làm việc. Dưới đây là bảng với các địa chỉ hợp đồng VRRF để bạn tham khảo:

| Mạng Lưới | Địa Chỉ |
|---|---|
| Mainnet | 0x53eDcf19e4fb242c9957CB449d2d4106fD760A7F |
| Testnet | 0xDb14c007634F6589Fb542F64199821c3308A9d92 |

Trong phần tiếp theo, chúng ta sẽ khám phá cách thiết lập hợp đồng thông minh của bạn để tương tác với VRRF và mở khóa tiềm năng của tính ngẫu nhiên công bằng và có thể xác minh trên blockchain Viction!