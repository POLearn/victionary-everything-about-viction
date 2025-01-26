# Trie Trạng Thái (State Trie)

Khi tìm hiểu về Viction (hoặc blockchain nói chung), một khái niệm quan trọng cần nắm là **Trie Trạng Thái**. Đây là một cấu trúc dữ liệu cơ bản giúp lưu trữ và quản lý **trạng thái** của blockchain một cách hiệu quả. Hãy tưởng tượng blockchain như một cơ sở dữ liệu, nơi ghi nhận tất cả số dư tài khoản và các giao dịch. Nó là một phần của giao thức Viction và đóng vai trò cốt lõi trong việc duy trì trạng thái hiện tại của tất cả tài khoản, số dư, dữ liệu lưu trữ và các thông tin khác.

### Trie là gì?
Quay lại khái niệm cơ bản trong Khoa học Máy tính hoặc cấu trúc dữ liệu, một [trie](https://en.wikipedia.org/wiki/Trie) là một loại *cấu trúc cây* giúp lưu trữ và truy xuất dữ liệu một cách hiệu quả. Trie đặc biệt hữu ích khi bạn cần tra cứu thông tin nhanh chóng, và đó chính xác là điều mà Ethereum cần khi phải quản lý hàng ngàn tài khoản và giao dịch.

Trie trạng thái có thể được xem như một cấu trúc ánh xạ mà:
- **Key**: Địa chỉ tài khoản.
- **Value**: Trạng thái tài khoản, bao gồm các chi tiết như nonce, số dư, và nhiều thông tin khác.

Ví dụ về thông tin của một tài khoản:

```json
{
  "address": "0x123...",
  "nonce": 5,
  "balance": "",
  "storage": {}
}
```

Đối tượng này đại diện cho trạng thái tài khoản được liên kết với địa chỉ cụ thể. Tuy nhiên, do việc lưu trữ tất cả dữ liệu này trong mỗi block sẽ không hiệu quả, chỉ **hash gốc** (root hash) của trie trạng thái được đưa vào phần tiêu đề của mỗi block. Hash gốc này đóng vai trò như một cam kết về dữ liệu bên trong trie cho block cụ thể đó. 

Ví dụ, trong [Block 85453443](https://www.vicscan.xyz/block/85453443) trên Viction, block chứa một state root là một hash của thông tin block, đảm bảo rằng mọi thay đổi đối với trạng thái tài khoản trong quá trình xử lý giao dịch đều được phản ánh chính xác. Điều này cho phép các nút (nodes) xác minh tính toàn vẹn của blockchain và kiểm tra trạng thái tài khoản một cách hiệu quả thông qua **Merkle proofs**, duy trì sự tin cậy vào dữ liệu của mạng lưới đồng thời đảm bảo khả năng mở rộng.