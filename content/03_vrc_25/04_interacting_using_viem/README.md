
## Interacting with VRC25 Using Viem

Welcome! In this guide, we’ll walk you through how to connect and interact with a VRC25 token smart contract using Viem. Viem is a powerful JavaScript library that makes it easy to communicate with Ethereum-compatible blockchains, providing a user-friendly way to work with smart contracts directly from your web application.

To get started with Viem, you’ll first need to install it in your project. Viem is available as an npm package, making it simple to add to any JavaScript or TypeScript project.

```bash
npm install viem
```

### Setting Up a Client to Interact and Connect to Viction

The next step is to set up a client that will allow you to connect to a Viction. This setup allows developers or users to send transactions, call smart contract functions, and accessing chain data.

Here’s how it looks in code:

```typescript
import { createPublicClient, http } from 'viem';
import { viction, victionTestnet } from 'viem/chains';

const client = createPublicClient({
  chain: victionTestnet, // Change to 'viction' for mainnet
  transport: http()
});
```

This client is now ready for you to interact with smart contracts, send transactions, and retrieve blockchain data. You can now begin querying the chain, making calls to the VRC25 contract, or working with other smart contract functions.

### Reading Data from a VRC25 Contract

Now that your client is connected, let’s dive into reading data from a VRC25 contract. In this section, we'll show you how to read the balance of a specific address by calling the balance function on a deployed VRC25 contract. Viem makes it simple to interact with contracts by providing a readContract method that we can configure to read any public data on the blockchain.

```typescript
import { client } from './client'
import { vrc25Abi } from './abi'
import { contract } from './contract'

const data = await publicClient.readContract({
    address: contract,
    abi: vrc25Abi,
    functionName: 'balance',
    args: ['0xd8dA6BF26964aF9D7eEd9e03E53415D37aA96045']
})
```

### Setting up wallet client

To start interacting with a VRC25 contract in viem, we cab use the `createWalletClient`. This setup enables secure access to the wallet within a web application using a custom transport such as Metamask, allowing for sending transactions or signing messages from the browser.

```typescript
import { createWalletClient, custom, http } from 'viem'
import { privateKeyToAccount } from 'viem/accounts'
import { viction, victionTestnet } from 'viem/chains'
 
export const walletClient = createWalletClient({
  chain: mainnet,
  transport: custom(window.ethereum)
})
```

### Interacting with a VRC25 Contract

The `writeContract` function in Viem allows us to send transactions to a smart contract, enabling us to perform state-changing operations, like minting new tokens on the VRC25 contract. In this example, we’re using `walletClient.writeContract()` to call the `mint` function. If you run this code, since we connect via Metamask with as our transpot, the transaction confirmation should be made via the Metamask browser and is processed on-chain, and the newly minted tokens are added to the specified address. This approach provides a simple, reusable way to interact with contract functions that require transactions.

```typescript
import { walletClient } from './config'
import { vrc25Abi } from './abi'
import { contract } from './contract'

await walletClient.writeContract({
    address: contract,
    abi: vrc25Abi,
    functionName: 'mint',
    args: ["0xd8dA6BF26964aF9D7eEd9e03E53415D37aA96045", 69420],
})
```

With all this, integration with Viem and Viction can integrated in React-based or web base DApp is a powerful way to interact with Viction network. It allows developers every simple setup and low build size whilst efficienct for perform actions like read and writing smart contracts. With just a few lines of code, you can connect your app to the blockchain and use the contract’s ABIs to interact with it. Viem makes it simple to build a Web3 DApp that’s interactive and responsive. This setup helps create smooth user experiences, whether you’re working with tokens or any other smart contract functionality, all within a React app!