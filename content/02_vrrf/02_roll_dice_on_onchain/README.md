# Sẵn Sàng Lăn Sò?

Nếu bạn là người mới trong việc triển khai hợp đồng thông minh, đừng lo lắng! Chúng ta có thể tận dụng hợp đồng Dice hiện có. Đây là những gì bạn cần làm:

## Tải Hợp Đồng

Truy cập vào [Solide IDE](https://solide0x.tech/address/89/0x42f8A200d7c7BF4FC6aa435ac0c13E0caF40E06D) và tương tác với hợp đồng tại địa chỉ này: `0x42f8A200d7c7BF4FC6aa435ac0c13E0caF40E06D`.

## Lăn Sò!

Nhấp vào chức năng `roll` trong IDE. Điều này sẽ khởi tạo một giao dịch mô phỏng việc lăn súc sắc. Việc xác nhận có thể mất vài giây do quá trình hoạt động của VRRF.

![](https://raw.githubusercontent.com/POLearn/victionary-everything-about-viction/refs/heads/master/content/assets/images/dice_roll.png)

*Lưu ý rằng kết quả sẽ thay đổi sau vài giây. Theo tài liệu Viction, cần lưu ý rằng *VRRF phụ thuộc vào thứ tự gọi giao dịch, các giao thức sử dụng VRRF phải chờ một khoảng thời gian ngắn (khoảng 8-10 giây) trước khi hiển thị kết quả ngẫu nhiên cho người dùng cuối để tránh các vấn đề liên quan đến việc tái tổ chức khối.*

## Hiểu Về Sự Kiện Lăn Sò

Hợp đồng phát ra một `RollEvent` mỗi khi một lần lăn súc sắc được thực hiện. Hãy truy cập vào hợp đồng Dice trên Vicscan và khám phá tab *Event* để tìm sự kiện này. Sự kiện này chứa chìa khóa để giải mã giá trị lăn:

```
0x0000000000000000000000000000000000000000000000000000000000fa8674b6c634d1fa355a3b605f762247847be8da437e46c55627c8ed747367298250e40000000000000000000000000000000000000000000000000000000000000001
```

Bằng cách giải mã dữ liệu này, chúng ta khám phá ra giá trị lăn là **2**. Ngoài ra, sự kiện này cung cấp một giá trị VRRF thô được ký hiệu bằng khóa `n`. Giá trị `bytes32` này có thể được chuyển đổi thành một số chuẩn (`uint256`) cho các thao tác trên chuỗi, như được thể hiện trong hợp đồng Dice. (Bạn có thể tìm ảnh chụp màn hình của Log Sự Kiện Lăn [ở đây](https://raw.githubusercontent.com/solide-project/awesome-learn-solidity/master/main/exploring-viction-ecosystem/build-with-viction-vrrf/assets/logs.png) để tham khảo).

![](https://raw.githubusercontent.com/POLearn/victionary-everything-about-viction/refs/heads/master/content/assets/images/dice_log.png)

## Sức Mạnh của VRRF

VRRF nổi bật như một giải pháp đáng tin cậy và có thể xác minh được để tạo ra số ngẫu nhiên trên blockchain Viction. Đây là lý do tại sao nó lại có giá trị:

* **Ngẫu Nhiên Có Thể Xác Minh:** Ai cũng có thể xác nhận rằng số được tạo ra thực sự ngẫu nhiên và không bị can thiệp, tạo dựng lòng tin trong các ứng dụng blockchain.
* **Tích Hợp Mượt Mà:** VRRF tích hợp dễ dàng với hợp đồng thông minh, cho phép xử lý giá trị ngẫu nhiên hiệu quả trên chuỗi.
* **Chi Phí Thấp:** VRRF cung cấp một cách tạo số ngẫu nhiên an toàn và hiệu quả chi phí trong hợp đồng thông minh.

## Ứng Dụng VRRF: Vượt Ra Ngoài Trò Chơi Súc Sắc

Mặc dù trò chơi súc sắc làm nổi bật tiềm năng vui nhộn của VRRF, nhưng các trường hợp sử dụng của nó còn vượt xa hơn thế. VRRF cho phép phân phối công việc công bằng, đảm bảo rằng phần thưởng hoặc nhiệm vụ được phân bổ minh bạch và không thiên vị. Nó cũng là động lực cho việc đúc NFT không thể đoán trước, thêm một lớp ngẫu nhiên và bất ngờ vào việc tạo ra các bộ sưu tập độc đáo.

> ❗**Đừng quên**
> Đối với lần nộp bài này, hãy cung cấp giao dịch của việc gọi phương thức `roll` trong Dice đã được triển khai trên Viction.