//svencoins Ico run on remix ethereum

//Version of compiler
pragma solidity ^0.4.11;

contract svencoin_ico {

    // Introducing the maximum number of svencoins for sale
    uint public max_svencoins = 1000000;

    // Introducing the USD to svencoins conversion rate
    uint public usd_to_svencoins = 1000;

    // Introducing the total number of svencoins that have been bought by the investors
    uint public total_svencoins_bought = 0;

    // Mapping from the investors address to its equity in svencoins and USD
    // Mapping is like a function but its data is an array, the funciton has an input variable like the investors address and returns for each of these addresses the equity.
    // the variable return is the equity and we call this variable equity_svencoins.
    mapping(address => uint) equity_svencoins;
    mapping(address => uint) equity_usd;

    // Checking if an investor can buy svencoins
    //
    modifier can_buy_svencoins(uint usd_invested) {
        require (usd_invested * usd_to_svencoins + total_svencoins_bought <= max_svencoins);
        _; // the function which will use the modifier will only be applied if the require is true.
    }

    // Getting the equity in svencoins of an investor
    function equity_in_svencoins(address investor) external constant returns (uint) {
        return equity_svencoins[investor];
    }

    // Getting the equity in USD of an investor
    function equity_in_usd(address investor) external constant returns (uint) {
        return equity_usd[investor];
    }

    // Buying svencoins
    function buy_svencoins(address investor, uint usd_invested) external
    can_buy_svencoins(usd_invested) {
        uint svencoins_bought = usd_invested * usd_to_svencoins;
        equity_svencoins[investor] += svencoins_bought;
        equity_usd[investor] = equity_svencoins[investor] / 1000;
        total_svencoins_bought += svencoins_bought;
    }

    // Selling Hadcoins
    function sell_svencoins(address investor, uint svencoins_sold) external {
        equity_svencoins[investor] -= svencoins_sold;
        equity_usd[investor] = equity_svencoins[investor] / 1000;
        total_svencoins_bought -= svencoins_sold;
    }

}
