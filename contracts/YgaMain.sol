//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/VRFConsumerBaseV2.sol";
import "@chainlink/contracts/src/v0.8/interfaces/VRFCoordinatorV2Interface.sol";
import "@chainlink/contracts/src/v0.8/KeeperCompatible.sol";

contract YgaMain is VRFConsumerBaseV2, KeeperCompatible {
    VRFCoordinatorV2Interface COORDINATOR;
    uint64 subscriptionId;

    bytes32 constant keyHash = 0x354d2f95da55398f44b7cff77da56283d9c6c829a4bdf1bbcaf2ad6a4d081f61;
    address constant vrfCoordinator = 0x2eD832Ba664535e5886b75D64C46EB9a228C2610;
    uint16 constant requestConfirmations = 3;
    uint32 constant callbackGasLimit = 120000;
    uint32 constant numWords = 1;
    uint256 public lastRandomWord;

    //vrf subscription id: 429 (Fuji Testnet)
    constructor(uint64 _subscriptionId) VRFConsumerBaseV2(vrfCoordinator) {
        COORDINATOR = VRFCoordinatorV2Interface(vrfCoordinator);
        subscriptionId = _subscriptionId;
    }

    function requestRandomWords() public {
        COORDINATOR.requestRandomWords(
        keyHash,
        subscriptionId,
        requestConfirmations,
        callbackGasLimit,
        numWords
        );  
    }

    function fulfillRandomWords(
        uint256, /* requestID */
        uint256[] memory randomWords
    ) internal override {
        lastRandomWord = randomWords[0];
    }

    function checkUpkeep(bytes calldata checkData) external view override returns (bool upkeepNeeded, bytes memory performData) {
        if (keccak256(checkData) == keccak256(hex'01')) {
            upkeepNeeded = address(this).balance > 1000000000000000;
            performData = checkData; 
        }          
    }

     function performUpkeep(bytes calldata performData) external override{
        if(keccak256(performData) == keccak256(hex'01') && 
            (address(this).balance > 1000000000000000))
             {
            //calls for random number when ether balance reaches a certain threshold
            requestRandomWords();
        }
    }

}

