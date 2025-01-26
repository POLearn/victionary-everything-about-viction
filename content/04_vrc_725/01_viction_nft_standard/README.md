# IVRC725 इंटरफेस का अन्वेषण

`IVRC725` इंटरफेस VRC725 टोकन की मुख्य कार्यात्मकताओं को परिभाषित करता है। आइए दो प्रमुख कार्यों में गहराई से देखें:

```solidity
interface IVRC725 is IERC721, IERC4494, IERC721Metadata {
    function permitForAll(address owner, address spender, uint256 deadline, bytes memory signature) external;
    function nonceByAddress(address owner) external view returns(uint256);
}
```

`permitForAll` फ़ंक्शन उपयोगकर्ताओं को ऑफ-चेन सिग्नेचर के माध्यम से NFT ट्रांसफर के लिए गैसलेस अनुमतियाँ प्रदान करने की अनुमति देता है, जिससे लागत-कुशल, उपयोगकर्ता-मित्र इंटरएक्शन सुनिश्चित होते हैं और एक सुरक्षित नॉनस मैकेनिज़्म को शामिल किया जाता है जो रिप्ले हमलों को रोकता है। `nonceByAddress` फ़ंक्शन प्रत्येक मालिक के लिए नॉनस को ट्रैक करता है, जिससे ट्रांजेक्शन सुरक्षा और बढ़ जाती है और पुराने सिग्नेचर के पुन: उपयोग को रोका जाता है।

## `permitForAll`

```solidity
function permitForAll(address owner, address spender, uint256 deadline, bytes memory signature) external {
    require(deadline >= block.timestamp, 'VRC725: Permit deadline expired');
    bytes32 digest = _getPermitForAllDigest(spender, _noncesByAddress[owner], deadline);

    (address recoverAddress,, ) = ECDSA.tryRecover(digest, signature);
    require(
        recoverAddress == owner || SignatureChecker.isValidSignatureNow(owner, digest, signature),
        "VRC725: Invalid permit signature"
    );

    _setApprovalForAll(owner, spender, true);

    _noncesByAddress[owner]++;
}
```

IVRC725 `permitForAll` का मुख्य कार्यान्वयन `ECDSA.tryRecover` का उपयोग करता है जिससे सिग्नेचर और डाइजेस्ट से पता निकाला जाता है, जो `recoverAddress` का परिणाम होता है। इस पते को मालिक के पते से मेल खाना चाहिए यदि सिग्नेचर मान्य है। यह `require` स्टेटमेंट द्वारा सुनिश्चित किया जाता है, जो यह पुष्टि करता है कि `recoverAddress` या `signature` मालिक से मेल खाता है, इस प्रकार यह प्रमाणित करता है कि अनुमति वास्तव में मालिक द्वारा अधिकृत है।

इसके अतिरिक्त, **नॉनस** यहां मैन्युअल रूप से बढ़ाया जाता है ताकि रिप्ले हमलों को रोका जा सके और यह सुनिश्चित किया जा सके कि प्रत्येक अनुमति अनुरोध अद्वितीय है। चूंकि मालिक का पता डाइजेस्ट में शामिल होता है, प्रत्येक बार जब यह विधि कॉल की जाती है, नॉनस बढ़ता है, जिससे पुराने सिग्नेचर अमान्य हो जाते हैं। यह यह सुनिश्चित करता है कि प्रत्येक सिग्नेचर केवल एक बार ही इस्तेमाल किया जा सकता है, जिससे NFT की सुरक्षा बढ़ती है।

## `nonceByAddress`

```solidity
function nonceByAddress(address owner) external view returns(uint256) {
    return _noncesByAddress[owner];
}
```

जैसा कि पहले उल्लेख किया गया है, नॉनस प्रत्येक टोकन और पते के लिए जारी अनुमतियों की संख्या को ट्रैक करने के लिए उपयोगी है। VRC725 कार्यान्वयन में, इसे एक `mapping` के रूप में एक पते से `uint256` संख्या में संग्रहित किया जाता है, जो कॉल्स की संख्या को सूचित करता है। यह अनुबंध के भीतर अनुमतियों की प्रक्रिया के सुरक्षा और सत्यनिष्ठा को बढ़ाता है।