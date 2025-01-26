## Đi Sâu Hơn Về VRC25

Bây giờ chúng ta đã hiểu các nguyên lý cốt lõi của VRC25 và sự tương đồng của nó với ERC20, hãy cùng khám phá hai chức năng quan trọng làm nên sự khác biệt của VRC25 và nâng cao tính năng của nó: `issuer()` và `estimateFee()`.

## `issuer()`

```solidity
function issuer() external view returns (address);
```

Chức năng `issuer` xác minh địa chỉ của người phát hành token, đảm bảo chỉ người phát hành được chỉ định mới có thể quản lý các khoản phí giao dịch. Điều này tạo thêm một lớp bảo mật và trách nhiệm, duy trì tính toàn vẹn của token.
* **Đảm bảo tính xác thực:** Xác minh nguồn gốc thực sự của token và việc quản lý phí giao dịch đi kèm.
* **Tăng cường sự tin cậy:** Xây dựng niềm tin trong hệ sinh thái bằng cách xác định rõ ràng tổ chức chịu trách nhiệm quản lý các khoản phí giao dịch.

### `estimateFee()`

```solidity
function estimateFee(uint256 value) external view returns (uint256);
```

Chức năng `estimateFee` tính toán phí giao dịch bằng token VRC25, được thanh toán cho người phát hành token. Chức năng này cho phép cấu trúc phí tùy chỉnh, nâng cao tính linh hoạt cho người phát hành.
* **Tính toán chi phí giao dịch:** Trước khi thực hiện giao dịch, người dùng có thể ước tính phí VRC25 liên quan. Điều này cung cấp thông tin quý giá cho việc lập ngân sách và kế hoạch tài chính.
* **Tùy chỉnh cấu trúc phí:** Người phát hành có thể điều chỉnh linh hoạt cấu trúc phí dựa trên các yếu tố khác nhau, chẳng hạn như khối lượng giao dịch hoặc tắc nghẽn mạng.
* **Tăng cường tính minh bạch:** Bằng cách cung cấp ước tính phí giao dịch trước, VRC25 thúc đẩy tính minh bạch và sự tin cậy từ người dùng.