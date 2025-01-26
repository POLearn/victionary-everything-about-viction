### VRC725 NFT कॉन्ट्रैक्ट को Viction Testnet पर डिप्लॉय करना

चूंकि हम VRC725 के बारे में समझ चुके हैं, आइए हम इस मानक का उपयोग करके एक NFT कॉन्ट्रैक्ट डिप्लॉय करें। हम यह कॉन्ट्रैक्ट Viction के आधिकारिक रिपॉजिटरी से लेंगे। `NFTMock.sol` कॉन्ट्रैक्ट **VRC725Enumerable** का उपयोग करता है, जो ERC721 के समान कार्यक्षमता प्रदान करता है, लेकिन VRC725 के लिए इसे विशेष रूप से अनुकूलित किया गया है, जिससे मिंटिंग, ट्रांसफर, और अनुमोदन की क्षमताओं के साथ-साथ VRC725 के अद्वितीय अनुमति कार्यक्षमताएँ शामिल हैं। 

`NFTMock` कॉन्ट्रैक्ट `VRC725Enumerable` से विरासत में प्राप्त करता है, जो VRC725 मानक को अतिरिक्त enumerable क्षमताओं के साथ लागू करता है। कॉन्ट्रैक्ट का इनिशियलाइजेशन ERC721 के समान पैटर्न का पालन करता है, लेकिन VRC725 के लिए यह `__VRC725_init` का उपयोग करता है ताकि उचित सेटअप किया जा सके। डिप्लॉयमेंट के बाद, ABI में सभी ERC721 विधियाँ शामिल होंगी, जिससे मिंटिंग, ट्रांसफर, अनुमोदन, और अतिरिक्त अनुमति कार्यक्षमताएँ उपलब्ध होंगी।

आइए एक व्यावहारिक उदाहरण के रूप में VRC725 टोकन मानक को Viction ब्लॉकचेन पर डिप्लॉय करें। पूरा स्रोत कोड Viction रिपॉजिटरी से प्राप्त किया जा सकता है: [https://github.com/BuildOnViction/vrc725/blob/main/contracts/tests/NFTMock.sol](https://github.com/BuildOnViction/vrc725/blob/main/contracts/tests/NFTMock.sol)

```solidity
contract NFTMock is VRC725Enumerable {
    constructor(string memory name, string memory symbol, address issuer) {
        __VRC725_init(name, symbol, issuer);
    }

    function mint(address owner, uint256 tokenId) external onlyOwner {
        _safeMint(owner, tokenId);
    }
}
```

## Quest - V725 डिप्लॉय करें

आप ऊपर दिए गए कॉन्ट्रैक्ट को किसी इच्छित IDE या वातावरण में लोड कर सकते हैं और `NFTMock.sol` को **Solidity संस्करण 0.8.19** का उपयोग करके संकलित करें और कॉन्ट्रैक्ट को डिप्लॉय करें।

![](https://raw.githubusercontent.com/POLearn/victionary-everything-about-viction/refs/heads/master/content/assets/images/vrc25_contract.png)

![](https://raw.githubusercontent.com/POLearn/victionary-everything-about-viction/refs/heads/master/content/assets/images/vrc725_deploy.png)

फिर कॉन्ट्रैक्ट को डिप्लॉय करने के लिए, इसके टोकन पैरामीटर के रूप में निम्नलिखित प्रदान करें:
- **नाम:** "POL VRC725"  
- **सिंबोल:** "POL"  
- **इशूअर पता:** `0x8c0faeb5c6bed2129b8674f262fd45c4e9468bee`  

यह महत्वपूर्ण है कि ध्यान में रखें कि कॉन्ट्रैक्ट को Viction Issuer कॉन्ट्रैक्ट में पंजीकृत किया जाना चाहिए। इस मामले में, इसका पता `0x8c0faeb5c6bed2129b8674f262fd45c4e9468bee` है। हम इसे और विस्तार से देखेंगे, लेकिन मूल रूप से, कॉन्ट्रैक्ट मालिक को अपने उपयोगकर्ताओं के लिए गैस शुल्क का समर्थन और प्रायोजन करने के लिए 10+ $VIC जमा करना होगा। इशूअर पते को प्रदान करने से उपयोगकर्ता इंटरएक्ट कर सकते हैं और गैसलैस अनुभव प्राप्त कर सकते हैं, जिससे टोकन और NFTs के लिए बिना गैस शुल्क के अनुभव प्राप्त होता है।

एक बार डिप्लॉय होने के बाद, आपका VRC725 NFT कॉन्ट्रैक्ट Viction Testnet पर NFTs के संचालन को क्रांतिकारी रूप से बदलने के लिए तैयार है। क्वेस्ट पूरा करने और अपनी उपलब्धि को प्रदर्शित करने के लिए अपना ट्रांजेक्शन हैश सबमिट करना न भूलें! 🎉