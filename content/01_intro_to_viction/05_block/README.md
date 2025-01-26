# Các khối

Một khối trong blockchain Viction (hoặc bất kỳ blockchain nào) là một đơn vị cơ bản của blockchain, bao gồm thông tin giao dịch quan trọng cùng với tham chiếu đến khối trước đó. Thiết kế này tạo ra một chuỗi các khối, tạo ra một bản ghi bảo mật và không thể thay đổi của tất cả các giao dịch. Vì vậy, một *"khối" - chuỗi*. Mỗi khối được liên kết với nhau, với hash của khối trước được nhúng bên trong, đảm bảo rằng mọi thay đổi đối với một khối sẽ yêu cầu sửa đổi tất cả các khối tiếp theo. Cơ chế này không chỉ tăng cường bảo mật mà còn củng cố tính toàn vẹn của toàn bộ mạng lưới blockchain, giúp nó chống lại sự giả mạo và gian lận.

### Các thành phần chính của một khối Ethereum

![](https://lh7-us.googleusercontent.com/eln9I9CHeqGPvgib8ZW-L9l55ZZvKVDWCCdwiGySv5D465LhB8siEG734vbi_nMNx0459yjBQTrG8itmKdOd-hL4JwMkIEJ0esHzX9qqnRT9KiAa87vZxPVJ24bh8tJftC5J6ZEPeTK_pYuQPZuwiGI)

1. **Tiêu đề Khối**

Tiêu đề khối chứa các thông tin quan trọng cho blockchain Viction:

- **Hash (Trước)** 🔗: Liên kết đến khối trước để bảo mật.
- **Dấu thời gian** ⏰: Chỉ ra thời gian khi khối được tạo.
- **Merkle Root** 🌳: Đại diện cho tất cả các giao dịch trong khối.
- **Nonce** 🔍: Một giá trị được các thợ mỏ sử dụng để giải quyết câu đố proof-of-work.

2. **Thân Khối**

- **Dữ liệu Khối** 📊: Lưu trữ chi tiết giao dịch theo một định dạng có cấu trúc.
- **Cây Merkle** 🌲: Sắp xếp dữ liệu giao dịch một cách hiệu quả để xác minh.
- **Mã giao dịch** 🆔: Các định danh duy nhất cho từng giao dịch trong khối.

### Phân tích các khối trên Viction

![](https://raw.githubusercontent.com/POLearn/victionary-everything-about-viction/refs/heads/master/assets/blocks.png)

Phân tích các khối trên blockchain Viction cung cấp những cái nhìn quý giá về hoạt động giao dịch và hiệu suất mạng. Mỗi khối được cấu trúc tỉ mỉ, với một tiêu đề liên kết nó với khối trước đó, đảm bảo một sổ cái bảo mật và không thể thay đổi. Bằng cách kiểm tra thân khối, người dùng có thể tìm hiểu chi tiết giao dịch được tổ chức trong cây Merkle, giúp xác minh hiệu quả.

> Để khám phá tất cả các khối đã được khai thác của Viction, hãy truy cập liên kết sau: [Vicscan Blocks](https://www.vicscan.xyz/blocks).

Nếu chúng ta xem xét một khối ví dụ, chẳng hạn [#85453443](https://www.vicscan.xyz/block/85453443)

Chúng ta có thể thấy rằng đây là khối thứ 85,453,443 trong blockchain của Viction. Mỗi khối trong blockchain được đánh số theo thứ tự, cho phép người dùng theo dõi lịch sử các giao dịch và thay đổi trong mạng lưới.

![](https://raw.githubusercontent.com/POLearn/victionary-everything-about-viction/refs/heads/master/assets/header.png)

- **Chiều cao Khối**: Chiều cao khối, hay số khối, chỉ ra vị trí của một khối cụ thể trong blockchain.
- **Kỷ nguyên**: Một khoảng thời gian hoặc kỳ hạn trong đó một số lượng khối nhất định được khai thác; trong Viction, nó được tính là `BlockHeight / 900`, dẫn đến `ceil(85453443/900) = 94949`.
- **Dấu thời gian**: Cho thấy khoảng thời gian kể từ khi khối được tạo.
- **Giao dịch**: Tổng số giao dịch trong khối, bao gồm các giao dịch nội bộ phát sinh từ việc thực thi hợp đồng có giá trị Ether.
- **Hash**: Hash của tiêu đề khối hiện tại.
- **Parent Hash**: Hash của khối trước, còn được gọi là khối cha.
- **State Root**: Căn rễ của trie trạng thái.
- **Người tạo**: Người sản xuất khối.
- **Validator**: Người xác nhận kiểm tra lại khối.
- **Phí**: Tổng phí giao dịch cho tất cả giao dịch trong khối.
- **Gas Đã sử dụng**: Tổng số đơn vị gas tiêu thụ bởi khối.
- **Giới hạn Gas**: Giới hạn gas tối đa cho khối.
- **Tính hoàn thiện**: Phần trăm các masternode trong mạng đồng ý về khối này.
- **Độ khó tổng cộng**: Độ khó tích lũy của chuỗi cho đến khối này.
- **Kích thước**: Kích thước của khối được xác định bởi giới hạn gas của khối.
- **Dữ liệu bổ sung**: Mọi dữ liệu bổ sung được thêm vào bởi người sản xuất khối.

![](https://raw.githubusercontent.com/POLearn/victionary-everything-about-viction/refs/heads/master/assets/block-transactions.png)

Hơn nữa, thân khối chứa tất cả các giao dịch đại diện cho các hoạt động cốt lõi trong mạng lưới, chẳng hạn như chuyển tài sản, tương tác với hợp đồng, hoặc cập nhật dữ liệu. Trong khối cụ thể này, có ba giao dịch, cho thấy một loạt các hoạt động diễn ra trong blockchain Viction. Mỗi giao dịch là một bản ghi của một sự kiện. Những giao dịch này không chỉ đóng góp vào hoạt động chung trong mạng lưới mà còn tăng cường tính minh bạch và trách nhiệm giải trình, vì chúng được ghi lại bảo mật và có thể xác minh bởi bất kỳ ai phân tích blockchain.