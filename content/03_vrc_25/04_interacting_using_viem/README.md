# VRC25 के साथ इंटरएक्ट करना Viem का उपयोग करके: एक हाथों-हाथ मार्गदर्शिका

इस सेक्शन में, हम Viction ब्लॉकचेन पर VRC25 अनुबंधों के साथ इंटरएक्ट करने के व्यावहारिक पहलुओं पर चर्चा करेंगे। हम Viem का उपयोग करेंगे, जो एक शक्तिशाली JavaScript लाइब्रेरी है, ब्लॉकचेन से कनेक्ट होने और स्मार्ट अनुबंधों के साथ निर्बाध रूप से इंटरएक्ट करने के लिए। 

## Viem स्थापित करना

शुरू करने से पहले, चलिए यह सुनिश्चित करते हैं कि हमारे पास आवश्यक उपकरण हैं। Viem आसानी से एक npm पैकेज के रूप में उपलब्ध है। इसे अपने प्रोजेक्ट में स्थापित करने के लिए, बस अपने टर्मिनल में निम्नलिखित कमांड चलाएं:

```bash
npm install viem
```

## Viction से कनेक्ट करना

अब, हम Viction नेटवर्क से कनेक्शन स्थापित करेंगे। हम Viem की `createPublicClient` फ़ंक्शन का उपयोग करेंगे, ताकि एक क्लाइंट इंस्टेंस बनाया जा सके:

```typescript
import { createPublicClient, http } from 'viem';
import { victionTestnet } from 'viem/chains'; // मुख्यनेट के लिए 'viction' का उपयोग करें

const client = createPublicClient({
  chain: victionTestnet, 
  transport: http()
});
```
यह क्लाइंट Viction ब्लॉकचेन तक पहुँचने का गेटवे है, जो आपको चेन डेटा को क्वेरी करने, लेन-देन भेजने, और स्मार्ट अनुबंधों के साथ इंटरएक्ट करने की अनुमति देता है।

## VRC25 अनुबंध से डेटा पढ़ना

आइए Viem का उपयोग करके VRC25 अनुबंध से डेटा पढ़ने का तरीका दिखाते हैं। हम एक सामान्य उपयोग मामले पर ध्यान केंद्रित करेंगे: एक विशिष्ट पते का टोकन बैलेंस प्राप्त करना। 

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

इस कोड स्निपेट में:

- `publicClient.readContract()` एक शक्तिशाली फ़ंक्शन है जो हमें उन अनुबंध फ़ंक्शनों के साथ इंटरएक्ट करने की अनुमति देता है, जो ब्लॉकचेन की स्थिति को संशोधित नहीं करते।
- हम अनुबंध का पता, उसका ABI (एप्लिकेशन बाइनरी इंटरफ़ेस), फ़ंक्शन का नाम (`balanceOf`), और उस पते को निर्दिष्ट करते हैं, जिसके लिए हम बैलेंस प्राप्त करना चाहते हैं।

## टोकन के साथ इंटरएक्ट करना

उन क्रियाओं को करने के लिए जो ब्लॉकचेन की स्थिति को संशोधित करती हैं (जैसे टोकन मिंटिंग), हमें एक वॉलेट की आवश्यकता होती है। चलिए हम Viem का उपयोग करके एक `walletClient` बनाएंगे:

```typescript
import { createWalletClient, custom, http } from 'viem'
import { privateKeyToAccount } from 'viem/accounts'
import { viction } from 'viem/chains'

export const walletClient = createWalletClient({
  chain: viction, 
  transport: custom(window.ethereum) 
});
```

यह `walletClient` हमें लेन-देन भेजने और ब्लॉकचेन के साथ सुरक्षित रूप से इंटरएक्ट करने की अनुमति देता है।

अब, चलिए हम `writeContract` फ़ंक्शन का उपयोग करके नए टोकन मिंट करते हैं:

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

यह कोड VRC25 अनुबंध को एक लेन-देन भेजता है, जिससे यह 69420 टोकन मिंट करता है और उन्हें निर्दिष्ट पते पर भेजता है। 

Viem Viction और इसके स्मार्ट अनुबंधों के साथ इंटरएक्ट करने के लिए एक उपयोगकर्ता-मित्र और प्रभावी तरीका प्रदान करता है। इन कदमों का पालन करके, आप निर्बाध रूप से ब्लॉकचेन से कनेक्ट हो सकते हैं, डेटा पढ़ सकते हैं, और आसानी से लेन-देन निष्पादित कर सकते हैं। यह आपको Viction नेटवर्क पर नवाचारपूर्ण अनुप्रयोग बनाने के लिए सशक्त बनाता है, साथ ही VRC25 मानक द्वारा प्रदान किए गए सहज लेन-देन अनुभव का लाभ उठाते हुए।