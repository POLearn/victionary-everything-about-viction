# Build with Viction's VRRF

This guide explains how to get random values using a simple contract to request and receive random values from the Viction Verifiable Relatively Random Function (VRRF). The VRRF provides a lightweight, manipulation-resistant random number generator that is ideal for blockchain applications.

## What is VRRF?

VRRF (Verifiable Relatively Random Function) is a pseudo-random number generator designed for blockchain applications, offering verifiable and manipulation-resistant random numbers. Its key features include deterministic outputs for the same inputs (verifiable), the use of previous results combined with on-chain parameters and user-provided salt for unpredictability (relatively random), resistance to manipulation, and quick, on-chain processing within a single transaction. While not perfect in probability distribution, VRRF provides a lightweight solution ideal for applications needing secure and fair random number generation. [Full documentation](https://docs.viction.xyz/developer-guide/smart-contract-development/vrrf).

## Setup your contract for VRRF

```solidity
interface IVRRF {
  /**
   * @notice Get pseudo-random number base on provided seed
   * @param salt Random data as an additional input to harden the random
   */
  function random(bytes32 salt) external returns(bytes32);
}
```

To integrate the VRRF on Viction into your smart contract, you need to interact with the `IVRRF` interface. This interface provides a random function that returns a 256-bit pseudo-random number based on a provided salt. Below is a step-by-step guide on how to set up your contract to use VRRF. 

| Network  | Address                                      |
|----------|----------------------------------------------|
| Mainnet  | 0x53eDcf19e4fb242c9957CB449d2d4106fD760A7F   |
| Testnet  | 0xDb14c007634F6589Fb542F64199821c3308A9d92   |