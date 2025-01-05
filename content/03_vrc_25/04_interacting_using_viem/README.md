# Interacting with VRC25 Using Viem: A Hands-on Guide

In this section, we'll dive into the practical aspects of interacting with VRC25 contracts on the Viction blockchain. We'll utilize Viem, a powerful JavaScript library, to connect to the blockchain and seamlessly interact with smart contracts. 

## Installing Viem

Before we begin, let's ensure we have the necessary tools. Viem is readily available as an npm package. To install it within your project, simply execute the following command in your terminal:

```bash
npm install viem
```

## Connecting to Viction

Now, let's establish a connection to the Viction network. We'll utilize Viem's `createPublicClient` function to create a client instance:

```typescript
import { createPublicClient, http } from 'viem';
import { victionTestnet } from 'viem/chains'; // Use 'viction' for mainnet

const client = createPublicClient({
  chain: victionTestnet, 
  transport: http()
});
```
This client acts as your gateway to the Viction blockchain, enabling you to query chain data, send transactions, and interact with smart contracts.

## eading Data from a VRC25 Contract

Let's demonstrate how to read data from a VRC25 contract using Viem. We'll focus on a common use case: retrieving the token balance of a specific address. 

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

In this code snippet:

- `publicClient.readContract()` is a powerful function that allows us to interact with contract functions that don't modify the blockchain's state.
- We specify the contract address, its ABI (Application Binary Interface), the function name (`balanceOf`), and the address for which we want to retrieve the balance.

## Interacting with the Token

To perform actions that modify the blockchain state (e.g., minting tokens), we need a wallet. Let's create a `walletClient` using Viem:

```typescript
import { createWalletClient, custom, http } from 'viem'
import { privateKeyToAccount } from 'viem/accounts'
import { viction } from 'viem/chains'

export const walletClient = createWalletClient({
  chain: viction, 
  transport: custom(window.ethereum) 
});
```

This `walletClient` allows us to send transactions and interact with the blockchain securely.

Now, let's use the `writeContract` function to mint new tokens:

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

This code sends a transaction to the VRC25 contract, instructing it to mint 69420 tokens and send them to the specified address. 

Viem provides a user-friendly and efficient way to interact with Viction and its smart contracts. By following these steps, you can seamlessly connect to the blockchain, read data, and execute transactions with ease. This empowers you to build innovative applications on the Viction network, all while benefiting from the streamlined transaction experience offered by the VRC25 standard.

