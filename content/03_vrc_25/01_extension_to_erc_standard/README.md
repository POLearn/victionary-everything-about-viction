# Diving Deeper into VRC25

Now that we understand the core principles of VRC25 and its similarities to ERC20, let's explore two key functions that differentiate VRC25 and enhance its functionality: `issuer()` and `estimateFee()`.

## `issuer()`

```solidity
function issuer() external view returns (address);
```

The `issuer` function verifies the address of the token issuer, ensuring only the designated issuer can manage transaction fees. This adds a layer of security and accountability, maintaining the token's integrity.
* **Ensure authenticity:** Verify the genuine source of the token and its associated fee management.
* **Enhance trust:** Build trust within the ecosystem by clearly defining the entity responsible for managing transaction fees.

### `estimateFee()`


```solidity
function estimateFee(uint256 value) external view returns (uint256);
```

The `estimateFee` function calculates the transaction fee in VRC25 tokens, which is payable to the token issuer. This function allows for customized fee structures, enhancing flexibility for issuers.
* **Calculate transaction costs:** Before initiating a transaction, users can estimate the associated VRC25 fee. This provides valuable information for budgeting and financial planning.
* **Customize fee structures:** Issuers can dynamically adjust fee structures based on various factors, such as transaction volume or network congestion.
* **Enhance transparency:** By providing an estimate of transaction fees upfront, VRC25 promotes transparency and user trust.
