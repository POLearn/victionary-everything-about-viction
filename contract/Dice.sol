// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.19;

interface IVRRF {
    /**
     * @notice Get pseudo-random number base on provided seed
     * @param salt Random data as an additional input to harden the random
     */
    function random(bytes32 salt) external returns (bytes32);
}

/**
 * @dev Following VRRF address in Viction:
 * @notice Mainnet: 0x53eDcf19e4fb242c9957CB449d2d4106fD760A7F
 * @notice Testnet: 0xDb14c007634F6589Fb542F64199821c3308A9d92
 * Deployed: 0x442c9b1B3058944A71a4B4DC67805532348791DE
 */
contract Dice {
    IVRRF public immutable vvrf;

    event RollEvent(uint256 timestamp, uint256 n, uint256 value);

    constructor(address _vvrf) {
        vvrf = IVRRF(_vvrf);
    }
}