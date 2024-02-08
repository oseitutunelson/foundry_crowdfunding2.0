## CrowdFunding Contract

# Overview
This is a smart contract for a crowdfunding platform built on the Ethereum blockchain. It allows users to create campaigns, fund them, and withdraw funds if the campaign is successful or if the deadline has passed without reaching the funding goal.
It uses chainlink Automation to achieve this

# Features
- Campaigns can be created with a name, description, funding goal, and deadline.
- Users can fund campaigns with Ether, as long as the amount is equal to or greater than a minimum amount (5 USD).
- If a campaign reaches its funding goal before the deadline, it is considered successful and users can withdraw their funds.
- If the deadline is reached and the funding goal has not been met, funds are sent back to funders.
- The contract uses Chainlink's Price Feeds to convert the amount of Ether sent to USD
- The contract also uses chainlink keepers for automating deadlines