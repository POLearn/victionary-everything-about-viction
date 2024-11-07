## VRC25

In this section, let's introduce the VRC25, extension of token standard  designed to make Viction transactions simpler and more accessible by enabling gasless transfers. This means users no longer need native tokens for transaction fees; instead, they can use VRC25 tokens, simplifying the process and making it more user-friendly, especially for newcomers to the blockchain. A key highlight is that VRC25 allows smart contracts to sponsor transaction fees, enhancing their functionality and demonstrating Viction's focus on user-centric solutions. While retaining the familiar ERC20 structure for compatibility, VRC25 improves the user experience by streamlining token transfers and fee management, making blockchain more accessible.

*For the official overview of the VRC25 specification, take a look at Viction's VRC25 Documentation: [VRC25 Specification](https://docs.viction.xyz/developer-guide/standards-and-specification/vrc25-specification).*

## Comparison between VRC25/ERC20 

Before going to a pratical application VRC25, let's break down VRC25 and see advantages and disadvantage familiar popular Ethereum standard, **ERC20**. At first glance, the IVRC25 interface in Solidity may look a lot like IERC20, which makes sense, as VRC25 was designed for compatibility and ease of adoption. Take a look at the VRC25 code below:

```solidity
interface IVRC25 {
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
    event Fee(address indexed from, address indexed to, address indexed issuer, uint256 value);

    function decimals() external view returns (uint8);
    function totalSupply() external view returns (uint256);
    function balanceOf(address owner) external view returns (uint256);
    function issuer() external view returns (address);
    function allowance(address owner, address spender) external view returns (uint256);
    function estimateFee(uint256 value) external view returns (uint256);
    function transfer(address recipient, uint256 value) external returns (bool);
    function approve(address spender, uint256 value) external returns (bool);
    function transferFrom(address from, address to, uint256 value) external returns (bool);
}
```

When comparing this to a simplified `ERC20.sol` interface, you'll notice that the methods are largely similar:

```solidity
interface IERC20 { 
    function totalSupply() external view returns (uint256); 
    function balanceOf(address account) external view returns (uint256); 
    function transfer(address recipient, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256); 
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool); 
}
```

The `IVRC25` interface presents a structure that's instantly recognizable to anyone familiar with ERC20. It includes functions like `totalSupply`, `balanceOf`, `transfer`, `allowance`, `approve`, and `transferFrom`, preserving the core capabilities that guarantee compatibility and simplicity of integration. These functions enable fundamental token operations such as checking balances, transferring tokens, and managing allowances, ensuring that all essential functionalities for token management are well-supported.
