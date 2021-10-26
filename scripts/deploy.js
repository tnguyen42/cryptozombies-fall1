async function main() {
	const [deployer] = await ethers.getSigners();

	console.log("Deploying contracts with the account:", deployer.address);

	console.log("Account balance:", (await deployer.getBalance()).toString());

	const ZombieFeeding = await ethers.getContractFactory("ZombieFeeding");
	const zombieFeeding = await ZombieFeeding.deploy();

	console.log("Contract address:", zombieFeeding.address);
}

main()
	.then(() => process.exit(0))
	.catch((error) => {
		console.error(error);
		process.exit(1);
	});
