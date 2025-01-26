# Tương Tác Với VRC25 Sử Dụng Viem: Hướng Dẫn Thực Hành

Trong phần này, chúng ta sẽ đi sâu vào các khía cạnh thực tế của việc tương tác với hợp đồng VRC25 trên blockchain Viction. Chúng ta sẽ sử dụng Viem, một thư viện JavaScript mạnh mẽ, để kết nối với blockchain và tương tác liền mạch với các hợp đồng thông minh.

## Cài Đặt Viem

Trước khi bắt đầu, hãy đảm bảo chúng ta có đầy đủ công cụ cần thiết. Viem có sẵn dưới dạng gói npm. Để cài đặt nó vào dự án của bạn, chỉ cần thực thi lệnh sau trong terminal:

```bash
npm install viem
```

## Kết Nối Với Viction

Bây giờ, chúng ta hãy thiết lập kết nối với mạng Viction. Chúng ta sẽ sử dụng hàm `createPublicClient` của Viem để tạo một đối tượng client:

```typescript
import { createPublicClient, http } from 'viem';
import { victionTestnet } from 'viem/chains'; // Sử dụng 'viction' cho mạng chính

const client = createPublicClient({
  chain: victionTestnet, 
  transport: http()
});
```

Đối tượng client này đóng vai trò như cổng kết nối tới blockchain Viction, cho phép bạn truy vấn dữ liệu chuỗi, gửi giao dịch và tương tác với hợp đồng thông minh.

## Đọc Dữ Liệu Từ Hợp Đồng VRC25

Hãy cùng xem cách đọc dữ liệu từ hợp đồng VRC25 sử dụng Viem. Chúng ta sẽ tập trung vào một trường hợp sử dụng phổ biến: truy xuất số dư token của một địa chỉ cụ thể.

```typescript
import { client } from './client' 
import { vrc25Abi } from './abi' 
import { contract } from './contract' 

const data = await publicClient.readContract({
  address: contract, 
  abi: vrc25Abi,
  functionName: 'balanceOf',
  args: ['0xd8dA6BF26964aF9D7eEd9e03E53415D37aA96045'] 
});
```

Trong đoạn mã này:

- `publicClient.readContract()` là một hàm mạnh mẽ cho phép chúng ta tương tác với các chức năng hợp đồng mà không làm thay đổi trạng thái của blockchain.
- Chúng ta chỉ định địa chỉ hợp đồng, ABI (Giao Diện Nhị Phân Ứng Dụng), tên chức năng (`balanceOf`), và địa chỉ mà chúng ta muốn lấy số dư.

## Tương Tác Với Token

Để thực hiện các hành động thay đổi trạng thái của blockchain (ví dụ: đúc token), chúng ta cần một ví điện tử. Hãy tạo một `walletClient` sử dụng Viem:

```typescript
import { createWalletClient, custom, http } from 'viem'
import { privateKeyToAccount } from 'viem/accounts'
import { viction } from 'viem/chains'

export const walletClient = createWalletClient({
  chain: viction, 
  transport: custom(window.ethereum) 
});
```

`walletClient` này cho phép chúng ta gửi giao dịch và tương tác với blockchain một cách an toàn.

Bây giờ, hãy sử dụng hàm `writeContract` để đúc các token mới:

```typescript
import { walletClient } from './config'
import { vrc25Abi } from './abi'
import { contract } from './contract'

await walletClient.writeContract({
  address: contract,
  abi: vrc25Abi,
  functionName: 'mint',
  args: ["0xd8dA6BF26964aF9D7eEd9e03E53415D37aA96045", 69420],
});
```

Đoạn mã này gửi một giao dịch tới hợp đồng VRC25, yêu cầu đúc 69420 token và gửi chúng đến địa chỉ đã chỉ định.

Viem cung cấp một cách dễ sử dụng và hiệu quả để tương tác với Viction và các hợp đồng thông minh của nó. Bằng cách làm theo các bước này, bạn có thể kết nối liền mạch với blockchain, đọc dữ liệu và thực thi giao dịch một cách dễ dàng. Điều này giúp bạn xây dựng các ứng dụng sáng tạo trên mạng Viction, đồng thời tận hưởng trải nghiệm giao dịch mượt mà mà tiêu chuẩn VRC25 mang lại.