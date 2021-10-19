// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.0 <0.9.0;

contract ZombieFactory {
	event NewZombie(uint256 zombieId, string name, uint256 dna);

	uint256 dnaDigits = 16;
	uint256 dnaModulus = 10**dnaDigits;

	struct Zombie {
		string name;
		uint256 dna;
	}

	Zombie[] public zombies;

	/**
	 * @dev Creates a new zombie and adds it to the zombies array
	 * @param _name The name of the zombie to be created
	 * @param _dna The dna of the zombie to be created
	 */
	function _createZombie(string memory _name, uint256 _dna) private {
		zombies.push(Zombie(_name, _dna));

		uint256 id = zombies.length - 1;
		emit NewZombie(id, _name, _dna);
	}

	/**
	 * @dev Generates a pseudo-random DNA from an string variable
	 * @param _str The string from which to generate a pseudo-random number
	 * @return A pseudo random number with the dna format
	 */
	function _generateRandomDna(string memory _str)
		private
		view
		returns (uint256)
	{
		uint256 rand = uint256(keccak256(bytes(_str)));

		return rand % dnaModulus;
	}

	/**
	 * @dev Creates a new zombie from a name and adds it to the zombies array
	 * @param _name The name of the zombie to be created
	 */
	function createRandomZombie(string memory _name) public {
		uint256 randDna = _generateRandomDna(_name);

		_createZombie(_name, randDna);
	}

	/**
	 * @dev Returns the array of all the zombies
	 * @return The array of all the zombies
	 */
	function getZombies() public view returns (Zombie[] memory) {
		return zombies;
	}
}
