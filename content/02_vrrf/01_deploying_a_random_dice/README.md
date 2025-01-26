## Trò Chơi Xí Ngầu

Hãy cùng xem một ví dụ thực tế về việc sử dụng VRRF của Viction trong hợp đồng thông minh. Trong kịch bản này, chúng ta sẽ tạo một hợp đồng thông minh Xí Ngầu cho phép người dùng lắc một viên xí ngầu ảo và nhận kết quả ngẫu nhiên từ 1 đến 6 trên chuỗi. Ứng dụng này nhằm minh họa cách VRRF đảm bảo mỗi lần lắc là công bằng và có thể xác minh, cung cấp một nguồn ngẫu nhiên chống giả mạo trên chuỗi. Bằng cách tích hợp VRRF vào hợp đồng thông minh, chúng ta có thể đảm bảo rằng mỗi người chơi đều có trải nghiệm lắc xí ngầu thực sự ngẫu nhiên.

### Mã Nguồn

Mã nguồn có thể được tải vào IDE của chúng ta qua [Nguồn Github](https://github.com/POLearn/victionary-everything-about-viction/blob/master/contract/Dice.sol)

```solidity
contract Dice {
    IVRRF public immutable vrrf;

    event RollEvent(uint256 timestamp, uint256 n, uint256 value);

    constructor(address _vrrf) {
        vrrf = IVRRF(_vrrf);
    }

    function roll() public returns (uint8) {
        uint256 ts = block.number;
        bytes32 salt = blockhash(ts - 1);
        uint256 n = uint256(vrrf.random(salt));
        uint8 value = uint8((n % 6) + 1);
        emit RollEvent(ts, n, value);
        return value;
    }

    function rollWithSalt(bytes32 salt) public returns (uint8) {
        uint256 n = uint256(vrrf.random(salt));
        uint8 value = uint8((n % 6) + 1);
        emit RollEvent(block.number, n, value);
        return value;
    }
}
```

Mã nguồn trên đại diện cho hợp đồng xí ngầu hoạt động,

* **Chức Năng Cơ Bản (`roll()` function):** Chức năng này mô phỏng một lần lắc xí ngầu. Nó ghi lại số khối hiện tại và tạo ra một giá trị đặc biệt gọi là "salt" từ hàm băm của khối trước, thêm một lớp ngẫu nhiên nữa. Sau đó, VRRF được gọi để tạo ra một số ngẫu nhiên giả, và số này được chuyển đổi thành giá trị từ 1 đến 6, đại diện cho kết quả của lần lắc xí ngầu.
* **Ngẫu Nhiên Tùy Chỉnh (`rollWithSalt()` function):** Chức năng này cung cấp sự kiểm soát nhiều hơn cho các tình huống cụ thể. Người dùng có thể cung cấp giá trị "salt" của riêng mình, ảnh hưởng đến kết quả ngẫu nhiên. Điều này có thể hữu ích trong các trường hợp thử nghiệm, nơi kết quả có thể được mong đợi.

### Nhiệm Vụ - Triển Khai Hợp Đồng Xí Ngầu Trên Viction Testnet 🎲

Bắt đầu bằng cách tải hợp đồng [Dice](https://github.com/POLearn/victionary-everything-about-viction/blob/master/contract/Dice.sol) và tải nó vào IDE bạn chọn. 

![](https://raw.githubusercontent.com/POLearn/victionary-everything-about-viction/refs/heads/master/content/assets/images/dice_contract.png)

Nhiệm vụ đầu tiên của bạn là chỉnh sửa hợp đồng bằng cách thêm giao diện `IVRRF` ở đầu. Giao diện này cho phép hợp đồng yêu cầu sự ngẫu nhiên một cách an toàn từ dịch vụ VRRF của Viction. Tiếp theo, bạn sẽ triển khai chức năng `roll()`, chức năng này sẽ tương tác với VRRF để tạo ra các giá trị ngẫu nhiên—một tính năng thiết yếu cho hợp đồng Xí Ngầu. Nếu bạn cần hướng dẫn, hãy tham khảo [ví dụ trên Viction Testnet](https://testnet.vicscan.xyz/address/0x845B5EaF9D75215E08896a5c96B416640F6b1F55).  

![](https://raw.githubusercontent.com/POLearn/victionary-everything-about-viction/refs/heads/master/content/assets/images/dice_deploy.png)

Sau khi cập nhật mã, biên dịch hợp đồng sử dụng **Phiên bản Solidity 0.8.19**. Lưu ý các lỗi trong quá trình biên dịch và giải quyết chúng. Bước này đảm bảo rằng hợp đồng của bạn sẵn sàng để triển khai trên Viction Testnet.  

*Nếu bạn muốn xem tham khảo, bạn có thể tham khảo [ví dụ triển khai](https://testnet.vicscan.xyz/address/0x845B5EaF9D75215E08896a5c96B416640F6b1F55) trên Viction Testnet.*  

Hãy chắc chắn rằng bạn có đủ **VIC tokens** trong ví của mình để trang trải phí triển khai. Sau khi triển khai, ghi lại địa chỉ hợp đồng và mã giao dịch. Bạn có thể xác minh triển khai của mình trên [Viction Testnet Explorer](https://testnet.vicscan.xyz/).  

Bạn đã triển khai thành công hợp đồng Xí Ngầu trên Viction Testnet! Để hoàn thành nhiệm vụ này, hãy chia sẻ **mã giao dịch** của bạn như là bằng chứng triển khai. Việc này sẽ giúp bạn nhận được phần thưởng đặc biệt **NFT POAP** cho việc hoàn thành khóa học này.