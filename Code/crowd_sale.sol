pragma solidity ^0.5.5;

import "./PupperCoin.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/Crowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/emission/MintedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/validation/CappedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/validation/TimedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/distribution/RefundablePostDeliveryCrowdsale.sol";

contract PupperCoinSale is Crowdsale, MintedCrowdsale, CappedCrowdsale, TimedCrowdsale, RefundablePostDeliveryCrowdsale { 
    constructor( 
    PupperCoin token, 
    address payable wallet,
    uint goal,
    uint rate,
    uint open,
    uint close)
    Crowdsale(rate, wallet, token) 
    CappedCrowdsale(goal)
    RefundableCrowdsale(goal)
    TimedCrowdsale(open, close)

    public {
    }
}

contract PupperCoinSaleDeployer {

    address public token_sale_address;
    address public token_address;
    
    uint fakenow = now; 
    
    //function fastforward() public {
    //        now += 5 minutes;
    //    }
        

    constructor(
        address payable wallet,
        string memory name,
        string memory symbol,
        uint goal
        )
        
        public
    {
        
        PupperCoin token = new PupperCoin(name, symbol, 0);
        token_address = address(token);
        
        PupperCoinSale token_sale = new PupperCoinSale(token, wallet, goal, 1, now, now + 5 minutes);
        token_sale_address = address(token_sale);

        token.addMinter(token_sale_address);
        token.renounceMinter();
    }
}