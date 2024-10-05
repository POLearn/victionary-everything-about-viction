## Example Smart Contract: Dice Game
Below is an example of a Dice game smart contract that uses VRRF to roll a dice called `Dice.sol`. 

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

Here, we can define the **VRRF** and place it in the constructor: `IVRRF public immutable vrrf;`. Once the contract is compiled, depending on the Viction network you are deploying to, you'll need to pass the address. For this guide, we'll be deploying to Viction Testnet (89). Details to add to the testnet can be found [here](https://docs.viction.xyz/developer-guide/deploy-on-viction/viction-testnet). Afterward, we can use the testnet **VRRF** (`0xDb14c007634F6589Fb542F64199821c3308A9d92`) to define it in the Dice contract.