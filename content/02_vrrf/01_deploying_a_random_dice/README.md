## Dice Game

आइए Viction के VRRF का उपयोग करते हुए एक स्मार्ट कॉन्ट्रैक्ट का व्यावहारिक उदाहरण देखें। इस परिदृश्य में, हम एक Dice स्मार्ट कॉन्ट्रैक्ट बनाएंगे जो उपयोगकर्ताओं को एक वर्चुअल डाइस रोल करने की अनुमति देगा और ऑन-चेन 1 और 6 के बीच एक यादृच्छिक परिणाम प्राप्त करेगा। यह एप्लिकेशन यह प्रदर्शित करता है कि कैसे VRRF यह सुनिश्चित करता है कि प्रत्येक रोल निष्पक्ष और सत्यापन योग्य हो, जो ब्लॉकचेन पर एक मैनिपुलेशन-प्रतिरोधी यादृच्छिकता का स्रोत प्रदान करता है। स्मार्ट कॉन्ट्रैक्ट में VRRF को एकीकृत करके, हम यह सुनिश्चित कर सकते हैं कि प्रत्येक खिलाड़ी एक वास्तविक यादृच्छिक डाइस रोल का अनुभव करे।

### कोड 

स्रोत कोड को हमारे IDE में इस [Github स्रोत](https://github.com/POLearn/victionary-everything-about-viction/blob/master/contract/Dice.sol) के साथ लोड किया जा सकता है

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

निम्नलिखित कोड एक कार्यशील डाइस का प्रतिनिधित्व करता है,

* **मुख्य कार्यक्षमता (`roll()` फ़ंक्शन):** यह फ़ंक्शन एक डाइस रोल का अनुकरण करता है। यह वर्तमान ब्लॉक नंबर को कैप्चर करता है और पिछले ब्लॉक के हैश से एक विशेष मान "salt" बनाता है, जो यादृच्छिकता का एक अतिरिक्त परत जोड़ता है। इसके बाद, VRRF को एक pseudo-random संख्या उत्पन्न करने के लिए कॉल किया जाता है, जिसे 1 और 6 के बीच एक मान में परिवर्तित किया जाता है, जो डाइस रोल के परिणाम का प्रतिनिधित्व करता है।
* **कस्टमाइज़ेबल यादृच्छिकता (`rollWithSalt()` फ़ंक्शन):** यह फ़ंक्शन विशिष्ट परिदृश्यों के लिए अधिक नियंत्रण प्रदान करता है। उपयोगकर्ता अपना स्वयं का "salt" मान प्रदान कर सकते हैं, जो यादृच्छिक परिणाम को प्रभावित करता है। यह परीक्षण उद्देश्यों के लिए उपयोगी हो सकता है जहाँ पूर्वानुमान योग्य परिणाम आवश्यक होते हैं।

### Quest - Viction Testnet पर Dice Contract को Deploy करना 🎲

शुरू करें [Dice contract](https://github.com/POLearn/victionary-everything-about-viction/blob/master/contract/Dice.sol) को लोड करके और इसे अपने पसंदीदा IDE में लोड करके।

![](https://raw.githubusercontent.com/POLearn/victionary-everything-about-viction/refs/heads/master/content/assets/images/dice_contract.png)

आपका पहला कार्य है स्मार्ट कॉन्ट्रैक्ट में `IVRRF` इंटरफेस जोड़ना। यह इंटरफेस स्मार्ट कॉन्ट्रैक्ट को Viction के VRRF सेवा से यादृच्छिकता को सुरक्षित रूप से अनुरोध करने की अनुमति देता है। इसके बाद, आप `roll()` फ़ंक्शन को लागू करेंगे, जो VRRF के साथ इंटरैक्ट करके यादृच्छिक मान उत्पन्न करेगा—जो Dice कॉन्ट्रैक्ट के लिए एक महत्वपूर्ण फीचर है। यदि आपको मार्गदर्शन की आवश्यकता हो, तो आप [Viction Testnet उदाहरण](https://testnet.vicscan.xyz/address/0x845B5EaF9D75215E08896a5c96B416640F6b1F55) देख सकते हैं।

![](https://raw.githubusercontent.com/POLearn/victionary-everything-about-viction/refs/heads/master/content/assets/images/dice_deploy.png)

कोड अपडेट करने के बाद, **Solidity संस्करण 0.8.19** का उपयोग करके कॉन्ट्रैक्ट को संकलित करें। संकलन के दौरान किसी भी त्रुटि पर ध्यान दें और उन्हें हल करें। यह कदम सुनिश्चित करता है कि आपका कॉन्ट्रैक्ट Viction Testnet पर तैनाती के लिए तैयार है। 

*यदि आप एक संदर्भ देखना चाहते हैं, तो आप [Viction Testnet पर एक उदाहरण](https://testnet.vicscan.xyz/address/0x845B5EaF9D75215E08896a5c96B416640F6b1F55) तैनाती देख सकते हैं।*

सुनिश्चित करें कि आपके वॉलेट में पर्याप्त **VIC टोकन** हैं ताकि तैनाती शुल्क को कवर किया जा सके। एक बार तैनात होने के बाद, कॉन्ट्रैक्ट का पता और लेन-देन हैश नोट करें। आप अपने तैनाती को [Viction Testnet Explorer](https://testnet.vicscan.xyz/) पर सत्यापित कर सकते हैं।  

आपने सफलतापूर्वक Viction Testnet पर अपना Dice कॉन्ट्रैक्ट तैनात कर लिया! इस क्वेस्ट को पूरा करने के लिए, **लेन-देन हैश** साझा करें, जो तैनाती का प्रमाण होगा। ऐसा करने से आपको इस कोर्स को पूरा करने के लिए एक विशेष **NFT POAP पुरस्कार** मिलेगा।  