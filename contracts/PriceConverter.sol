// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

library PriceConverter {
    function getConversionRate(
        uint256 ethAmount,
        AggregatorV3Interface priceFeed
    ) internal view returns (uint256) {
        (, int256 p, , , ) = priceFeed.latestRoundData();
        uint256 price = uint256(p * 1e10);
        return (ethAmount * price) / 1e18;
    }
}
