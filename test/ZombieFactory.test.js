const { expect, should } = require("chai");
const { ethers } = require("hardhat");
// require("chai").should();

describe("ZombieFactory", () => {
	let ZombieFactory;
	let user1;
	let user2;

	beforeEach(async () => {
		ZombieFactory = await ethers.getContractFactory("ZombieFactory");
		[user1, user2] = await ethers.getSigners();

		zombieFactory = await ZombieFactory.deploy();
	});

	it("should be able to create new zombies", async () => {
		await zombieFactory.createRandomZombie("Jad");
		const zombies = await zombieFactory.getZombies();
		console.log(zombies);

		expect(zombies.length).to.equal(1);
	});
});
