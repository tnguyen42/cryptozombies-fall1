require("@nomiclabs/hardhat-waffle");
require("dotenv").config();

const alchemy_api_key = process.env.alchemy_api_key;
const private_key = process.env.private_key;

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
	solidity: "0.8.0",
	networks: {
		ropsten: {
			url: `https://eth-ropsten.alchemyapi.io/v2/${alchemy_api_key}`,
			accounts: [`0x${private_key}`],
		},
	},
};
