## Zero Gas प्रोटोकॉल के लिए आवेदन करें

जब आप अपना VRC25 Viction पर तैनात या रजिस्टर करते हैं, तो यह स्वचालित रूप से गैसलैस लेन-देन के लिए योग्य नहीं होगा। इस सुविधा को सक्षम करने के लिए, आपको *Zero Gas प्रोटोकॉल* के लिए आवेदन करना होगा। इस खंड में, हम VicIssuer स्मार्ट कॉन्ट्रैक्ट के माध्यम से इसे प्राप्त करने के तरीके का अन्वेषण करेंगे, जिससे VIC Issuer के आंतरिक कार्यों पर प्रकाश डाला जाएगा।

इसके साथ पालन करने के लिए, VIC Issuer कॉन्ट्रैक्ट को लोड करें, संकलित करें और पहले बताए गए जारीकर्ता पते का उपयोग करके इसे तैनात करें। टेस्टनेट के लिए, `0x8c0faeb5c6bed2129b8674f262fd45c4e9468bee` का उपयोग करें।

![](https://raw.githubusercontent.com/POLearn/victionary-everything-about-viction/refs/heads/master/content/assets/images/issuer_contract.png)

*वैकल्पिक रूप से, आप इसे हमारे IDE के माध्यम से सीधे एक्सेस कर सकते हैं - [https://solide0x.tech/address/89/0x8c0faeb5c6bed2129b8674f262fd45c4e9468bee](https://solide0x.tech/address/89/0x8c0faeb5c6bed2129b8674f262fd45c4e9468bee)*

IDE में लोड होने के बाद, `minCap` मान को कॉल करें। इसे `10000000000000000000` पर सेट किया जाना चाहिए, जो 10 VIC टोकन के बराबर है। ये टोकन गैसलैस लेन-देन के लिए आवेदन करने के लिए जमा के रूप में आवश्यक हैं। इस मान का महत्व है क्योंकि इसे `apply` को कॉल करते समय `msg.value` के रूप में पास किया जाना चाहिए और इस प्रकार VRC25 टोकन को Zero Gas इंटीग्रेशन पर लागू किया जाएगा।

```
10 $VIC * 18 (दशमलव) = 10000000000000000000 wei
```

![](https://raw.githubusercontent.com/POLearn/victionary-everything-about-viction/refs/heads/master/content/assets/images/issuer_mincap.png)

## क्वेस्ट - अपने VRC25 को VicIssuer में आवेदन करें

![](https://raw.githubusercontent.com/POLearn/victionary-everything-about-viction/refs/heads/master/content/assets/images/issuer_apply.png)

आप अपना VRC25 टोकन तैनात करके और `apply` विधि को कॉल करके गैसलैस लेन-देन सक्षम कर सकते हैं। यह प्रक्रिया टोकन को गैसलैस ऑपरेशन्स को समर्थन करने की अनुमति देती है, जिससे लेन-देन और अधिक सुगम और उपयोगकर्ता-मित्रवत हो जाते हैं। इस कदम के दौरान 10 VIC का जमा करना सुनिश्चित करें, जिसे गैस शुल्कों को प्रायोजित करने के लिए उपयोग किया जाएगा। यह सुनिश्चित करता है कि सभी लेन-देन गैसलैस रहें, जिससे उपयोगकर्ता अनुभव बढ़ता है।

आप (या कोई अन्य) बाद में इस जमा को कर सकते हैं, लेकिन प्रारंभिक तैनाती के दौरान इसे शामिल करना सलाहकार है। आप यह सुनिश्चित करने के लिए ब्लॉकचेन एक्सप्लोरर में विवरण की जांच कर सकते हैं कि आपका VRC25 टोकन गैसलैस लेन-देन के लिए सफलतापूर्वक सेटअप हो चुका है।

#### टोकन सत्यापन

यदि आप `tokens()` विधि को कॉल करते हैं, तो आप अपने टोकन की VIC Issuer की सूची में समावेश की पुष्टि कर सकते हैं। आपका लागू किया गया टोकन पता लौटाई गई सूची में दिखाई देना चाहिए। सुनिश्चित करें कि आपके द्वारा आवेदन किए गए टोकन का पता टोकन सूची में है।

![](https://raw.githubusercontent.com/POLearn/victionary-everything-about-viction/refs/heads/master/content/assets/images/issuer_tokens.png)

यदि सब कुछ सही सेटअप है, तो आप अपने टोकन की स्थिति **Issuer Dashboard** पर भी सत्यापित कर सकते हैं। मुख्यनेट के लिए [https://issuer.viction.xyz](https://issuer.viction.xyz) या टेस्टनेट के लिए [https://issuer-testnet.viction.xyz](https://issuer-testnet.viction.xyz) पर जाएं।

संदर्भ के लिए, यहाँ इस पाठ्यक्रम के दौरान लागू किया गया टोकन है:  
[उदाहरण लागू टोकन](https://issuer-testnet.viction.xyz/token/0xbba5098BF9c7726EC69C7BE3AE35C10DDC0B866a)

![](https://raw.githubusercontent.com/POLearn/victionary-everything-about-viction/refs/heads/master/content/assets/images/issuer_dashboard.png)

## क्या हुआ?

गैसलैस टोकन बनाने का एक महत्वपूर्ण पहलू है टोकन को VicIssuer में *आवेदन* करना। इसका मतलब है, टोकन पते को सेट करना।

```solidity
function apply(address token) public payable onlyValidCapacity(token) {
    AbstractTokenTRC21 t = AbstractTokenTRC21(token);
    require(t.issuer() == msg.sender);
    _tokens.push(token);
    tokensState[token] = tokensState[token].add(msg.value);
    emit Apply(msg.sender, token, msg.value);
}
```

`लाइन 98` में `apply` का कार्यान्वयन है। ध्यान दें कि केवल टोकन मालिक (या `issuer`) ही टोकन को Issuer में आवेदन कर सकता है। इसके बाद, हम देखते हैं कि टोकन को `_tokens` में जोड़ा जाता है, जो सभी रजिस्टर्ड गैसलैस टोकन की सूची है, और जारी किए गए राज्य (`tokensState`) को प्रदान की गई Ether राशि (`msg.value`) से अपडेट किया जाता है। यह कदम प्रभावी रूप से टोकन जारीकर्ता को `VRC25Issuer` कॉन्ट्रैक्ट में रजिस्टर करता है, जिससे टोकन प्रबंधन और शुल्क चार्जिंग से संबंधित बाद की प्रक्रियाओं को सक्षम किया जाता है।