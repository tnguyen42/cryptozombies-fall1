require("@nomiclabs/hardhat-waffle");

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
	solidity: "0.8.9",
	networks: {
		ropsten: {
			url: `https://eth-ropsten.alchemyapi.io/v2/${alchemy_api_key}`,
			accounts: [`0x${private_key}`],
		},
	},
};
